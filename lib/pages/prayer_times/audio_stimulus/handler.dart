/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

final _playControl = MediaControl(
  androidIcon: 'drawable/ic_play_arrow_black_24dp',
  label: 'Play',
  action: MediaAction.play,
);
final _pauseControl = MediaControl(
  androidIcon: 'drawable/ic_pause_black_24dp',
  label: 'Pause',
  action: MediaAction.pause,
);
final _stopControl = MediaControl(
  androidIcon: 'drawable/ic_stop_black_24dp',
  label: 'Stop',
  action: MediaAction.stop,
);

class AudioStimulusHandler extends BaseAudioHandler with SeekHandler {
  static AudioStimulusHandler? _instance;

  static AudioStimulusHandler get instance {
    if (_instance == null) {
      throw StateError("init not called");
    }
    return _instance!;
  }

  static Future<void> init() async {
    if (_instance != null) {
      throw StateError("init called twice");
    }

    _instance = await AudioService.init(
      builder: () => AudioStimulusHandler._(),
      config: AudioServiceConfig(
        androidNotificationChannelName: "Einfach gemeinsam beten",
        androidEnableQueue: false,
        androidNotificationIcon: "drawable/ic_notification",
        androidStopForegroundOnPause: true,
      ),
    );
  }

  final _player = AudioPlayer();

  AudioStimulusHandler._() {
    // Broadcast the current playback state and what controls should currently
    // be visible in the media notification
    _player.playbackEventStream.listen((event) {
      playbackState.add((playbackState.value ?? PlaybackState()).copyWith(
        controls: [
          _player.playing ? _pauseControl : _playControl,
          _stopControl,
        ],
        androidCompactActionIndices: [0, 1],
        systemActions: {
          MediaAction.seek,
        },
        processingState: {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        playing: _player.playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
      ));
    });
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> prepareFromUri(Uri uri, [Map<String, dynamic>? extras]) async {
    final url = uri.toString();

    if ((await mediaItem.first)?.id == url) {
      return;
    }

    final duration = await _player.setUrl(url);
    mediaItem.add(MediaItem(
      id: url,
      album: "Einfach gemeinsam beten",
      title: extras?["title"] ?? "",
      duration: duration,
    ));
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    await super.stop();
  }
}
