// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Actual`
  String get actual {
    return Intl.message(
      'Actual',
      name: 'actual',
      desc: '',
      args: [],
    );
  }

  /// `Actual (min)`
  String get actual_min {
    return Intl.message(
      'Actual (min)',
      name: 'actual_min',
      desc: '',
      args: [],
    );
  }

  /// `All confessional topics were deleted`
  String get all_topics_were_deleted {
    return Intl.message(
      'All confessional topics were deleted',
      name: 'all_topics_were_deleted',
      desc: '',
      args: [],
    );
  }

  /// `If enabled, anonymous user statistics will be collected. For more info take a look at the privacy policy.`
  String get analytics_info {
    return Intl.message(
      'If enabled, anonymous user statistics will be collected. For more info take a look at the privacy policy.',
      name: 'analytics_info',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `At:`
  String get at {
    return Intl.message(
      'At:',
      name: 'at',
      desc: '',
      args: [],
    );
  }

  /// `Attention`
  String get attention {
    return Intl.message(
      'Attention',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `Listen to audio-stimuli of the last few days on credo-online`
  String get audio_stimuli_last_days {
    return Intl.message(
      'Listen to audio-stimuli of the last few days on credo-online',
      name: 'audio_stimuli_last_days',
      desc: '',
      args: [],
    );
  }

  /// `Audio-Stimulus`
  String get audio_stimulus {
    return Intl.message(
      'Audio-Stimulus',
      name: 'audio_stimulus',
      desc: '',
      args: [],
    );
  }

  /// `Average per day`
  String get avg_per_day {
    return Intl.message(
      'Average per day',
      name: 'avg_per_day',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Bible passage`
  String get bible_passage {
    return Intl.message(
      'Bible passage',
      name: 'bible_passage',
      desc: '',
      args: [],
    );
  }

  /// `The passage you looked for were not found. Please check the reference and try again.`
  String get bible_passage_not_found_text {
    return Intl.message(
      'The passage you looked for were not found. Please check the reference and try again.',
      name: 'bible_passage_not_found_text',
      desc: '',
      args: [],
    );
  }

  /// `Passage not found`
  String get bible_passage_not_found_title {
    return Intl.message(
      'Passage not found',
      name: 'bible_passage_not_found_title',
      desc: '',
      args: [],
    );
  }

  /// `Type the location that you want to read!`
  String get bible_reference_advice {
    return Intl.message(
      'Type the location that you want to read!',
      name: 'bible_reference_advice',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `CAUTION`
  String get caution {
    return Intl.message(
      'CAUTION',
      name: 'caution',
      desc: '',
      args: [],
    );
  }

  /// `Communities`
  String get communities {
    return Intl.message(
      'Communities',
      name: 'communities',
      desc: '',
      args: [],
    );
  }

  /// `Experiences from communities`
  String get community_experiences {
    return Intl.message(
      'Experiences from communities',
      name: 'community_experiences',
      desc: '',
      args: [],
    );
  }

  /// `Vocation and more`
  String get community_experiences_sub {
    return Intl.message(
      'Vocation and more',
      name: 'community_experiences_sub',
      desc: '',
      args: [],
    );
  }

  /// `Community select`
  String get community_select {
    return Intl.message(
      'Community select',
      name: 'community_select',
      desc: '',
      args: [],
    );
  }

  /// `Confession`
  String get confession {
    return Intl.message(
      'Confession',
      name: 'confession',
      desc: '',
      args: [],
    );
  }

  /// `By saving you confession, your confession topics will be deleted.`
  String get confession_empty_info {
    return Intl.message(
      'By saving you confession, your confession topics will be deleted.',
      name: 'confession_empty_info',
      desc: '',
      args: [],
    );
  }

  /// `Confession - why and how`
  String get confession_info_sub {
    return Intl.message(
      'Confession - why and how',
      name: 'confession_info_sub',
      desc: '',
      args: [],
    );
  }

  /// `Confesstion Topics Password`
  String get confession_password {
    return Intl.message(
      'Confesstion Topics Password',
      name: 'confession_password',
      desc: '',
      args: [],
    );
  }

  /// `Preparation for confession`
  String get confession_preparation_head {
    return Intl.message(
      'Preparation for confession',
      name: 'confession_preparation_head',
      desc: '',
      args: [],
    );
  }

  /// `Start with a simple request: "Holy Spirit, show me what need things in my life reconciliation. Help me to look at my life honestly. Give me the courage to open up entirely "The most important thing is. Nothing is embarrassing. On the contrary: It deserves the highest respect when someone sincerely confesses his sins. The words of Jesus will help you to look at your life in God's light.`
  String get confession_preparation_paragraph {
    return Intl.message(
      'Start with a simple request: "Holy Spirit, show me what need things in my life reconciliation. Help me to look at my life honestly. Give me the courage to open up entirely "The most important thing is. Nothing is embarrassing. On the contrary: It deserves the highest respect when someone sincerely confesses his sins. The words of Jesus will help you to look at your life in God\'s light.',
      name: 'confession_preparation_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Instructions and questions for reflection`
  String get confession_preparation_sub {
    return Intl.message(
      'Instructions and questions for reflection',
      name: 'confession_preparation_sub',
      desc: '',
      args: [],
    );
  }

  /// `Confession planner`
  String get confession_planner {
    return Intl.message(
      'Confession planner',
      name: 'confession_planner',
      desc: '',
      args: [],
    );
  }

  /// `Plan your next confession`
  String get confession_planner_description {
    return Intl.message(
      'Plan your next confession',
      name: 'confession_planner_description',
      desc: '',
      args: [],
    );
  }

  /// `‚The Lord is compassionate and gracious, slow to anger, abounding in love.‘ (Ps 103,8). You wanted to confess today.`
  String get confession_reminder_message_today {
    return Intl.message(
      '‚The Lord is compassionate and gracious, slow to anger, abounding in love.‘ (Ps 103,8). You wanted to confess today.',
      name: 'confession_reminder_message_today',
      desc: '',
      args: [],
    );
  }

  /// `Save confession`
  String get save_confession {
    return Intl.message(
      'Save confession',
      name: 'save_confession',
      desc: '',
      args: [],
    );
  }

  /// `„Praise the Lord, O my soul, and forget not all his benefits - who forgives all your sins and heals all your diseases, who redeems your life from the pit and crowns you with love and compassion“ (Ps 103,2-4).`
  String get confession_today_text {
    return Intl.message(
      '„Praise the Lord, O my soul, and forget not all his benefits - who forgives all your sins and heals all your diseases, who redeems your life from the pit and crowns you with love and compassion“ (Ps 103,2-4).',
      name: 'confession_today_text',
      desc: '',
      args: [],
    );
  }

  /// `What I want to speak in confession`
  String get confession_topics_sub {
    return Intl.message(
      'What I want to speak in confession',
      name: 'confession_topics_sub',
      desc: '',
      args: [],
    );
  }

  /// `Confessional topic`
  String get confessional_topic {
    return Intl.message(
      'Confessional topic',
      name: 'confessional_topic',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Content language`
  String get content_language {
    return Intl.message(
      'Content language',
      name: 'content_language',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get country_code {
    return Intl.message(
      'Country Code',
      name: 'country_code',
      desc: '',
      args: [],
    );
  }

  /// `Creation date`
  String get creation_date {
    return Intl.message(
      'Creation date',
      name: 'creation_date',
      desc: '',
      args: [],
    );
  }

  /// `Current decisions`
  String get current_decisions {
    return Intl.message(
      'Current decisions',
      name: 'current_decisions',
      desc: '',
      args: [],
    );
  }

  /// `to which I want to live`
  String get current_decisions_sub {
    return Intl.message(
      'to which I want to live',
      name: 'current_decisions_sub',
      desc: '',
      args: [],
    );
  }

  /// `Currently planned`
  String get current_deeds {
    return Intl.message(
      'Currently planned',
      name: 'current_deeds',
      desc: '',
      args: [],
    );
  }

  /// `I want to do`
  String get current_deeds_sub {
    return Intl.message(
      'I want to do',
      name: 'current_deeds_sub',
      desc: '',
      args: [],
    );
  }

  /// `Current prayer requests`
  String get current_prayerrequests {
    return Intl.message(
      'Current prayer requests',
      name: 'current_prayerrequests',
      desc: '',
      args: [],
    );
  }

  /// `Current words`
  String get current_words {
    return Intl.message(
      'Current words',
      name: 'current_words',
      desc: '',
      args: [],
    );
  }

  /// `accompany me`
  String get current_words_sub {
    return Intl.message(
      'accompany me',
      name: 'current_words_sub',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Days preview`
  String get dayspreview {
    return Intl.message(
      'Days preview',
      name: 'dayspreview',
      desc: '',
      args: [],
    );
  }

  /// `Decisions`
  String get dayspreview_decisions_head {
    return Intl.message(
      'Decisions',
      name: 'dayspreview_decisions_head',
      desc: '',
      args: [],
    );
  }

  /// `I want to implement today`
  String get dayspreview_decisions_sub {
    return Intl.message(
      'I want to implement today',
      name: 'dayspreview_decisions_sub',
      desc: '',
      args: [],
    );
  }

  /// `Deeds`
  String get dayspreview_deeds_head {
    return Intl.message(
      'Deeds',
      name: 'dayspreview_deeds_head',
      desc: '',
      args: [],
    );
  }

  /// `I want to realize today`
  String get dayspreview_deeds_sub {
    return Intl.message(
      'I want to realize today',
      name: 'dayspreview_deeds_sub',
      desc: '',
      args: [],
    );
  }

  /// `The time`
  String get dayspreview_prayertime_head {
    return Intl.message(
      'The time',
      name: 'dayspreview_prayertime_head',
      desc: '',
      args: [],
    );
  }

  /// `I want to take for prayer today`
  String get dayspreview_prayertime_sub {
    return Intl.message(
      'I want to take for prayer today',
      name: 'dayspreview_prayertime_sub',
      desc: '',
      args: [],
    );
  }

  /// `Word of God`
  String get dayspreview_words_head {
    return Intl.message(
      'Word of God',
      name: 'dayspreview_words_head',
      desc: '',
      args: [],
    );
  }

  /// `with whom I want to live today`
  String get dayspreview_words_sub {
    return Intl.message(
      'with whom I want to live today',
      name: 'dayspreview_words_sub',
      desc: '',
      args: [],
    );
  }

  /// `Days review`
  String get daysreview {
    return Intl.message(
      'Days review',
      name: 'daysreview',
      desc: '',
      args: [],
    );
  }

  /// `Come to rest`
  String get daysreview_calm_head {
    return Intl.message(
      'Come to rest',
      name: 'daysreview_calm_head',
      desc: '',
      args: [],
    );
  }

  /// `Calm down`
  String get daysreview_calm_text {
    return Intl.message(
      'Calm down',
      name: 'daysreview_calm_text',
      desc: '',
      args: [],
    );
  }

  /// `Let look at you\nfrom God's loving gaze.`
  String get daysreview_calm_text2 {
    return Intl.message(
      'Let look at you\nfrom God\'s loving gaze.',
      name: 'daysreview_calm_text2',
      desc: '',
      args: [],
    );
  }

  /// `Let pass today\nin front of your inner eye.`
  String get daysreview_calm_text3 {
    return Intl.message(
      'Let pass today\nin front of your inner eye.',
      name: 'daysreview_calm_text3',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to thank God?`
  String get daysreview_calm_text4 {
    return Intl.message(
      'What do you want to thank God?',
      name: 'daysreview_calm_text4',
      desc: '',
      args: [],
    );
  }

  /// `Add a topic for confession`
  String get daysreview_confession_button {
    return Intl.message(
      'Add a topic for confession',
      name: 'daysreview_confession_button',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to ask God for forgiveness?`
  String get daysreview_confession_head {
    return Intl.message(
      'What do you want to ask God for forgiveness?',
      name: 'daysreview_confession_head',
      desc: '',
      args: [],
    );
  }

  /// `Current decisions`
  String get daysreview_decisions_head {
    return Intl.message(
      'Current decisions',
      name: 'daysreview_decisions_head',
      desc: '',
      args: [],
    );
  }

  /// `Evening prayer`
  String get daysreview_eveningprayer_head {
    return Intl.message(
      'Evening prayer',
      name: 'daysreview_eveningprayer_head',
      desc: '',
      args: [],
    );
  }

  /// `Now that the daylight dies away, By all thy grace and love, Thee, Maker of the world, we pray To watch our bed above.\n\nLet dreams depart and phantoms fly, The offspring of the night, Keep us, like shrines, beneath thine eye, Pure in our foe’s despite.\n\nThis grace on thy redeemed confer, Father, co-equal Son, And Holy Ghost, the Comforter, Eternal Three in One.`
  String get daysreview_eveningprayer_paragraph {
    return Intl.message(
      'Now that the daylight dies away, By all thy grace and love, Thee, Maker of the world, we pray To watch our bed above.\n\nLet dreams depart and phantoms fly, The offspring of the night, Keep us, like shrines, beneath thine eye, Pure in our foe’s despite.\n\nThis grace on thy redeemed confer, Father, co-equal Son, And Holy Ghost, the Comforter, Eternal Three in One.',
      name: 'daysreview_eveningprayer_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Confession of guilt`
  String get daysreview_forgivness_head {
    return Intl.message(
      'Confession of guilt',
      name: 'daysreview_forgivness_head',
      desc: '',
      args: [],
    );
  }

  /// `For forgiveness`
  String get daysreview_forgivness_head2 {
    return Intl.message(
      'For forgiveness',
      name: 'daysreview_forgivness_head2',
      desc: '',
      args: [],
    );
  }

  /// `I confess to almighty God and to you, my brothers and sisters, that I have greatly sinned, in my thoughts and in my words, in what I have done and in what I have failed to do, through my fault, through my fault, through my most grievous fault; therefore I ask blessed Mary ever-Virgin, all the Angels and Saints, and you, my brothers and sisters, to pray for me to the Lord our God.`
  String get daysreview_forgivness_paragraph {
    return Intl.message(
      'I confess to almighty God and to you, my brothers and sisters, that I have greatly sinned, in my thoughts and in my words, in what I have done and in what I have failed to do, through my fault, through my fault, through my most grievous fault; therefore I ask blessed Mary ever-Virgin, all the Angels and Saints, and you, my brothers and sisters, to pray for me to the Lord our God.',
      name: 'daysreview_forgivness_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `May almighty God have mercy on me, forgive me my sins, and bring me to everlasting life.`
  String get daysreview_forgivness_paragraph2 {
    return Intl.message(
      'May almighty God have mercy on me, forgive me my sins, and bring me to everlasting life.',
      name: 'daysreview_forgivness_paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `Prayer time`
  String get daysreview_prayertime_head {
    return Intl.message(
      'Prayer time',
      name: 'daysreview_prayertime_head',
      desc: '',
      args: [],
    );
  }

  /// `Today I prayed`
  String get daysreview_prayertime_sub {
    return Intl.message(
      'Today I prayed',
      name: 'daysreview_prayertime_sub',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled prayer time tomorrow`
  String get daysreview_prayertime_sub2 {
    return Intl.message(
      'Scheduled prayer time tomorrow',
      name: 'daysreview_prayertime_sub2',
      desc: '',
      args: [],
    );
  }

  /// `Decision`
  String get decision {
    return Intl.message(
      'Decision',
      name: 'decision',
      desc: '',
      args: [],
    );
  }

  /// `View progress`
  String get decision_view {
    return Intl.message(
      'View progress',
      name: 'decision_view',
      desc: '',
      args: [],
    );
  }

  /// `Decisions`
  String get decisions {
    return Intl.message(
      'Decisions',
      name: 'decisions',
      desc: '',
      args: [],
    );
  }

  /// `all previous decisions`
  String get decisions_archive_sub {
    return Intl.message(
      'all previous decisions',
      name: 'decisions_archive_sub',
      desc: '',
      args: [],
    );
  }

  /// `Make my life deliberately`
  String get decisions_info_sub {
    return Intl.message(
      'Make my life deliberately',
      name: 'decisions_info_sub',
      desc: '',
      args: [],
    );
  }

  /// `Deed`
  String get deed {
    return Intl.message(
      'Deed',
      name: 'deed',
      desc: '',
      args: [],
    );
  }

  /// `When do you want to do that?`
  String get deed_date_label {
    return Intl.message(
      'When do you want to do that?',
      name: 'deed_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Deeds`
  String get deeds {
    return Intl.message(
      'Deeds',
      name: 'deeds',
      desc: '',
      args: [],
    );
  }

  /// `What I did`
  String get deeds_archive_sub {
    return Intl.message(
      'What I did',
      name: 'deeds_archive_sub',
      desc: '',
      args: [],
    );
  }

  /// `Cooperate in the Kingdom of God`
  String get deeds_info_sub {
    return Intl.message(
      'Cooperate in the Kingdom of God',
      name: 'deeds_info_sub',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe`
  String get deregister {
    return Intl.message(
      'Unsubscribe',
      name: 'deregister',
      desc: '',
      args: [],
    );
  }

  /// `Display`
  String get display {
    return Intl.message(
      'Display',
      name: 'display',
      desc: '',
      args: [],
    );
  }

  /// `Donations`
  String get donations {
    return Intl.message(
      'Donations',
      name: 'donations',
      desc: '',
      args: [],
    );
  }

  /// `App2Heaven will always be completely free for its users. App2Heaven e.V. works to reach more people and bring God’s light into the world. Help us spread the word! More infos at [App2Heaven e.V.]({link})`
  String donations_text_markdown(Object link) {
    return Intl.message(
      'App2Heaven will always be completely free for its users. App2Heaven e.V. works to reach more people and bring God’s light into the world. Help us spread the word! More infos at [App2Heaven e.V.]($link)',
      name: 'donations_text_markdown',
      desc: '',
      args: [link],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Duration:`
  String get duration {
    return Intl.message(
      'Duration:',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit decision`
  String get edit_decision {
    return Intl.message(
      'Edit decision',
      name: 'edit_decision',
      desc: '',
      args: [],
    );
  }

  /// `Edit deed`
  String get edit_deed {
    return Intl.message(
      'Edit deed',
      name: 'edit_deed',
      desc: '',
      args: [],
    );
  }

  /// `Edit faith experience`
  String get edit_faith_experience {
    return Intl.message(
      'Edit faith experience',
      name: 'edit_faith_experience',
      desc: '',
      args: [],
    );
  }

  /// `Edit prayer note`
  String get edit_prayer_note {
    return Intl.message(
      'Edit prayer note',
      name: 'edit_prayer_note',
      desc: '',
      args: [],
    );
  }

  /// `Edit prayer request`
  String get edit_prayer_request {
    return Intl.message(
      'Edit prayer request',
      name: 'edit_prayer_request',
      desc: '',
      args: [],
    );
  }

  /// `Edit topic`
  String get edit_topic {
    return Intl.message(
      'Edit topic',
      name: 'edit_topic',
      desc: '',
      args: [],
    );
  }

  /// `Edit word`
  String get edit_word {
    return Intl.message(
      'Edit word',
      name: 'edit_word',
      desc: '',
      args: [],
    );
  }

  /// `End prayer time`
  String get end_prayertime {
    return Intl.message(
      'End prayer time',
      name: 'end_prayertime',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password for you confession topics:`
  String get enter_new_password {
    return Intl.message(
      'Please enter a new password for you confession topics:',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password:`
  String get enter_password {
    return Intl.message(
      'Please enter your password:',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `error`
  String get error {
    return Intl.message(
      'error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a location.`
  String get error_no_location {
    return Intl.message(
      'Please enter a location.',
      name: 'error_no_location',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a date and time in the future.`
  String get error_past_time {
    return Intl.message(
      'Please choose a date and time in the future.',
      name: 'error_past_time',
      desc: '',
      args: [],
    );
  }

  /// `Experiences`
  String get experiences {
    return Intl.message(
      'Experiences',
      name: 'experiences',
      desc: '',
      args: [],
    );
  }

  /// `God is always at work (cf. John 5:17), but it is not always easy to recognize his work. Sometimes we can just afterwards discover his traces in our lives - like Moses, who could not see God directly, but rather its "back" (cf. Ex 33.18 to 33.). This can be: how a word of God showed you the right way and transformed anything in your life. A turn of events in which I see a fruit of prayer or the surprising act of a providence from God. Giving testimony means: Speaking about how to expirience God's work. Nothing encourages us so much in faith as the testimony of others. This tells us that faith is not a dubious theory but that God lives and acts into our life. Therefore you can write in this section how you have experienced Gods works. These testimonies you can then share with others and thus bear witness to your faith. And of course, read the testimonies of others and let you strengthen by them in faith.`
  String get experiences_info_paragraph {
    return Intl.message(
      'God is always at work (cf. John 5:17), but it is not always easy to recognize his work. Sometimes we can just afterwards discover his traces in our lives - like Moses, who could not see God directly, but rather its "back" (cf. Ex 33.18 to 33.). This can be: how a word of God showed you the right way and transformed anything in your life. A turn of events in which I see a fruit of prayer or the surprising act of a providence from God. Giving testimony means: Speaking about how to expirience God\'s work. Nothing encourages us so much in faith as the testimony of others. This tells us that faith is not a dubious theory but that God lives and acts into our life. Therefore you can write in this section how you have experienced Gods works. These testimonies you can then share with others and thus bear witness to your faith. And of course, read the testimonies of others and let you strengthen by them in faith.',
      name: 'experiences_info_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Why testimonies are important`
  String get experiences_info_sub {
    return Intl.message(
      'Why testimonies are important',
      name: 'experiences_info_sub',
      desc: '',
      args: [],
    );
  }

  /// `How God acts`
  String get experiences_sub {
    return Intl.message(
      'How God acts',
      name: 'experiences_sub',
      desc: '',
      args: [],
    );
  }

  /// `Faith experience`
  String get faith_experience {
    return Intl.message(
      'Faith experience',
      name: 'faith_experience',
      desc: '',
      args: [],
    );
  }

  /// `Faith experiences`
  String get faithexperiences {
    return Intl.message(
      'Faith experiences',
      name: 'faithexperiences',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get favourites {
    return Intl.message(
      'Favourites',
      name: 'favourites',
      desc: '',
      args: [],
    );
  }

  /// `Text size`
  String get font_size {
    return Intl.message(
      'Text size',
      name: 'font_size',
      desc: '',
      args: [],
    );
  }

  /// `Font size`
  String get fontsize {
    return Intl.message(
      'Font size',
      name: 'fontsize',
      desc: '',
      args: [],
    );
  }

  /// `Earlier prayer requests`
  String get former_prayerrequests {
    return Intl.message(
      'Earlier prayer requests',
      name: 'former_prayerrequests',
      desc: '',
      args: [],
    );
  }

  /// `God helped!`
  String get god_helped {
    return Intl.message(
      'God helped!',
      name: 'god_helped',
      desc: '',
      args: [],
    );
  }

  /// `Remembering God's Word`
  String get gods_word_reminder {
    return Intl.message(
      'Remembering God\'s Word',
      name: 'gods_word_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Hide from current`
  String get hide_from_current {
    return Intl.message(
      'Hide from current',
      name: 'hide_from_current',
      desc: '',
      args: [],
    );
  }

  /// `Highlight`
  String get highlight {
    return Intl.message(
      'Highlight',
      name: 'highlight',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Intended (min)`
  String get intended_min {
    return Intl.message(
      'Intended (min)',
      name: 'intended_min',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get introduction {
    return Intl.message(
      'Introduction',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `Introduction to the app`
  String get introduction_to_the_app {
    return Intl.message(
      'Introduction to the app',
      name: 'introduction_to_the_app',
      desc: '',
      args: [],
    );
  }

  /// `Not all items have a valid prayer time`
  String get invalid_prayertimes {
    return Intl.message(
      'Not all items have a valid prayer time',
      name: 'invalid_prayertimes',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `large`
  String get large {
    return Intl.message(
      'large',
      name: 'large',
      desc: '',
      args: [],
    );
  }

  /// `Loading experience...`
  String get loading_experience {
    return Intl.message(
      'Loading experience...',
      name: 'loading_experience',
      desc: '',
      args: [],
    );
  }

  /// `Loading passage...`
  String get loading_passage {
    return Intl.message(
      'Loading passage...',
      name: 'loading_passage',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Lock`
  String get lock {
    return Intl.message(
      'Lock',
      name: 'lock',
      desc: '',
      args: [],
    );
  }

  /// `medium`
  String get medium {
    return Intl.message(
      'medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Menu language`
  String get menu_language {
    return Intl.message(
      'Menu language',
      name: 'menu_language',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Prayer intentions of the month`
  String get monthly_prayerrequest {
    return Intl.message(
      'Prayer intentions of the month',
      name: 'monthly_prayerrequest',
      desc: '',
      args: [],
    );
  }

  /// `(automatically translated from German)\n\nLord Jesus Christ, in the silence of this dawning morning, I come to you and plead with humility and confidence for your peace, your wisdom, your strength.\nGrant that today I look at the world with eyes that are full of love.\nLet me understand that all the glory of the church springs from your cross as its source.\nLet me receive my neighbor as the man whom you want to love through me.\nGive me the willingness to serve Him with devotion and unfold all the goodness you have put into Him.\nMy words should radiate gentleness and my whole behavior should bring peace.\nOnly those thoughts that spread blessings should stick in my mind.\nClose my ears to any malicious word and criticism.\nMay my tongue only serve to emphasize the good.\nAbove all, O Lord, cause that I am so full of joy and well-being that all who meet me will feel both your presence and your love.\nDress me with the splendor of your goodness and your beauty, so that I may reveal you in the course of this day.\nAmen.`
  String get morning_prayer {
    return Intl.message(
      '(automatically translated from German)\n\nLord Jesus Christ, in the silence of this dawning morning, I come to you and plead with humility and confidence for your peace, your wisdom, your strength.\nGrant that today I look at the world with eyes that are full of love.\nLet me understand that all the glory of the church springs from your cross as its source.\nLet me receive my neighbor as the man whom you want to love through me.\nGive me the willingness to serve Him with devotion and unfold all the goodness you have put into Him.\nMy words should radiate gentleness and my whole behavior should bring peace.\nOnly those thoughts that spread blessings should stick in my mind.\nClose my ears to any malicious word and criticism.\nMay my tongue only serve to emphasize the good.\nAbove all, O Lord, cause that I am so full of joy and well-being that all who meet me will feel both your presence and your love.\nDress me with the splendor of your goodness and your beauty, so that I may reveal you in the course of this day.\nAmen.',
      name: 'morning_prayer',
      desc: '',
      args: [],
    );
  }

  /// `Morning prayer of Sacred Mirjam of Abellin (view)`
  String get morning_prayer_head {
    return Intl.message(
      'Morning prayer of Sacred Mirjam of Abellin (view)',
      name: 'morning_prayer_head',
      desc: '',
      args: [],
    );
  }

  /// `My confession was on {date} at {time}`
  String my_confession_was_on(Object date, Object time) {
    return Intl.message(
      'My confession was on $date at $time',
      name: 'my_confession_was_on',
      desc: '',
      args: [date, time],
    );
  }

  /// `No confession yet`
  String get my_confession_was_on_fallback {
    return Intl.message(
      'No confession yet',
      name: 'my_confession_was_on_fallback',
      desc: '',
      args: [],
    );
  }

  /// `My faith experiences`
  String get my_faithexperiences {
    return Intl.message(
      'My faith experiences',
      name: 'my_faithexperiences',
      desc: '',
      args: [],
    );
  }

  /// `My Number`
  String get mynumber {
    return Intl.message(
      'My Number',
      name: 'mynumber',
      desc: '',
      args: [],
    );
  }

  /// `New Decision`
  String get new_decision {
    return Intl.message(
      'New Decision',
      name: 'new_decision',
      desc: '',
      args: [],
    );
  }

  /// `Press + to add a new decision`
  String get new_decision_hint {
    return Intl.message(
      'Press + to add a new decision',
      name: 'new_decision_hint',
      desc: '',
      args: [],
    );
  }

  /// `New deed`
  String get new_deed {
    return Intl.message(
      'New deed',
      name: 'new_deed',
      desc: '',
      args: [],
    );
  }

  /// `Press + to add a new deed`
  String get new_deed_hint {
    return Intl.message(
      'Press + to add a new deed',
      name: 'new_deed_hint',
      desc: '',
      args: [],
    );
  }

  /// `New faith experience`
  String get new_faith_experience {
    return Intl.message(
      'New faith experience',
      name: 'new_faith_experience',
      desc: '',
      args: [],
    );
  }

  /// `Press + to add a new faith experience`
  String get new_faith_experience_hint {
    return Intl.message(
      'Press + to add a new faith experience',
      name: 'new_faith_experience_hint',
      desc: '',
      args: [],
    );
  }

  /// `New prayer note`
  String get new_prayer_note {
    return Intl.message(
      'New prayer note',
      name: 'new_prayer_note',
      desc: '',
      args: [],
    );
  }

  /// `Press + to add a new prayer note`
  String get new_prayer_note_hint {
    return Intl.message(
      'Press + to add a new prayer note',
      name: 'new_prayer_note_hint',
      desc: '',
      args: [],
    );
  }

  /// `New prayer request`
  String get new_prayer_request {
    return Intl.message(
      'New prayer request',
      name: 'new_prayer_request',
      desc: '',
      args: [],
    );
  }

  /// `Press + to add a new prayer request`
  String get new_prayer_request_hint {
    return Intl.message(
      'Press + to add a new prayer request',
      name: 'new_prayer_request_hint',
      desc: '',
      args: [],
    );
  }

  /// `New topic`
  String get new_topic {
    return Intl.message(
      'New topic',
      name: 'new_topic',
      desc: '',
      args: [],
    );
  }

  /// `Press + to add a new confessional topic`
  String get new_topic_hint {
    return Intl.message(
      'Press + to add a new confessional topic',
      name: 'new_topic_hint',
      desc: '',
      args: [],
    );
  }

  /// `New word`
  String get new_word {
    return Intl.message(
      'New word',
      name: 'new_word',
      desc: '',
      args: [],
    );
  }

  /// `Press + to add a new word`
  String get new_word_hint {
    return Intl.message(
      'Press + to add a new word',
      name: 'new_word_hint',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Next confession on:`
  String get next_confession {
    return Intl.message(
      'Next confession on:',
      name: 'next_confession',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `There is no prayer request for the current month.`
  String get no_prayer_request_of_month {
    return Intl.message(
      'There is no prayer request for the current month.',
      name: 'no_prayer_request_of_month',
      desc: '',
      args: [],
    );
  }

  /// `No daily stimulus found. Please check your internet connection.`
  String get no_stimulus_of_day {
    return Intl.message(
      'No daily stimulus found. Please check your internet connection.',
      name: 'no_stimulus_of_day',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Open Bible`
  String get open_bible {
    return Intl.message(
      'Open Bible',
      name: 'open_bible',
      desc: '',
      args: [],
    );
  }

  /// `Suggest bible verse`
  String get open_bible_somewhere {
    return Intl.message(
      'Suggest bible verse',
      name: 'open_bible_somewhere',
      desc: '',
      args: [],
    );
  }

  /// `Read and write words`
  String get open_bible_sub {
    return Intl.message(
      'Read and write words',
      name: 'open_bible_sub',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password request`
  String get password_request {
    return Intl.message(
      'Password request',
      name: 'password_request',
      desc: '',
      args: [],
    );
  }

  /// `The passwords do not match!`
  String get passwords_dont_match {
    return Intl.message(
      'The passwords do not match!',
      name: 'passwords_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Planned`
  String get planned {
    return Intl.message(
      'Planned',
      name: 'planned',
      desc: '',
      args: [],
    );
  }

  /// `Planning`
  String get planning {
    return Intl.message(
      'Planning',
      name: 'planning',
      desc: '',
      args: [],
    );
  }

  /// `Finding time for God.`
  String get planning_button_sub {
    return Intl.message(
      'Finding time for God.',
      name: 'planning_button_sub',
      desc: '',
      args: [],
    );
  }

  /// `Tap the day and choose the time you want to take for prayer every day!`
  String get planning_head {
    return Intl.message(
      'Tap the day and choose the time you want to take for prayer every day!',
      name: 'planning_head',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a reminder 10 minutes before the set time.`
  String get planning_sub {
    return Intl.message(
      'You will receive a reminder 10 minutes before the set time.',
      name: 'planning_sub',
      desc: '',
      args: [],
    );
  }

  /// `Prayer clock`
  String get prayer_clock {
    return Intl.message(
      'Prayer clock',
      name: 'prayer_clock',
      desc: '',
      args: [],
    );
  }

  /// `What is prayer?`
  String get prayer_info_head {
    return Intl.message(
      'What is prayer?',
      name: 'prayer_info_head',
      desc: '',
      args: [],
    );
  }

  /// `Why pray?`
  String get prayer_info_head2 {
    return Intl.message(
      'Why pray?',
      name: 'prayer_info_head2',
      desc: '',
      args: [],
    );
  }

  /// `When pray?`
  String get prayer_info_head3 {
    return Intl.message(
      'When pray?',
      name: 'prayer_info_head3',
      desc: '',
      args: [],
    );
  }

  /// `How to pray with App2Heaven?`
  String get prayer_info_head4 {
    return Intl.message(
      'How to pray with App2Heaven?',
      name: 'prayer_info_head4',
      desc: '',
      args: [],
    );
  }

  /// `Prayer is more than addressing words to God. It is friendship with God. Prayer is: faith that He is there for you and loves you. Tell him what you have on your mind. Hear what he has to tell you. Or just relax in his presence. You'll learn: Prayer provides you light and strength for your way. When you pray, you will discover who you are and what you want to live.`
  String get prayer_info_paragraph {
    return Intl.message(
      'Prayer is more than addressing words to God. It is friendship with God. Prayer is: faith that He is there for you and loves you. Tell him what you have on your mind. Hear what he has to tell you. Or just relax in his presence. You\'ll learn: Prayer provides you light and strength for your way. When you pray, you will discover who you are and what you want to live.',
      name: 'prayer_info_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Can you imagine a friendship, in which one person not always talks to the other? Lack of communication takes us apart. So we are moving away from God if we don't spend time with him. The relationship with him is the most important one, because it shows us the meaning and the right paths for our lives. That's why prayer is so important for our spiritual life as breathing for the body. The difference is: Breathe goes automatically but pray quickly goes by the board, if you don't decide to it. But this app is here. With it you can organize your life, so that you can schedule time again to consciously spend it in communion with God. This will help you, living your whole life more and more in the presence of God. With that your life in heaven already has begun.`
  String get prayer_info_paragraph2 {
    return Intl.message(
      'Can you imagine a friendship, in which one person not always talks to the other? Lack of communication takes us apart. So we are moving away from God if we don\'t spend time with him. The relationship with him is the most important one, because it shows us the meaning and the right paths for our lives. That\'s why prayer is so important for our spiritual life as breathing for the body. The difference is: Breathe goes automatically but pray quickly goes by the board, if you don\'t decide to it. But this app is here. With it you can organize your life, so that you can schedule time again to consciously spend it in communion with God. This will help you, living your whole life more and more in the presence of God. With that your life in heaven already has begun.',
      name: 'prayer_info_paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `Scripture tells us that we should “always pray” (Luke 18: 1). This means that we can always live in friendship with God, even in the midst of our everyday activities. But in order to stay with God inwardly, there are times in the day when we specifically turn to God. In addition to the Sunday service (or once a week), we suggest the following:\n\n• A short prayer in the morning, e.g. a sign of the cross, a song of praise, a psalm or a personal prayer. Look ahead to the day and ask God for his blessing!\n\n• A personal prayer time anytime of the day. It's best not to overdo it so that you can keep the time. But it should be long enough to really listen to God and be able to bring all important things to him. It is important to set a fixed time and be faithful to it so that prayer is not left to chance or mood. It is helpful to plan the prayer times in advance and enter them in the calendar.\n\n• A short prayer before going to bed with a look back at the day. Bring everything that was before God so that you can go to bed with gratitude and peace in your heart!`
  String get prayer_info_paragraph3 {
    return Intl.message(
      'Scripture tells us that we should “always pray” (Luke 18: 1). This means that we can always live in friendship with God, even in the midst of our everyday activities. But in order to stay with God inwardly, there are times in the day when we specifically turn to God. In addition to the Sunday service (or once a week), we suggest the following:\n\n• A short prayer in the morning, e.g. a sign of the cross, a song of praise, a psalm or a personal prayer. Look ahead to the day and ask God for his blessing!\n\n• A personal prayer time anytime of the day. It\'s best not to overdo it so that you can keep the time. But it should be long enough to really listen to God and be able to bring all important things to him. It is important to set a fixed time and be faithful to it so that prayer is not left to chance or mood. It is helpful to plan the prayer times in advance and enter them in the calendar.\n\n• A short prayer before going to bed with a look back at the day. Bring everything that was before God so that you can go to bed with gratitude and peace in your heart!',
      name: 'prayer_info_paragraph3',
      desc: '',
      args: [],
    );
  }

  /// `Jesus has withdrawn to loneliness for prayer. Find yourself a quiet place where you will not be disturbed. It is best to switch the cell phone to "do not disturb". In the app under “Prayer time” click on “Start prayer time”, open your prayer with a cross sign and make yourself aware that God is there. When you pray at home, a sign can help, e.g. a candle, a cross or an icon. Prayer is about being completely with God. Try to be quiet in his presence. Many thoughts may come up in you - all of this is part of your life. Make them a prayer, a thank you, or a request. So you bring everything before God. The most important thing is that He is there now. Don't let it bother you if you keep thinking of unimportant things - just let them go by and keep looking for the presence of God.\n\nThere is no particular "method" to follow as you continue to pray. After all, prayer is friendship with God, and in friendship friends make their relationship the way it suits them. But there are different forms of prayer. Pick the one that suits you right now and help pray!\n\n• The contemplation: take a text from the Holy Scriptures, e.g. one section at a time from a gospel. Or the daily gospel. Or just open the Bible somewhere - in book form or with the corresponding App2Heaven function. Or read the words you wrote down in the "Word of God" section of the app. Read the text slowly and carefully. Does God have something to say to you for your life through this text? How are you going to answer God's word? Does God let you know something to do? But not only the Scriptures, but also a spiritual book, creation and above all your life can be considered. God can speak to us in everything. You can also read an impulse or a certificate from this app. Try to talk to God based on these thoughts. Where do you hear a call from God? A well-tried method of viewing is also the rosary - you can find instructions at www.rosenkranz-beten.de.\n\n• Inner Prayer: You can just speak to God knowing that He is there and loves you. In any friendship, it is important not only to speak or to ask, but also to perceive the person of the other. And just like in a human friendship, you can be with God without words. In inner prayer, you can simply spend a long time remaining silent in God's presence and lingering in His light and love. Such a prayer can do more than a prayer with many words.\n\n• Eucharistic adoration: When the Emmaus disciples asked Jesus "stay with us!", Jesus went with them and broke the bread with them. In the celebration of the Eucharist, Jesus stays with us in a special way. Sometimes the consecrated host is shown for prayer, this is called “Eucharistic adoration”. We see the bread that has been transformed and know in faith: this is Jesus. He is there with all his love that he showed us on the cross. He is there as the Risen One who speaks to us today and gives us his Holy Spirit. In Eucharistic adoration you can pray in all the forms explained above, but the special thing is to look at Him - and let Him look at you.\n\nAt the end of the prayer time, look back and think about what you want to take with you from this prayer time. You can write down thoughts that came to you about your life or your beliefs. The writing down helps to record findings and to get them clearer again. It can also be nice to share such spiritual thoughts with people we trust.\n\nPerhaps in prayer you have recognized something that God wants from you and now it is up to you to decide to live life more according to God's will and following Jesus. Then you can write it down in the "Decisions" section.\n\nAt the end thank God and deliberately close with a sign of the cross or the Lord's Prayer - and click on "End prayer time", then the time is automatically saved. This way you can see how your prayer times are developing.`
  String get prayer_info_paragraph4 {
    return Intl.message(
      'Jesus has withdrawn to loneliness for prayer. Find yourself a quiet place where you will not be disturbed. It is best to switch the cell phone to "do not disturb". In the app under “Prayer time” click on “Start prayer time”, open your prayer with a cross sign and make yourself aware that God is there. When you pray at home, a sign can help, e.g. a candle, a cross or an icon. Prayer is about being completely with God. Try to be quiet in his presence. Many thoughts may come up in you - all of this is part of your life. Make them a prayer, a thank you, or a request. So you bring everything before God. The most important thing is that He is there now. Don\'t let it bother you if you keep thinking of unimportant things - just let them go by and keep looking for the presence of God.\n\nThere is no particular "method" to follow as you continue to pray. After all, prayer is friendship with God, and in friendship friends make their relationship the way it suits them. But there are different forms of prayer. Pick the one that suits you right now and help pray!\n\n• The contemplation: take a text from the Holy Scriptures, e.g. one section at a time from a gospel. Or the daily gospel. Or just open the Bible somewhere - in book form or with the corresponding App2Heaven function. Or read the words you wrote down in the "Word of God" section of the app. Read the text slowly and carefully. Does God have something to say to you for your life through this text? How are you going to answer God\'s word? Does God let you know something to do? But not only the Scriptures, but also a spiritual book, creation and above all your life can be considered. God can speak to us in everything. You can also read an impulse or a certificate from this app. Try to talk to God based on these thoughts. Where do you hear a call from God? A well-tried method of viewing is also the rosary - you can find instructions at www.rosenkranz-beten.de.\n\n• Inner Prayer: You can just speak to God knowing that He is there and loves you. In any friendship, it is important not only to speak or to ask, but also to perceive the person of the other. And just like in a human friendship, you can be with God without words. In inner prayer, you can simply spend a long time remaining silent in God\'s presence and lingering in His light and love. Such a prayer can do more than a prayer with many words.\n\n• Eucharistic adoration: When the Emmaus disciples asked Jesus "stay with us!", Jesus went with them and broke the bread with them. In the celebration of the Eucharist, Jesus stays with us in a special way. Sometimes the consecrated host is shown for prayer, this is called “Eucharistic adoration”. We see the bread that has been transformed and know in faith: this is Jesus. He is there with all his love that he showed us on the cross. He is there as the Risen One who speaks to us today and gives us his Holy Spirit. In Eucharistic adoration you can pray in all the forms explained above, but the special thing is to look at Him - and let Him look at you.\n\nAt the end of the prayer time, look back and think about what you want to take with you from this prayer time. You can write down thoughts that came to you about your life or your beliefs. The writing down helps to record findings and to get them clearer again. It can also be nice to share such spiritual thoughts with people we trust.\n\nPerhaps in prayer you have recognized something that God wants from you and now it is up to you to decide to live life more according to God\'s will and following Jesus. Then you can write it down in the "Decisions" section.\n\nAt the end thank God and deliberately close with a sign of the cross or the Lord\'s Prayer - and click on "End prayer time", then the time is automatically saved. This way you can see how your prayer times are developing.',
      name: 'prayer_info_paragraph4',
      desc: '',
      args: [],
    );
  }

  /// `Praying - Why, when, how?`
  String get prayer_info_sub {
    return Intl.message(
      'Praying - Why, when, how?',
      name: 'prayer_info_sub',
      desc: '',
      args: [],
    );
  }

  /// `Prayer note`
  String get prayer_note {
    return Intl.message(
      'Prayer note',
      name: 'prayer_note',
      desc: '',
      args: [],
    );
  }

  /// `Prayer notes`
  String get prayer_notes {
    return Intl.message(
      'Prayer notes',
      name: 'prayer_notes',
      desc: '',
      args: [],
    );
  }

  /// `Notice what you have received`
  String get prayer_notes_sub {
    return Intl.message(
      'Notice what you have received',
      name: 'prayer_notes_sub',
      desc: '',
      args: [],
    );
  }

  /// `Prayer request`
  String get prayer_request {
    return Intl.message(
      'Prayer request',
      name: 'prayer_request',
      desc: '',
      args: [],
    );
  }

  /// `Answered`
  String get prayer_request_done {
    return Intl.message(
      'Answered',
      name: 'prayer_request_done',
      desc: '',
      args: [],
    );
  }

  /// `Prayer time`
  String get prayer_time {
    return Intl.message(
      'Prayer time',
      name: 'prayer_time',
      desc: '',
      args: [],
    );
  }

  /// `Prayer requests`
  String get prayerrequests {
    return Intl.message(
      'Prayer requests',
      name: 'prayerrequests',
      desc: '',
      args: [],
    );
  }

  /// `Here you can write down all the concerns for which you want to pray, so they are not forgotten. Very urgent concerns can be highlighted. Perhaps it turns out over time, that your requests are changing - then you can rephrase them. With one click you have all your current prayer requests in mind. You can also share them with other App2heaven users. Your can tag your prayer requests in which you have experienced they have been heard. It feels good reading those petitions, who have been heard, now and again and for thanking what God has done for us.`
  String get prayerrequests_info_paragraph {
    return Intl.message(
      'Here you can write down all the concerns for which you want to pray, so they are not forgotten. Very urgent concerns can be highlighted. Perhaps it turns out over time, that your requests are changing - then you can rephrase them. With one click you have all your current prayer requests in mind. You can also share them with other App2heaven users. Your can tag your prayer requests in which you have experienced they have been heard. It feels good reading those petitions, who have been heard, now and again and for thanking what God has done for us.',
      name: 'prayerrequests_info_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Prayer time at {startTime} today ({duration}). God awaits you.`
  String prayertime_reminder(Object startTime, Object duration) {
    return Intl.message(
      'Prayer time at $startTime today ($duration). God awaits you.',
      name: 'prayertime_reminder',
      desc: '',
      args: [startTime, duration],
    );
  }

  /// `Prayer times`
  String get prayertimes {
    return Intl.message(
      'Prayer times',
      name: 'prayertimes',
      desc: '',
      args: [],
    );
  }

  /// `Prayer times`
  String get prayertimes1 {
    return Intl.message(
      'Prayer times',
      name: 'prayertimes1',
      desc: '',
      args: [],
    );
  }

  /// `Preparation`
  String get preparation {
    return Intl.message(
      'Preparation',
      name: 'preparation',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Bei der Installation der App2Heaven werden eine Reihe von Berechtigungen angefragt, die für die Funktionalität der App und insbesondere für die Messaging-Funktion notwendig sind. Grundsätzlich werden die Inhalte, die du in die App2Heaven schreibst, nur auf deinem Smartphone gespeichert - darauf können weder die App2Heaven-Zentrale noch andere App2Heaven-Nutzer zugreifen. Geteilte Inhalte laufen über einen App2Heaven-Internet-Server. Alle eingegebenen Daten werden von uns vertraulich behandelt. Sie werden nur im Rahmen der App2Heaven verwendet. Sie werden in keiner Form - weder anonym noch personalisiert - gelesen oder ausgewertet. Sie werden in keiner Form an Dritte weitergegeben. Es werden keine Statistiken über Inhalte oder Nutzerverhalten angelegt. So möchte die App2Heaven die größtmögliche Diskretion der Inhalte gewährleisten.\n\nBei der App-Entwicklung wurden im Rahmen des Möglichen Schutzmaßnahmen ergri?en, um Datensicherheit zu gewährleisten. Gleichwohl kann keine Verantwortung dafür übernommen werden, dass nicht doch solche Vorkehrungen überwunden werden und es zu Datenverlusten kommt. Eine 100%ige Sicherheit vertraulicher Daten kann damit nicht garantiert werden. Daher übernimmt der App2Heaven e.V. keine Haftung für Datenverlust oder Datendiebstahl. Weiterhin haftet der Verein nicht dafür, dass die Inhalte der App jederzeit zur Verfügung stehen.\n\nDer Verein behält sich vor, dass der Dienst jederzeit eingestellt werden kann.`
  String get privacy_text {
    return Intl.message(
      'Bei der Installation der App2Heaven werden eine Reihe von Berechtigungen angefragt, die für die Funktionalität der App und insbesondere für die Messaging-Funktion notwendig sind. Grundsätzlich werden die Inhalte, die du in die App2Heaven schreibst, nur auf deinem Smartphone gespeichert - darauf können weder die App2Heaven-Zentrale noch andere App2Heaven-Nutzer zugreifen. Geteilte Inhalte laufen über einen App2Heaven-Internet-Server. Alle eingegebenen Daten werden von uns vertraulich behandelt. Sie werden nur im Rahmen der App2Heaven verwendet. Sie werden in keiner Form - weder anonym noch personalisiert - gelesen oder ausgewertet. Sie werden in keiner Form an Dritte weitergegeben. Es werden keine Statistiken über Inhalte oder Nutzerverhalten angelegt. So möchte die App2Heaven die größtmögliche Diskretion der Inhalte gewährleisten.\n\nBei der App-Entwicklung wurden im Rahmen des Möglichen Schutzmaßnahmen ergri?en, um Datensicherheit zu gewährleisten. Gleichwohl kann keine Verantwortung dafür übernommen werden, dass nicht doch solche Vorkehrungen überwunden werden und es zu Datenverlusten kommt. Eine 100%ige Sicherheit vertraulicher Daten kann damit nicht garantiert werden. Daher übernimmt der App2Heaven e.V. keine Haftung für Datenverlust oder Datendiebstahl. Weiterhin haftet der Verein nicht dafür, dass die Inhalte der App jederzeit zur Verfügung stehen.\n\nDer Verein behält sich vor, dass der Dienst jederzeit eingestellt werden kann.',
      name: 'privacy_text',
      desc: '',
      args: [],
    );
  }

  /// `The privacy policy can be viewed in the Settings menu.`
  String get privacy_text_info {
    return Intl.message(
      'The privacy policy can be viewed in the Settings menu.',
      name: 'privacy_text_info',
      desc: '',
      args: [],
    );
  }

  /// `Roger`
  String get privacy_text_ok {
    return Intl.message(
      'Roger',
      name: 'privacy_text_ok',
      desc: '',
      args: [],
    );
  }

  /// `Privacy note`
  String get privacy_text_title {
    return Intl.message(
      'Privacy note',
      name: 'privacy_text_title',
      desc: '',
      args: [],
    );
  }

  /// `Faith experience`
  String get random_experience {
    return Intl.message(
      'Faith experience',
      name: 'random_experience',
      desc: '',
      args: [],
    );
  }

  /// `Stimulus`
  String get random_stimulus {
    return Intl.message(
      'Stimulus',
      name: 'random_stimulus',
      desc: '',
      args: [],
    );
  }

  /// `Word of God`
  String get random_word_of_god {
    return Intl.message(
      'Word of God',
      name: 'random_word_of_god',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Read`
  String get read {
    return Intl.message(
      'Read',
      name: 'read',
      desc: '',
      args: [],
    );
  }

  /// `Pray now`
  String get real_prayertimes {
    return Intl.message(
      'Pray now',
      name: 'real_prayertimes',
      desc: '',
      args: [],
    );
  }

  /// `Your spent time with God`
  String get real_prayertimes_sub {
    return Intl.message(
      'Your spent time with God',
      name: 'real_prayertimes_sub',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Rom. 2:28`
  String get reference_example {
    return Intl.message(
      'e.g. Rom. 2:28',
      name: 'reference_example',
      desc: '',
      args: [],
    );
  }

  /// `Refreshed data`
  String get refreshed_data {
    return Intl.message(
      'Refreshed data',
      name: 'refreshed_data',
      desc: '',
      args: [],
    );
  }

  /// `Remember confession`
  String get remember_confession {
    return Intl.message(
      'Remember confession',
      name: 'remember_confession',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Reminder created`
  String get reminder_created {
    return Intl.message(
      'Reminder created',
      name: 'reminder_created',
      desc: '',
      args: [],
    );
  }

  /// `A reminder for your next confession on {date} was created. You will be reminded on {date} at {time}.`
  String reminder_created_confession(Object date, Object time) {
    return Intl.message(
      'A reminder for your next confession on $date was created. You will be reminded on $date at $time.',
      name: 'reminder_created_confession',
      desc: '',
      args: [date, time],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get reset_password {
    return Intl.message(
      'Reset password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `The current confession topics will be deleted, if you reset the password.`
  String get reset_password_caution {
    return Intl.message(
      'The current confession topics will be deleted, if you reset the password.',
      name: 'reset_password_caution',
      desc: '',
      args: [],
    );
  }

  /// `Shall password be reseted?`
  String get reset_password_message {
    return Intl.message(
      'Shall password be reseted?',
      name: 'reset_password_message',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Save and empty`
  String get save_and_empty {
    return Intl.message(
      'Save and empty',
      name: 'save_and_empty',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Select your language`
  String get select_language {
    return Intl.message(
      'Select your language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Send data`
  String get send_data {
    return Intl.message(
      'Send data',
      name: 'send_data',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Seven-Day review`
  String get seven_day_review {
    return Intl.message(
      'Seven-Day review',
      name: 'seven_day_review',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Take a look at this experience from my App2Heaven:\n{title}\n\n{text}\n{uri}`
  String share_experience(Object title, Object text, Object uri) {
    return Intl.message(
      'Take a look at this experience from my App2Heaven:\n$title\n\n$text\n$uri',
      name: 'share_experience',
      desc: '',
      args: [title, text, uri],
    );
  }

  /// `Take a look at this word of god from my App2Heaven:\n{title}\n\n{text}\n{uri}`
  String share_gods_word(Object title, Object text, Object uri) {
    return Intl.message(
      'Take a look at this word of god from my App2Heaven:\n$title\n\n$text\n$uri',
      name: 'share_gods_word',
      desc: '',
      args: [title, text, uri],
    );
  }

  /// `Take a look at this prayer note from my App2Heaven:\n{title}\n\n{text}\n{uri}`
  String share_prayer_note(Object title, Object text, Object uri) {
    return Intl.message(
      'Take a look at this prayer note from my App2Heaven:\n$title\n\n$text\n$uri',
      name: 'share_prayer_note',
      desc: '',
      args: [title, text, uri],
    );
  }

  /// `Please pray with me for this request from my App2Heaven:\n{title}\n\n{text}\n{uri}`
  String share_prayer_request(Object title, Object text, Object uri) {
    return Intl.message(
      'Please pray with me for this request from my App2Heaven:\n$title\n\n$text\n$uri',
      name: 'share_prayer_request',
      desc: '',
      args: [title, text, uri],
    );
  }

  /// `God helped! Thank you for praying for this request:\n{title}\n\n{text}\n{uri}`
  String share_prayer_request_done(Object title, Object text, Object uri) {
    return Intl.message(
      'God helped! Thank you for praying for this request:\n$title\n\n$text\n$uri',
      name: 'share_prayer_request_done',
      desc: '',
      args: [title, text, uri],
    );
  }

  /// `Show history`
  String get show_history {
    return Intl.message(
      'Show history',
      name: 'show_history',
      desc: '',
      args: [],
    );
  }

  /// `Show in Current`
  String get show_in_current {
    return Intl.message(
      'Show in Current',
      name: 'show_in_current',
      desc: '',
      args: [],
    );
  }

  /// `small`
  String get small {
    return Intl.message(
      'small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `If asked please select the "Listen in Browser" option below.`
  String get soundcloud_button_info {
    return Intl.message(
      'If asked please select the "Listen in Browser" option below.',
      name: 'soundcloud_button_info',
      desc: '',
      args: [],
    );
  }

  /// `Start prayer time`
  String get start_prayertime {
    return Intl.message(
      'Start prayer time',
      name: 'start_prayertime',
      desc: '',
      args: [],
    );
  }

  /// `Stimuli by category`
  String get stimuli_by_category {
    return Intl.message(
      'Stimuli by category',
      name: 'stimuli_by_category',
      desc: '',
      args: [],
    );
  }

  /// `Stimulus {date}`
  String stimulus_head(Object date) {
    return Intl.message(
      'Stimulus $date',
      name: 'stimulus_head',
      desc: '',
      args: [date],
    );
  }

  /// `In the name of the Father and the Son and the Holy Spirit. Amen.`
  String get stimulus_intro {
    return Intl.message(
      'In the name of the Father and the Son and the Holy Spirit. Amen.',
      name: 'stimulus_intro',
      desc: '',
      args: [],
    );
  }

  /// `Stimulus to prayer`
  String get stimulus_to_prayer {
    return Intl.message(
      'Stimulus to prayer',
      name: 'stimulus_to_prayer',
      desc: '',
      args: [],
    );
  }

  /// `Thoughts that lead in prayer`
  String get stimulus_to_prayer_sub {
    return Intl.message(
      'Thoughts that lead in prayer',
      name: 'stimulus_to_prayer_sub',
      desc: '',
      args: [],
    );
  }

  /// `You are successfully registred.`
  String get successfully_registred {
    return Intl.message(
      'You are successfully registred.',
      name: 'successfully_registred',
      desc: '',
      args: [],
    );
  }

  /// `Topics`
  String get topics {
    return Intl.message(
      'Topics',
      name: 'topics',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message(
      'Try again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Unhighlight`
  String get unhighlight {
    return Intl.message(
      'Unhighlight',
      name: 'unhighlight',
      desc: '',
      args: [],
    );
  }

  /// `Unlock`
  String get unlock {
    return Intl.message(
      'Unlock',
      name: 'unlock',
      desc: '',
      args: [],
    );
  }

  /// `With the last update the encryption of the confession topics was changed. A password is now always required. If no password was set before the update, pleae leave the field in the following dialog empty and just click OK. The password can be (re-)set in the Settings menu, but in doing this you will loose your current confession topics.`
  String get update_confession_text {
    return Intl.message(
      'With the last update the encryption of the confession topics was changed. A password is now always required. If no password was set before the update, pleae leave the field in the following dialog empty and just click OK. The password can be (re-)set in the Settings menu, but in doing this you will loose your current confession topics.',
      name: 'update_confession_text',
      desc: '',
      args: [],
    );
  }

  /// `Week overview`
  String get week_overview {
    return Intl.message(
      'Week overview',
      name: 'week_overview',
      desc: '',
      args: [],
    );
  }

  /// `For the beginning, please choose the app language :`
  String get welcome_app_language_text {
    return Intl.message(
      'For the beginning, please choose the app language :',
      name: 'welcome_app_language_text',
      desc: '',
      args: [],
    );
  }

  /// `Please now choose the content language:`
  String get welcome_content_language_text {
    return Intl.message(
      'Please now choose the content language:',
      name: 'welcome_content_language_text',
      desc: '',
      args: [],
    );
  }

  /// `The app proposes different languages. You can configure it now, and later on in the settings.`
  String get welcome_intro {
    return Intl.message(
      'The app proposes different languages. You can configure it now, and later on in the settings.',
      name: 'welcome_intro',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the App2Heaven!`
  String get welcome_title {
    return Intl.message(
      'Welcome to the App2Heaven!',
      name: 'welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `When?`
  String get when {
    return Intl.message(
      'When?',
      name: 'when',
      desc: '',
      args: [],
    );
  }

  /// `Word`
  String get word {
    return Intl.message(
      'Word',
      name: 'word',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid bible reference (in German format). e.g. '1. Petrus 2,3' oder '1. Petrus 2,4-6'`
  String get word_format_error {
    return Intl.message(
      'Please enter a valid bible reference (in German format). e.g. \'1. Petrus 2,3\' oder \'1. Petrus 2,4-6\'',
      name: 'word_format_error',
      desc: '',
      args: [],
    );
  }

  /// `Word of God`
  String get word_of_god {
    return Intl.message(
      'Word of God',
      name: 'word_of_god',
      desc: '',
      args: [],
    );
  }

  /// `Your daily reminder for "{title}":\n\n{text}`
  String word_reminder(Object title, Object text) {
    return Intl.message(
      'Your daily reminder for "$title":\n\n$text',
      name: 'word_reminder',
      desc: '',
      args: [title, text],
    );
  }

  /// `'{title}' was saved.`
  String word_saved(Object title) {
    return Intl.message(
      '\'$title\' was saved.',
      name: 'word_saved',
      desc: '',
      args: [title],
    );
  }

  /// `Words`
  String get words {
    return Intl.message(
      'Words',
      name: 'words',
      desc: '',
      args: [],
    );
  }

  /// `of all saved words`
  String get words_archive_sub {
    return Intl.message(
      'of all saved words',
      name: 'words_archive_sub',
      desc: '',
      args: [],
    );
  }

  /// `Life with God's Word`
  String get words_info_sub {
    return Intl.message(
      'Life with God\'s Word',
      name: 'words_info_sub',
      desc: '',
      args: [],
    );
  }

  /// `Let yourself remember in everyday life to the Word of God!`
  String get words_reminder_head {
    return Intl.message(
      'Let yourself remember in everyday life to the Word of God!',
      name: 'words_reminder_head',
      desc: '',
      args: [],
    );
  }

  /// `the word in everyday life`
  String get words_reminder_sub {
    return Intl.message(
      'the word in everyday life',
      name: 'words_reminder_sub',
      desc: '',
      args: [],
    );
  }

  /// `Write text`
  String get write_text {
    return Intl.message(
      'Write text',
      name: 'write_text',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrong_password {
    return Intl.message(
      'Wrong password',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `The password is wrong, please try again. (You can reset your password in the settings, if you forgot it.)`
  String get wrong_password_text {
    return Intl.message(
      'The password is wrong, please try again. (You can reset your password in the settings, if you forgot it.)',
      name: 'wrong_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a title`
  String get missing_title {
    return Intl.message(
      'Please enter a title',
      name: 'missing_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the text`
  String get missing_text {
    return Intl.message(
      'Please enter the text',
      name: 'missing_text',
      desc: '',
      args: [],
    );
  }

  /// `“Preach the gospel to all creatures!” (Mc 16:15), says Jesus. In Scripture it also says: "We do not want to love with words and tongues, but in fact and truth" (1 Jn 3:18). Evangelizing means sharing the good news of God's love with other people - in word and deed. So that this doesn't just remain a nice thought, you can write down here who you want to do something for: help, a small service, a visit, a conversation, an invitation to an event. Or maybe you have ideas for initiatives to build the Kingdom of God. If we listen in prayer and if we look at the people around us, God will let us know what to do so that He can come to people and people to Him. It is clear that we cannot “make” a person turn to God - that is the work of the Holy Spirit. But it is also clear: God wants us as his co-workers in order to enable people to experience his love.`
  String get deeds_info_paragraph {
    return Intl.message(
      '“Preach the gospel to all creatures!” (Mc 16:15), says Jesus. In Scripture it also says: "We do not want to love with words and tongues, but in fact and truth" (1 Jn 3:18). Evangelizing means sharing the good news of God\'s love with other people - in word and deed. So that this doesn\'t just remain a nice thought, you can write down here who you want to do something for: help, a small service, a visit, a conversation, an invitation to an event. Or maybe you have ideas for initiatives to build the Kingdom of God. If we listen in prayer and if we look at the people around us, God will let us know what to do so that He can come to people and people to Him. It is clear that we cannot “make” a person turn to God - that is the work of the Holy Spirit. But it is also clear: God wants us as his co-workers in order to enable people to experience his love.',
      name: 'deeds_info_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `There are moments when we understand that we should change something in our lives. It can be done in prayer or reading the Word of God - or when we really get on our noses. Then we usually take each other A good resolution, but how long good resolutions last is known ... That's why Saint Ignatius of Loyola came up with a useful tool: he suggests thinking about the decision we made in the morning and moving towards the end of the day check how it has been implemented, the advantage of this is that even if you can’t always achieve success, it’s not going to go wrong, you’ll always come across it, so with God’s help you can too Take a close look at stuck habits and slowly but surely practice new, better behaviors. It is true: without Jesus we cannot do anything. He gives us his light to recognize where we turn and the power to implement what is recognized. But it also applies: it can't work without us. We have to walk the path ourselves - and also use the appropriate aids. This function is such a tool to implement what you have known from God with his help in your life. `
  String get decisions_info_paragraph {
    return Intl.message(
      'There are moments when we understand that we should change something in our lives. It can be done in prayer or reading the Word of God - or when we really get on our noses. Then we usually take each other A good resolution, but how long good resolutions last is known ... That\'s why Saint Ignatius of Loyola came up with a useful tool: he suggests thinking about the decision we made in the morning and moving towards the end of the day check how it has been implemented, the advantage of this is that even if you can’t always achieve success, it’s not going to go wrong, you’ll always come across it, so with God’s help you can too Take a close look at stuck habits and slowly but surely practice new, better behaviors. It is true: without Jesus we cannot do anything. He gives us his light to recognize where we turn and the power to implement what is recognized. But it also applies: it can\'t work without us. We have to walk the path ourselves - and also use the appropriate aids. This function is such a tool to implement what you have known from God with his help in your life. ',
      name: 'decisions_info_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `In the words of Scripture, God speaks to us. He shows us what he is like and lets us see important things about our life. We often feel when we read the Bible or hear the services: This word is for me! It makes me understand something important. It shows me something to do. Then it is important that I also record this word. "Don't just listen to the word, but act accordingly; otherwise you will cheat yourself," says the letter to James (1:22). The danger is that we will quickly forget what we have heard and nothing will change in our life. But if we hear the word and act on it, our life becomes and God leads us on his way. This function helps you to listen better to God's word. Write down the words that have spoken to you. Take them back for prayer, look at them again in between or let yourself through the memories remember them in everyday life. Then the words will seep into your heart, they will stay in you and bear fruit. You can decide which current words you want to see immediately, add new words or hide other words. Under "all words" you can also see those that have been hidden for some time. Sometimes it is interesting to read these words in context again and discover a “common thread” and see how God leads you through his word.\nYou can decide which current words you want to see immediately, add new words or hide other words. Under "all words" you can also see those that have been hidden for some time. Sometimes it is interesting to read these words together again and discover a “common thread” and see how God leads you through his word. `
  String get words_info_paragraph {
    return Intl.message(
      'In the words of Scripture, God speaks to us. He shows us what he is like and lets us see important things about our life. We often feel when we read the Bible or hear the services: This word is for me! It makes me understand something important. It shows me something to do. Then it is important that I also record this word. "Don\'t just listen to the word, but act accordingly; otherwise you will cheat yourself," says the letter to James (1:22). The danger is that we will quickly forget what we have heard and nothing will change in our life. But if we hear the word and act on it, our life becomes and God leads us on his way. This function helps you to listen better to God\'s word. Write down the words that have spoken to you. Take them back for prayer, look at them again in between or let yourself through the memories remember them in everyday life. Then the words will seep into your heart, they will stay in you and bear fruit. You can decide which current words you want to see immediately, add new words or hide other words. Under "all words" you can also see those that have been hidden for some time. Sometimes it is interesting to read these words in context again and discover a “common thread” and see how God leads you through his word.\nYou can decide which current words you want to see immediately, add new words or hide other words. Under "all words" you can also see those that have been hidden for some time. Sometimes it is interesting to read these words together again and discover a “common thread” and see how God leads you through his word. ',
      name: 'words_info_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in`
  String get missing_value {
    return Intl.message(
      'Please fill in',
      name: 'missing_value',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the App2Heaven!\n\nThe app wants to support you in living with God in everyday life. Here are a few tips on how you can use the individual functions step by step.\n\nSelect the "Prayer Time" function and read the information text. Think about how much time you want to take each day for prayer. Personal prayer is the basis for spiritual life. That's why it's important to stay on top of it - even if it didn't work out on a particularly chaotic day. It is best to start with a shorter time that is realistic, e.g. 5 or 10 minutes. In the info text you will find different forms of prayer. Pray as it suits you and does you good. Let yourself be led by the Holy Spirit, who is our teacher in prayer.\n\nIf something clear in prayer that you don't want to forget, you can take notes after the prayer time. If it is a thought that is also uplifting for others, you can also share it with friends who also use the App2Heaven. So you stay in spiritual community.\n\nThe "Prayer Requests" menu is also intended for the prayer community. Here you can write down for yourself what you want to pray for, but you can also share these concerns with others so that you can pray for them together.\n\nWe cannot always experience God's work noticeably. It is all the more encouraging to hear testimonies of how God works today. You will find examples of this in the "Faith Experiences" function - and you can also write down and share them yourself if they are given to you as gifts.\n\nIf individual words of God particularly appeal to you, e.g. after a service or reading the Bible, you can write it down using the "Word of God" function, take it back with your personal prayer or be reminded of it to take it with you in everyday life.\n\nSometimes in prayer we come up with ideas and ideas about what we could do for God and people - you can write this down in the "Actions" function and plan when you want to implement it.\n\nThe two functions "Preview" and "Day review" help you to start and end the day with God.\n\nWe don't always succeed in life the way we want it to. When we experience painfully that we are lagging behind the love that we actually want to give each other and God, God offers us his mercy. In the “Confession” section you will find out what this sacrament is all about, how to prepare for it.\n\nAll these different functions of the app are offers. You do not have to use all of them at the same time, but you can individually select what is currently helping you personally to stay in contact with God. There is also a separate, more detailed info text for each function. The app wants to inspire you and give you suggestions - but the most important thing is that you go your own personal way with God!`
  String get introduction_text {
    return Intl.message(
      'Welcome to the App2Heaven!\n\nThe app wants to support you in living with God in everyday life. Here are a few tips on how you can use the individual functions step by step.\n\nSelect the "Prayer Time" function and read the information text. Think about how much time you want to take each day for prayer. Personal prayer is the basis for spiritual life. That\'s why it\'s important to stay on top of it - even if it didn\'t work out on a particularly chaotic day. It is best to start with a shorter time that is realistic, e.g. 5 or 10 minutes. In the info text you will find different forms of prayer. Pray as it suits you and does you good. Let yourself be led by the Holy Spirit, who is our teacher in prayer.\n\nIf something clear in prayer that you don\'t want to forget, you can take notes after the prayer time. If it is a thought that is also uplifting for others, you can also share it with friends who also use the App2Heaven. So you stay in spiritual community.\n\nThe "Prayer Requests" menu is also intended for the prayer community. Here you can write down for yourself what you want to pray for, but you can also share these concerns with others so that you can pray for them together.\n\nWe cannot always experience God\'s work noticeably. It is all the more encouraging to hear testimonies of how God works today. You will find examples of this in the "Faith Experiences" function - and you can also write down and share them yourself if they are given to you as gifts.\n\nIf individual words of God particularly appeal to you, e.g. after a service or reading the Bible, you can write it down using the "Word of God" function, take it back with your personal prayer or be reminded of it to take it with you in everyday life.\n\nSometimes in prayer we come up with ideas and ideas about what we could do for God and people - you can write this down in the "Actions" function and plan when you want to implement it.\n\nThe two functions "Preview" and "Day review" help you to start and end the day with God.\n\nWe don\'t always succeed in life the way we want it to. When we experience painfully that we are lagging behind the love that we actually want to give each other and God, God offers us his mercy. In the “Confession” section you will find out what this sacrament is all about, how to prepare for it.\n\nAll these different functions of the app are offers. You do not have to use all of them at the same time, but you can individually select what is currently helping you personally to stay in contact with God. There is also a separate, more detailed info text for each function. The app wants to inspire you and give you suggestions - but the most important thing is that you go your own personal way with God!',
      name: 'introduction_text',
      desc: '',
      args: [],
    );
  }

  /// `Why confess?`
  String get confession_info_head {
    return Intl.message(
      'Why confess?',
      name: 'confession_info_head',
      desc: '',
      args: [],
    );
  }

  /// `How to confess?`
  String get confession_info_head2 {
    return Intl.message(
      'How to confess?',
      name: 'confession_info_head2',
      desc: '',
      args: [],
    );
  }

  /// `“If you forgive sins, they are forgiven,” Jesus says to his apostles. Confession gives the wonderful experience that the forgiveness of your sins is audibly promised in the name of Jesus. In this way you can experience God's merciful love first hand and personally. To be sure, going to confession always takes effort and is not easy for anyone. But if you dare not only to show your beautiful facade, but to be completely honest, you can have the delightful experience that God accepts and loves you as you are and opens up a new future for you through His forgiveness. Those who make use of this sacrament learn that confession always gives new joy in life and new impetus to do the good. That is why it is advisable to go to confession regularly (e.g. monthly, but at least before big celebrations such as Christmas and Easter).`
  String get confession_info_paragraph {
    return Intl.message(
      '“If you forgive sins, they are forgiven,” Jesus says to his apostles. Confession gives the wonderful experience that the forgiveness of your sins is audibly promised in the name of Jesus. In this way you can experience God\'s merciful love first hand and personally. To be sure, going to confession always takes effort and is not easy for anyone. But if you dare not only to show your beautiful facade, but to be completely honest, you can have the delightful experience that God accepts and loves you as you are and opens up a new future for you through His forgiveness. Those who make use of this sacrament learn that confession always gives new joy in life and new impetus to do the good. That is why it is advisable to go to confession regularly (e.g. monthly, but at least before big celebrations such as Christmas and Easter).',
      name: 'confession_info_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `1.Take time to prepare for the confession (e.g. with the suggestions for thinking in this app). If you think of things that belong in a confession, you can write them down here so that they are not forgotten. To ensure discretion (your sins concern only you and God!), You can password-protect this area. To make sure that no strangers are snooping around in your sins, you should rather write down keywords or the topics at stake so you know what it is about, but nobody else.\n\n2. Tell God you're sorry and ask for His help to improve you. You can also enter a decision for the future right away.\n\n3. Go to a priest and confess your sins. Do not worry, the priest is not there to judge you, but to bring you God's mercy. If you are having trouble because you haven't been confessing for a long time or don't see some things clearly, just say it. The priest will help you. After the confession, he will give you some pointers, an encouraging encouragement and a penance, i.e. he tells you a prayer or an act. Repentance is to take a step in the right direction and heal something that has been hurt by sin. And above all, the priest gives you the release, the forgiveness of all sins in the name of God. If you enter the confession, all topics for the confession will be deleted - because even God will not remember them!\n\n4. You have become new! Say thank you to God - and start again with him in everyday life.`
  String get confession_info_paragraph2 {
    return Intl.message(
      '1.Take time to prepare for the confession (e.g. with the suggestions for thinking in this app). If you think of things that belong in a confession, you can write them down here so that they are not forgotten. To ensure discretion (your sins concern only you and God!), You can password-protect this area. To make sure that no strangers are snooping around in your sins, you should rather write down keywords or the topics at stake so you know what it is about, but nobody else.\n\n2. Tell God you\'re sorry and ask for His help to improve you. You can also enter a decision for the future right away.\n\n3. Go to a priest and confess your sins. Do not worry, the priest is not there to judge you, but to bring you God\'s mercy. If you are having trouble because you haven\'t been confessing for a long time or don\'t see some things clearly, just say it. The priest will help you. After the confession, he will give you some pointers, an encouraging encouragement and a penance, i.e. he tells you a prayer or an act. Repentance is to take a step in the right direction and heal something that has been hurt by sin. And above all, the priest gives you the release, the forgiveness of all sins in the name of God. If you enter the confession, all topics for the confession will be deleted - because even God will not remember them!\n\n4. You have become new! Say thank you to God - and start again with him in everyday life.',
      name: 'confession_info_paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `{x, plural, =1{1 minute} other{{x} minutes}}`
  String x_minutes(num x) {
    return Intl.plural(
      x,
      one: '1 minute',
      other: '$x minutes',
      name: 'x_minutes',
      desc: '',
      args: [x],
    );
  }

  /// `{x, plural, =1{1 hour} other{{x} hours}}`
  String x_hours(num x) {
    return Intl.plural(
      x,
      one: '1 hour',
      other: '$x hours',
      name: 'x_hours',
      desc: '',
      args: [x],
    );
  }

  /// `{x} h {y} min`
  String x_h_y_min(Object x, Object y) {
    return Intl.message(
      '$x h $y min',
      name: 'x_h_y_min',
      desc: '',
      args: [x, y],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `You must have an entry in 'Current Words' to be reminded of it.`
  String get words_reminder_no_current_words {
    return Intl.message(
      'You must have an entry in \'Current Words\' to be reminded of it.',
      name: 'words_reminder_no_current_words',
      desc: '',
      args: [],
    );
  }

  /// `You will be reminded of '{title}' at {time} every day.`
  String words_reminder_enabled(Object title, Object time) {
    return Intl.message(
      'You will be reminded of \'$title\' at $time every day.',
      name: 'words_reminder_enabled',
      desc: '',
      args: [title, time],
    );
  }

  /// `Use system language`
  String get use_system_language {
    return Intl.message(
      'Use system language',
      name: 'use_system_language',
      desc: '',
      args: [],
    );
  }

  /// `Your last confession was on {date}.`
  String last_confession(Object date) {
    return Intl.message(
      'Your last confession was on $date.',
      name: 'last_confession',
      desc: '',
      args: [date],
    );
  }

  /// `You planned your next confession on {date}.`
  String planned_confession(Object date) {
    return Intl.message(
      'You planned your next confession on $date.',
      name: 'planned_confession',
      desc: '',
      args: [date],
    );
  }

  /// `App2Heaven will always be completely free for its users. App2Heaven e.V. works to reach more people and bring God’s light into the world. Help us spread the word by reviewing the App and sharing with your friends, or by going to the donations page!`
  String get donations_dialog {
    return Intl.message(
      'App2Heaven will always be completely free for its users. App2Heaven e.V. works to reach more people and bring God’s light into the world. Help us spread the word by reviewing the App and sharing with your friends, or by going to the donations page!',
      name: 'donations_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Learn more`
  String get donate_now {
    return Intl.message(
      'Learn more',
      name: 'donate_now',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Help us to develop the app further by submitting your usage statistics anonymously. You can change your decision at any time in the settings.`
  String get analytics_dialog {
    return Intl.message(
      'Help us to develop the app further by submitting your usage statistics anonymously. You can change your decision at any time in the settings.',
      name: 'analytics_dialog',
      desc: '',
      args: [],
    );
  }

  /// `App2Heaven is looking for app programmers to jointly develop the app on an open source platform. Interested? Then write us at {email}.`
  String programmers_dialog(Object email) {
    return Intl.message(
      'App2Heaven is looking for app programmers to jointly develop the app on an open source platform. Interested? Then write us at $email.',
      name: 'programmers_dialog',
      desc: '',
      args: [email],
    );
  }

  /// `Send e-mail`
  String get send_mail {
    return Intl.message(
      'Send e-mail',
      name: 'send_mail',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get bible_book {
    return Intl.message(
      'Book',
      name: 'bible_book',
      desc: '',
      args: [],
    );
  }

  /// `Chapter`
  String get bible_chapter {
    return Intl.message(
      'Chapter',
      name: 'bible_chapter',
      desc: '',
      args: [],
    );
  }

  /// `Verse(s)`
  String get bible_verses {
    return Intl.message(
      'Verse(s)',
      name: 'bible_verses',
      desc: '',
      args: [],
    );
  }

  /// `e.g. 3 or 1-5`
  String get bible_verses_hint {
    return Intl.message(
      'e.g. 3 or 1-5',
      name: 'bible_verses_hint',
      desc: '',
      args: [],
    );
  }

  /// `Valid chapters: 1-{maxChapter}`
  String bible_chapter_max(Object maxChapter) {
    return Intl.message(
      'Valid chapters: 1-$maxChapter',
      name: 'bible_chapter_max',
      desc: '',
      args: [maxChapter],
    );
  }

  /// `Valid verses: 1-{maxVerse}`
  String bible_verse_max(Object maxVerse) {
    return Intl.message(
      'Valid verses: 1-$maxVerse',
      name: 'bible_verse_max',
      desc: '',
      args: [maxVerse],
    );
  }

  /// `Read passage`
  String get read_passage {
    return Intl.message(
      'Read passage',
      name: 'read_passage',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{Read verse} other{Read verses}}`
  String read_verses(num count) {
    return Intl.plural(
      count,
      one: 'Read verse',
      other: 'Read verses',
      name: 'read_verses',
      desc: '',
      args: [count],
    );
  }

  /// `You haven't created any confession topics yet`
  String get no_confession_topics {
    return Intl.message(
      'You haven\'t created any confession topics yet',
      name: 'no_confession_topics',
      desc: '',
      args: [],
    );
  }

  /// `You haven't made any decisions yet`
  String get no_decisions {
    return Intl.message(
      'You haven\'t made any decisions yet',
      name: 'no_decisions',
      desc: '',
      args: [],
    );
  }

  /// `You haven't planned any deeds yet`
  String get no_deeds {
    return Intl.message(
      'You haven\'t planned any deeds yet',
      name: 'no_deeds',
      desc: '',
      args: [],
    );
  }

  /// `You haven't planned any deeds for today`
  String get no_deeds_today {
    return Intl.message(
      'You haven\'t planned any deeds for today',
      name: 'no_deeds_today',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any experiences yet`
  String get no_experiences {
    return Intl.message(
      'You haven\'t added any experiences yet',
      name: 'no_experiences',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any words yet`
  String get no_gods_words {
    return Intl.message(
      'You haven\'t added any words yet',
      name: 'no_gods_words',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any prayer requests yet`
  String get no_prayer_requests {
    return Intl.message(
      'You haven\'t added any prayer requests yet',
      name: 'no_prayer_requests',
      desc: '',
      args: [],
    );
  }

  /// `You haven't made any prayer notes yet`
  String get no_prayer_notes {
    return Intl.message(
      'You haven\'t made any prayer notes yet',
      name: 'no_prayer_notes',
      desc: '',
      args: [],
    );
  }

  /// `No communities found\nPlease, check your internet connection`
  String get no_communities {
    return Intl.message(
      'No communities found\nPlease, check your internet connection',
      name: 'no_communities',
      desc: '',
      args: [],
    );
  }

  /// `No experiences found\nPlease, check your internet connection`
  String get no_community_experiences {
    return Intl.message(
      'No experiences found\nPlease, check your internet connection',
      name: 'no_community_experiences',
      desc: '',
      args: [],
    );
  }

  /// `No categories found\nPlease, check your internet connection`
  String get no_stimulus_tags {
    return Intl.message(
      'No categories found\nPlease, check your internet connection',
      name: 'no_stimulus_tags',
      desc: '',
      args: [],
    );
  }

  /// `No stimuli found\nPlease, check your internet connection`
  String get no_stimuli {
    return Intl.message(
      'No stimuli found\nPlease, check your internet connection',
      name: 'no_stimuli',
      desc: '',
      args: [],
    );
  }

  /// `No book found`
  String get no_bible_books {
    return Intl.message(
      'No book found',
      name: 'no_bible_books',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get custom {
    return Intl.message(
      'Custom',
      name: 'custom',
      desc: '',
      args: [],
    );
  }

  /// `Planned for: {date}`
  String deed_planned_for(Object date) {
    return Intl.message(
      'Planned for: $date',
      name: 'deed_planned_for',
      desc: '',
      args: [date],
    );
  }

  /// `You must be connected to the internet to read bible passages.`
  String get open_bible_needs_internet {
    return Intl.message(
      'You must be connected to the internet to read bible passages.',
      name: 'open_bible_needs_internet',
      desc: '',
      args: [],
    );
  }

  /// `You can now share or export multiple items at once by clicking this icon, selecting them in the list and then clicking the button in the bottom right corner.`
  String get description_share_many {
    return Intl.message(
      'You can now share or export multiple items at once by clicking this icon, selecting them in the list and then clicking the button in the bottom right corner.',
      name: 'description_share_many',
      desc: '',
      args: [],
    );
  }

  /// `You can now delete multiple items at once by clicking this icon, selecting them in the list and then clicking the button in the bottom right corner.`
  String get description_delete_many {
    return Intl.message(
      'You can now delete multiple items at once by clicking this icon, selecting them in the list and then clicking the button in the bottom right corner.',
      name: 'description_delete_many',
      desc: '',
      args: [],
    );
  }

  /// `Reset demo`
  String get reset_demo {
    return Intl.message(
      'Reset demo',
      name: 'reset_demo',
      desc: '',
      args: [],
    );
  }

  /// `Use same time every day`
  String get same_time_every_day {
    return Intl.message(
      'Use same time every day',
      name: 'same_time_every_day',
      desc: '',
      args: [],
    );
  }

  /// `Don't be sad. Tomorrow is a new day and “the Lord's mercies new every morning” (Lam. 3:22-23)`
  String get rating_min {
    return Intl.message(
      'Don\'t be sad. Tomorrow is a new day and “the Lord\'s mercies new every morning” (Lam. 3:22-23)',
      name: 'rating_min',
      desc: '',
      args: [],
    );
  }

  /// `Great! Thanks be to the Lord! You can do all things through Him who strengthens you. (cf. Phil. 4:13)`
  String get rating_max {
    return Intl.message(
      'Great! Thanks be to the Lord! You can do all things through Him who strengthens you. (cf. Phil. 4:13)',
      name: 'rating_max',
      desc: '',
      args: [],
    );
  }

  /// `Shown Elements`
  String get shown_elements {
    return Intl.message(
      'Shown Elements',
      name: 'shown_elements',
      desc: '',
      args: [],
    );
  }

  /// `Settings: Dashboard`
  String get dashboard_settings {
    return Intl.message(
      'Settings: Dashboard',
      name: 'dashboard_settings',
      desc: '',
      args: [],
    );
  }

  /// `Settings: Days Preview`
  String get dayspreview_settings {
    return Intl.message(
      'Settings: Days Preview',
      name: 'dayspreview_settings',
      desc: '',
      args: [],
    );
  }

  /// `Settings: Days Review`
  String get daysreview_settings {
    return Intl.message(
      'Settings: Days Review',
      name: 'daysreview_settings',
      desc: '',
      args: [],
    );
  }

  /// `No elements configured`
  String get dayspreview_no_elements_enabled_title {
    return Intl.message(
      'No elements configured',
      name: 'dayspreview_no_elements_enabled_title',
      desc: '',
      args: [],
    );
  }

  /// `You can select the elements shown here in the settings.`
  String get dayspreview_no_elements_enabled_description {
    return Intl.message(
      'You can select the elements shown here in the settings.',
      name: 'dayspreview_no_elements_enabled_description',
      desc: '',
      args: [],
    );
  }

  /// `Current Deeds`
  String get daysreview_deeds_head {
    return Intl.message(
      'Current Deeds',
      name: 'daysreview_deeds_head',
      desc: '',
      args: [],
    );
  }

  /// `Backup / Restore`
  String get backup_restore {
    return Intl.message(
      'Backup / Restore',
      name: 'backup_restore',
      desc: '',
      args: [],
    );
  }

  /// `Choose folder`
  String get choose_folder {
    return Intl.message(
      'Choose folder',
      name: 'choose_folder',
      desc: '',
      args: [],
    );
  }

  /// `Create backup`
  String get create_backup {
    return Intl.message(
      'Create backup',
      name: 'create_backup',
      desc: '',
      args: [],
    );
  }

  /// `Restore from backup`
  String get restore_from_backup {
    return Intl.message(
      'Restore from backup',
      name: 'restore_from_backup',
      desc: '',
      args: [],
    );
  }

  /// `WARNING`
  String get restore_from_backup_warning {
    return Intl.message(
      'WARNING',
      name: 'restore_from_backup_warning',
      desc: '',
      args: [],
    );
  }

  /// `WARNING: YOU MAY LOOSE DATA\n\nRestoring a backup will delete all data currently stored in the app and replace it with the data from the backup.`
  String get restore_backup_confirm {
    return Intl.message(
      'WARNING: YOU MAY LOOSE DATA\n\nRestoring a backup will delete all data currently stored in the app and replace it with the data from the backup.',
      name: 'restore_backup_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Restore aborted, because the backup was created by an unsupported version.`
  String get backup_version_mismatch {
    return Intl.message(
      'Restore aborted, because the backup was created by an unsupported version.',
      name: 'backup_version_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `You can export all the data stored locally in the app (including settings) into a single file. This file can then be transferred to other devices, e.g. via cloud storage or per email. The data transfer also works from iOS to Android and vice-versa.\n\nPlease note however, restoring a backup is destructive. All previously existing data is lost during the restore.`
  String get backup_explanation {
    return Intl.message(
      'You can export all the data stored locally in the app (including settings) into a single file. This file can then be transferred to other devices, e.g. via cloud storage or per email. The data transfer also works from iOS to Android and vice-versa.\n\nPlease note however, restoring a backup is destructive. All previously existing data is lost during the restore.',
      name: 'backup_explanation',
      desc: '',
      args: [],
    );
  }

  /// `Already done`
  String get already_done {
    return Intl.message(
      'Already done',
      name: 'already_done',
      desc: '',
      args: [],
    );
  }

  /// `You have done all deeds planned for today already.`
  String get all_deeds_done_for_today {
    return Intl.message(
      'You have done all deeds planned for today already.',
      name: 'all_deeds_done_for_today',
      desc: '',
      args: [],
    );
  }

  /// `Set new reminder`
  String get set_reminder {
    return Intl.message(
      'Set new reminder',
      name: 'set_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Clear reminder`
  String get clear_reminder {
    return Intl.message(
      'Clear reminder',
      name: 'clear_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Change reminder`
  String get change_reminder {
    return Intl.message(
      'Change reminder',
      name: 'change_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Plan next confession`
  String get plan_next_confession {
    return Intl.message(
      'Plan next confession',
      name: 'plan_next_confession',
      desc: '',
      args: [],
    );
  }

  /// `Past confessions`
  String get past_confessions {
    return Intl.message(
      'Past confessions',
      name: 'past_confessions',
      desc: '',
      args: [],
    );
  }

  /// `Currently no confession planned`
  String get no_confession_planned {
    return Intl.message(
      'Currently no confession planned',
      name: 'no_confession_planned',
      desc: '',
      args: [],
    );
  }

  /// `You had planned to go to confession on`
  String get confession_planned_on_past {
    return Intl.message(
      'You had planned to go to confession on',
      name: 'confession_planned_on_past',
      desc: '',
      args: [],
    );
  }

  /// `Your next confession is planned for`
  String get confession_planned_on_future {
    return Intl.message(
      'Your next confession is planned for',
      name: 'confession_planned_on_future',
      desc: '',
      args: [],
    );
  }

  /// `No confessions yet`
  String get no_confessions_yet {
    return Intl.message(
      'No confessions yet',
      name: 'no_confessions_yet',
      desc: '',
      args: [],
    );
  }

  /// `Clear confession topics (requires password)`
  String get clear_confession_topics {
    return Intl.message(
      'Clear confession topics (requires password)',
      name: 'clear_confession_topics',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
