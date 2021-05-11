/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import '../../../generated/l10n.dart';
import '../../../util/helpers.dart';
import 'handler.dart';

class AudioStimulusPlayer extends StatefulWidget {
  final String url;

  const AudioStimulusPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AudioStimulusPlayerState();
}

class _AudioStimulusPlayerState extends State<AudioStimulusPlayer> {
  final _dragPositionSubject = BehaviorSubject<Duration?>.seeded(null);
  late Stream<Duration?> _seekStream;

  _AudioStimulusPlayerState() {
    _seekStream = Rx.combineLatest2<Duration?, Duration?, Duration?>(
      _dragPositionSubject.stream,
      Stream.periodic(Duration(milliseconds: 200)),
      (dragPosition, _) => dragPosition,
    ).asBroadcastStream();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final title = S.of(context).stimulus_head(DateFormat.yMd().format(DateTime.now().startOfDay));
    AudioStimulusHandler.instance.prepareFromUri(Uri.parse(widget.url), {"title": title});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StreamBuilder<_AudioPlayerState>(
      stream: Rx.combineLatest2(
        AudioStimulusHandler.instance.mediaItem,
        AudioStimulusHandler.instance.playbackState,
        (dynamic mediaItem, dynamic playbackState) => _AudioPlayerState(mediaItem, playbackState),
      ),
      builder: (context, snapshot) {
        final playbackState = snapshot.data?.playbackState;
        final state = playbackState?.processingState;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 64,
                  icon: Icon(
                    Icons.stop,
                    color: theme.primaryColor,
                  ),
                  onPressed: () => AudioStimulusHandler.instance.stop(),
                ),
                if (state == AudioProcessingState.loading || state == AudioProcessingState.buffering)
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (playbackState?.playing == true)
                  IconButton(
                    iconSize: 64,
                    icon: Icon(
                      Icons.pause_circle_filled,
                      color: theme.primaryColor,
                    ),
                    onPressed: () => AudioStimulusHandler.instance.pause(),
                  )
                else
                  IconButton(
                    iconSize: 64,
                    icon: Icon(
                      Icons.play_circle_filled,
                      color: theme.primaryColor,
                    ),
                    onPressed: () => AudioStimulusHandler.instance.play(),
                  ),
                _seekPosition(
                  mediaItem: snapshot.data?.mediaItem,
                  state: snapshot.data?.playbackState,
                ),
              ],
            ),
            _seekBar(
              mediaItem: snapshot.data?.mediaItem,
              state: playbackState,
            )
          ],
        );
      },
    );
  }

  Widget _seekPosition({
    required MediaItem? mediaItem,
    required PlaybackState? state,
  }) {
    return StreamBuilder<Duration?>(
      stream: _seekStream,
      builder: (context, snapshot) {
        final duration = mediaItem?.duration ?? Duration.zero;
        final position = snapshot.data ?? state?.position ?? Duration.zero;

        return Text(
          "${position.format()}/${duration.format()}",
          style: Theme.of(context).textTheme.subtitle1,
        );
      },
    );
  }

  Widget _seekBar({
    required MediaItem? mediaItem,
    required PlaybackState? state,
  }) {
    double? seekPos;
    return StreamBuilder<Duration?>(
      stream: _seekStream,
      builder: (context, snapshot) {
        final duration = mediaItem?.duration?.inSeconds.toDouble();
        final position = (snapshot.data ?? state?.position)?.inSeconds.toDouble() ?? 0.0;

        return Slider(
          min: 0.0,
          max: duration ?? 0,
          value: seekPos ?? max(0.0, min(position, duration ?? 0)),
          onChanged: duration == null
              ? null
              : (value) {
                  _dragPositionSubject.add(Duration(milliseconds: (value * 1000).toInt()));
                },
          onChangeEnd: (value) {
            AudioStimulusHandler.instance.seek(Duration(seconds: value.toInt()));
            seekPos = value;
            _dragPositionSubject.add(null);
          },
        );
      },
    );
  }
}

@immutable
class _AudioPlayerState {
  final MediaItem? mediaItem;
  final PlaybackState playbackState;

  _AudioPlayerState(this.mediaItem, this.playbackState);
}
