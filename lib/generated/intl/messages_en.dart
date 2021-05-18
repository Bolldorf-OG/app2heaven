// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(maxChapter) => "Valid chapters: 1-${maxChapter}";

  static String m1(maxVerse) => "Valid verses: 1-${maxVerse}";

  static String m2(date) => "Days preview ${date}";

  static String m3(date) => "Days review ${date}";

  static String m4(date) => "Planned for: ${date}";

  static String m5(link) =>
      "App2Heaven will always be completely free for its users. App2Heaven e.V. works to reach more people and bring God’s light into the world. Help us spread the word! More infos at [App2Heaven e.V.](${link})";

  static String m6(date) => "Your last confession was on ${date}.";

  static String m7(date, time) => "My confession was on ${date} at ${time}";

  static String m8(date) => "You planned your next confession on ${date}.";

  static String m9(startTime, duration) =>
      "Prayer time at ${startTime} today (${duration}). God awaits you.";

  static String m10(email) =>
      "App2Heaven is looking for app programmers to jointly develop the app on an open source platform. Interested? Then write us at ${email} or take a look at the code at https://github.com/Bolldorf-OG/app2heaven.";

  static String m11(count) =>
      "${Intl.plural(count, one: 'Read verse', other: 'Read verses')}";

  static String m12(date, time) =>
      "A reminder for your next confession on ${date} was created. You will be reminded on ${date} at ${time}.";

  static String m13(title, text, uri) =>
      "Take a look at this experience from my App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m14(title, text, uri) =>
      "Take a look at this word of god from my App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m15(title, text, uri) =>
      "Take a look at this prayer note from my App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m16(title, text, uri) =>
      "Please pray with me for this request from my App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m17(title, text, uri) =>
      "God helped! Thank you for praying for this request:\n${title}\n\n${text}\n${uri}";

  static String m18(date) => "Stimulus ${date}";

  static String m19(title, text) =>
      "Your daily reminder for \"${title}\":\n\n${text}";

  static String m20(title) => "\'${title}\' was saved.";

  static String m21(title, time) =>
      "You will be reminded of \'${title}\' at ${time} every day.";

  static String m22(x, y) => "${x} h ${y} min";

  static String m23(x) =>
      "${Intl.plural(x, one: '1 hour', other: '${x} hours')}";

  static String m24(x) =>
      "${Intl.plural(x, one: '1 minute', other: '${x} minutes')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actual": MessageLookupByLibrary.simpleMessage("Actual"),
        "actual_min": MessageLookupByLibrary.simpleMessage("Actual (min)"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "add_confession":
            MessageLookupByLibrary.simpleMessage("Add previous confession"),
        "all_deeds_done_for_today": MessageLookupByLibrary.simpleMessage(
            "You have done all deeds planned for today already."),
        "all_topics_were_deleted": MessageLookupByLibrary.simpleMessage(
            "All confessional topics were deleted"),
        "already_done": MessageLookupByLibrary.simpleMessage("Already done"),
        "analytics_dialog": MessageLookupByLibrary.simpleMessage(
            "Help us to develop the app further by submitting your usage statistics anonymously. You can change your decision at any time in the settings."),
        "analytics_info": MessageLookupByLibrary.simpleMessage(
            "If enabled, anonymous user statistics will be collected. For more info take a look at the privacy policy."),
        "archive": MessageLookupByLibrary.simpleMessage("Archive"),
        "at": MessageLookupByLibrary.simpleMessage("At:"),
        "attention": MessageLookupByLibrary.simpleMessage("Attention"),
        "audio_stimuli_last_days": MessageLookupByLibrary.simpleMessage(
            "Listen to audio-stimuli of the last few days on credo-online"),
        "audio_stimulus":
            MessageLookupByLibrary.simpleMessage("Audio-Stimulus"),
        "avg_per_day": MessageLookupByLibrary.simpleMessage("Average per day"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "backup_explanation": MessageLookupByLibrary.simpleMessage(
            "You can export all the data stored locally in the app (including settings) into a single file. This file can then be transferred to other devices, e.g. via cloud storage or per email. The data transfer also works from iOS to Android and vice-versa.\n\nPlease note however, restoring a backup is destructive. All previously existing data is lost during the restore."),
        "backup_restore":
            MessageLookupByLibrary.simpleMessage("Backup / Restore"),
        "backup_version_mismatch": MessageLookupByLibrary.simpleMessage(
            "Restore aborted, because the backup was created by an unsupported version."),
        "bible_book": MessageLookupByLibrary.simpleMessage("Book"),
        "bible_chapter": MessageLookupByLibrary.simpleMessage("Chapter"),
        "bible_chapter_max": m0,
        "bible_passage": MessageLookupByLibrary.simpleMessage("Bible passage"),
        "bible_passage_not_found_text": MessageLookupByLibrary.simpleMessage(
            "The passage you looked for were not found. Please check the reference and try again."),
        "bible_passage_not_found_title":
            MessageLookupByLibrary.simpleMessage("Passage not found"),
        "bible_reference_advice": MessageLookupByLibrary.simpleMessage(
            "Type the location that you want to read!"),
        "bible_verse_max": m1,
        "bible_verses": MessageLookupByLibrary.simpleMessage("Verse(s)"),
        "bible_verses_hint":
            MessageLookupByLibrary.simpleMessage("e.g. 3 or 1-5"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "caution": MessageLookupByLibrary.simpleMessage("CAUTION"),
        "change_reminder":
            MessageLookupByLibrary.simpleMessage("Change reminder"),
        "choose_folder": MessageLookupByLibrary.simpleMessage("Choose folder"),
        "clear_confession_topics": MessageLookupByLibrary.simpleMessage(
            "Clear confession topics (requires password)"),
        "clear_reminder":
            MessageLookupByLibrary.simpleMessage("Clear reminder"),
        "communities": MessageLookupByLibrary.simpleMessage("Communities"),
        "community_experiences": MessageLookupByLibrary.simpleMessage(
            "Experiences from communities"),
        "community_experiences_sub":
            MessageLookupByLibrary.simpleMessage("Vocation and more"),
        "community_select":
            MessageLookupByLibrary.simpleMessage("Community select"),
        "confession": MessageLookupByLibrary.simpleMessage("Confession"),
        "confession_empty_info": MessageLookupByLibrary.simpleMessage(
            "By saving you confession, your confession topics will be deleted."),
        "confession_info_head":
            MessageLookupByLibrary.simpleMessage("Why confess?"),
        "confession_info_head2":
            MessageLookupByLibrary.simpleMessage("How to confess?"),
        "confession_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "“If you forgive sins, they are forgiven,” Jesus says to his apostles. Confession gives the wonderful experience that the forgiveness of your sins is audibly promised in the name of Jesus. In this way you can experience God\'s merciful love first hand and personally. To be sure, going to confession always takes effort and is not easy for anyone. But if you dare not only to show your beautiful facade, but to be completely honest, you can have the delightful experience that God accepts and loves you as you are and opens up a new future for you through His forgiveness. Those who make use of this sacrament learn that confession always gives new joy in life and new impetus to do the good. That is why it is advisable to go to confession regularly (e.g. monthly, but at least before big celebrations such as Christmas and Easter)."),
        "confession_info_paragraph2": MessageLookupByLibrary.simpleMessage(
            "1.Take time to prepare for the confession (e.g. with the suggestions for thinking in this app). If you think of things that belong in a confession, you can write them down here so that they are not forgotten. To ensure discretion (your sins concern only you and God!), You can password-protect this area. To make sure that no strangers are snooping around in your sins, you should rather write down keywords or the topics at stake so you know what it is about, but nobody else.\n\n2. Tell God you\'re sorry and ask for His help to improve you. You can also enter a decision for the future right away.\n\n3. Go to a priest and confess your sins. Do not worry, the priest is not there to judge you, but to bring you God\'s mercy. If you are having trouble because you haven\'t been confessing for a long time or don\'t see some things clearly, just say it. The priest will help you. After the confession, he will give you some pointers, an encouraging encouragement and a penance, i.e. he tells you a prayer or an act. Repentance is to take a step in the right direction and heal something that has been hurt by sin. And above all, the priest gives you the release, the forgiveness of all sins in the name of God. If you enter the confession, all topics for the confession will be deleted - because even God will not remember them!\n\n4. You have become new! Say thank you to God - and start again with him in everyday life."),
        "confession_info_sub":
            MessageLookupByLibrary.simpleMessage("Confession - why and how"),
        "confession_password":
            MessageLookupByLibrary.simpleMessage("Confesstion Topics Password"),
        "confession_planned_on_future": MessageLookupByLibrary.simpleMessage(
            "Your next confession is planned for"),
        "confession_planned_on_past": MessageLookupByLibrary.simpleMessage(
            "You had planned to go to confession on"),
        "confession_planner":
            MessageLookupByLibrary.simpleMessage("Confession planner"),
        "confession_planner_description":
            MessageLookupByLibrary.simpleMessage("Plan and save confessions"),
        "confession_preparation_head":
            MessageLookupByLibrary.simpleMessage("Preparation for confession"),
        "confession_preparation_paragraph": MessageLookupByLibrary.simpleMessage(
            "Start with a simple request: \"Holy Spirit, show me what need things in my life reconciliation. Help me to look at my life honestly. Give me the courage to open up entirely \"The most important thing is. Nothing is embarrassing. On the contrary: It deserves the highest respect when someone sincerely confesses his sins. The words of Jesus will help you to look at your life in God\'s light."),
        "confession_preparation_sub": MessageLookupByLibrary.simpleMessage(
            "Instructions and questions for reflection"),
        "confession_reminder_message_today": MessageLookupByLibrary.simpleMessage(
            "‚The Lord is compassionate and gracious, slow to anger, abounding in love.‘ (Ps 103,8). You wanted to confess today."),
        "confession_today_text": MessageLookupByLibrary.simpleMessage(
            "„Praise the Lord, O my soul, and forget not all his benefits - who forgives all your sins and heals all your diseases, who redeems your life from the pit and crowns you with love and compassion“ (Ps 103,2-4)."),
        "confession_topics_sub": MessageLookupByLibrary.simpleMessage(
            "What I want to speak in confession"),
        "confessional_topic":
            MessageLookupByLibrary.simpleMessage("Confessional topic"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
        "content_language":
            MessageLookupByLibrary.simpleMessage("Content language"),
        "country_code": MessageLookupByLibrary.simpleMessage("Country Code"),
        "create_backup": MessageLookupByLibrary.simpleMessage("Create backup"),
        "creation_date": MessageLookupByLibrary.simpleMessage("Creation date"),
        "current_decisions":
            MessageLookupByLibrary.simpleMessage("Current decisions"),
        "current_decisions_sub":
            MessageLookupByLibrary.simpleMessage("to which I want to live"),
        "current_deeds":
            MessageLookupByLibrary.simpleMessage("Currently planned"),
        "current_deeds_sub":
            MessageLookupByLibrary.simpleMessage("I want to do"),
        "current_prayerrequests":
            MessageLookupByLibrary.simpleMessage("Current prayer requests"),
        "current_words": MessageLookupByLibrary.simpleMessage("Current words"),
        "current_words_sub":
            MessageLookupByLibrary.simpleMessage("accompany me"),
        "custom": MessageLookupByLibrary.simpleMessage("Custom"),
        "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
        "dashboard_settings":
            MessageLookupByLibrary.simpleMessage("Settings: Dashboard"),
        "dayspreview": MessageLookupByLibrary.simpleMessage("Days preview"),
        "dayspreview_date": m2,
        "dayspreview_decisions_head":
            MessageLookupByLibrary.simpleMessage("Decisions"),
        "dayspreview_decisions_sub":
            MessageLookupByLibrary.simpleMessage("I want to implement today"),
        "dayspreview_deeds_head": MessageLookupByLibrary.simpleMessage("Deeds"),
        "dayspreview_deeds_sub":
            MessageLookupByLibrary.simpleMessage("I want to realize today"),
        "dayspreview_no_elements_enabled_description":
            MessageLookupByLibrary.simpleMessage(
                "You can select the elements shown here in the settings."),
        "dayspreview_no_elements_enabled_title":
            MessageLookupByLibrary.simpleMessage("No elements configured"),
        "dayspreview_prayertime_head":
            MessageLookupByLibrary.simpleMessage("The time"),
        "dayspreview_prayertime_sub": MessageLookupByLibrary.simpleMessage(
            "I want to take for prayer today"),
        "dayspreview_settings":
            MessageLookupByLibrary.simpleMessage("Settings: Days Preview"),
        "dayspreview_words_head":
            MessageLookupByLibrary.simpleMessage("Word of God"),
        "dayspreview_words_sub": MessageLookupByLibrary.simpleMessage(
            "with whom I want to live today"),
        "daysreview": MessageLookupByLibrary.simpleMessage("Days review"),
        "daysreview_calm_head":
            MessageLookupByLibrary.simpleMessage("Come to rest"),
        "daysreview_calm_text":
            MessageLookupByLibrary.simpleMessage("Calm down"),
        "daysreview_calm_text2": MessageLookupByLibrary.simpleMessage(
            "Let look at you\nfrom God\'s loving gaze."),
        "daysreview_calm_text3": MessageLookupByLibrary.simpleMessage(
            "Let pass today\nin front of your inner eye."),
        "daysreview_calm_text4": MessageLookupByLibrary.simpleMessage(
            "What do you want to thank God?"),
        "daysreview_confession_button":
            MessageLookupByLibrary.simpleMessage("Add a topic for confession"),
        "daysreview_confession_head": MessageLookupByLibrary.simpleMessage(
            "What do you want to ask God for forgiveness?"),
        "daysreview_date": m3,
        "daysreview_decisions_head":
            MessageLookupByLibrary.simpleMessage("Current decisions"),
        "daysreview_deeds_head":
            MessageLookupByLibrary.simpleMessage("Current Deeds"),
        "daysreview_eveningprayer_head":
            MessageLookupByLibrary.simpleMessage("Evening prayer"),
        "daysreview_eveningprayer_paragraph": MessageLookupByLibrary.simpleMessage(
            "Now that the daylight dies away, By all thy grace and love, Thee, Maker of the world, we pray To watch our bed above.\n\nLet dreams depart and phantoms fly, The offspring of the night, Keep us, like shrines, beneath thine eye, Pure in our foe’s despite.\n\nThis grace on thy redeemed confer, Father, co-equal Son, And Holy Ghost, the Comforter, Eternal Three in One."),
        "daysreview_forgivness_head":
            MessageLookupByLibrary.simpleMessage("Confession of guilt"),
        "daysreview_forgivness_head2":
            MessageLookupByLibrary.simpleMessage("For forgiveness"),
        "daysreview_forgivness_paragraph": MessageLookupByLibrary.simpleMessage(
            "I confess to almighty God and to you, my brothers and sisters, that I have greatly sinned, in my thoughts and in my words, in what I have done and in what I have failed to do, through my fault, through my fault, through my most grievous fault; therefore I ask blessed Mary ever-Virgin, all the Angels and Saints, and you, my brothers and sisters, to pray for me to the Lord our God."),
        "daysreview_forgivness_paragraph2": MessageLookupByLibrary.simpleMessage(
            "May almighty God have mercy on me, forgive me my sins, and bring me to everlasting life."),
        "daysreview_prayertime_head":
            MessageLookupByLibrary.simpleMessage("Prayer time"),
        "daysreview_prayertime_sub":
            MessageLookupByLibrary.simpleMessage("Today I prayed"),
        "daysreview_prayertime_sub2": MessageLookupByLibrary.simpleMessage(
            "Scheduled prayer time tomorrow"),
        "daysreview_settings":
            MessageLookupByLibrary.simpleMessage("Settings: Days Review"),
        "decision": MessageLookupByLibrary.simpleMessage("Decision"),
        "decision_view": MessageLookupByLibrary.simpleMessage("View progress"),
        "decisions": MessageLookupByLibrary.simpleMessage("Decisions"),
        "decisions_archive_sub":
            MessageLookupByLibrary.simpleMessage("all previous decisions"),
        "decisions_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "There are moments when we understand that we should change something in our lives. It can be done in prayer or reading the Word of God - or when we really get on our noses. Then we usually take each other A good resolution, but how long good resolutions last is known ... That\'s why Saint Ignatius of Loyola came up with a useful tool: he suggests thinking about the decision we made in the morning and moving towards the end of the day check how it has been implemented, the advantage of this is that even if you can’t always achieve success, it’s not going to go wrong, you’ll always come across it, so with God’s help you can too Take a close look at stuck habits and slowly but surely practice new, better behaviors. It is true: without Jesus we cannot do anything. He gives us his light to recognize where we turn and the power to implement what is recognized. But it also applies: it can\'t work without us. We have to walk the path ourselves - and also use the appropriate aids. This function is such a tool to implement what you have known from God with his help in your life. "),
        "decisions_info_sub":
            MessageLookupByLibrary.simpleMessage("Make my life deliberately"),
        "deed": MessageLookupByLibrary.simpleMessage("Deed"),
        "deed_date_label": MessageLookupByLibrary.simpleMessage(
            "When do you want to do that?"),
        "deed_planned_for": m4,
        "deeds": MessageLookupByLibrary.simpleMessage("Deeds"),
        "deeds_archive_sub": MessageLookupByLibrary.simpleMessage("What I did"),
        "deeds_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "“Preach the gospel to all creatures!” (Mc 16:15), says Jesus. In Scripture it also says: \"We do not want to love with words and tongues, but in fact and truth\" (1 Jn 3:18). Evangelizing means sharing the good news of God\'s love with other people - in word and deed. So that this doesn\'t just remain a nice thought, you can write down here who you want to do something for: help, a small service, a visit, a conversation, an invitation to an event. Or maybe you have ideas for initiatives to build the Kingdom of God. If we listen in prayer and if we look at the people around us, God will let us know what to do so that He can come to people and people to Him. It is clear that we cannot “make” a person turn to God - that is the work of the Holy Spirit. But it is also clear: God wants us as his co-workers in order to enable people to experience his love."),
        "deeds_info_sub": MessageLookupByLibrary.simpleMessage(
            "Cooperate in the Kingdom of God"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deregister": MessageLookupByLibrary.simpleMessage("Unsubscribe"),
        "description_delete_many": MessageLookupByLibrary.simpleMessage(
            "You can now delete multiple items at once by clicking this icon, selecting them in the list and then clicking the button in the bottom right corner."),
        "description_share_many": MessageLookupByLibrary.simpleMessage(
            "You can now share or export multiple items at once by clicking this icon, selecting them in the list and then clicking the button in the bottom right corner."),
        "display": MessageLookupByLibrary.simpleMessage("Display"),
        "donate_now": MessageLookupByLibrary.simpleMessage("Learn more"),
        "donations": MessageLookupByLibrary.simpleMessage("Donations"),
        "donations_dialog": MessageLookupByLibrary.simpleMessage(
            "App2Heaven will always be completely free for its users. App2Heaven e.V. works to reach more people and bring God’s light into the world. Help us by giving us feedback about your user experience, giving us your suggestions for the further development of the app, telling your friends about App2Heaven or visiting the donation page."),
        "donations_text_markdown": m5,
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "duration": MessageLookupByLibrary.simpleMessage("Duration:"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "edit_decision": MessageLookupByLibrary.simpleMessage("Edit decision"),
        "edit_deed": MessageLookupByLibrary.simpleMessage("Edit deed"),
        "edit_faith_experience":
            MessageLookupByLibrary.simpleMessage("Edit faith experience"),
        "edit_prayer_note":
            MessageLookupByLibrary.simpleMessage("Edit prayer note"),
        "edit_prayer_request":
            MessageLookupByLibrary.simpleMessage("Edit prayer request"),
        "edit_topic": MessageLookupByLibrary.simpleMessage("Edit topic"),
        "edit_word": MessageLookupByLibrary.simpleMessage("Edit word"),
        "end_prayertime":
            MessageLookupByLibrary.simpleMessage("End prayer time"),
        "enter_new_password": MessageLookupByLibrary.simpleMessage(
            "Please enter a new password for you confession topics:"),
        "enter_password":
            MessageLookupByLibrary.simpleMessage("Please enter your password:"),
        "error": MessageLookupByLibrary.simpleMessage("error"),
        "error_no_location":
            MessageLookupByLibrary.simpleMessage("Please enter a location."),
        "error_past_time": MessageLookupByLibrary.simpleMessage(
            "Please choose a date and time in the future."),
        "experiences": MessageLookupByLibrary.simpleMessage("Experiences"),
        "experiences_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "God is always at work (cf. John 5:17), but it is not always easy to recognize his work. Sometimes we can just afterwards discover his traces in our lives - like Moses, who could not see God directly, but rather its \"back\" (cf. Ex 33.18 to 33.). This can be: how a word of God showed you the right way and transformed anything in your life. A turn of events in which I see a fruit of prayer or the surprising act of a providence from God. Giving testimony means: Speaking about how to expirience God\'s work. Nothing encourages us so much in faith as the testimony of others. This tells us that faith is not a dubious theory but that God lives and acts into our life. Therefore you can write in this section how you have experienced Gods works. These testimonies you can then share with others and thus bear witness to your faith. And of course, read the testimonies of others and let you strengthen by them in faith."),
        "experiences_info_sub": MessageLookupByLibrary.simpleMessage(
            "Why testimonies are important"),
        "experiences_sub": MessageLookupByLibrary.simpleMessage("How God acts"),
        "faith_experience":
            MessageLookupByLibrary.simpleMessage("Faith experience"),
        "faithexperiences":
            MessageLookupByLibrary.simpleMessage("Faith experiences"),
        "favourites": MessageLookupByLibrary.simpleMessage("Favourites"),
        "font_size": MessageLookupByLibrary.simpleMessage("Text size"),
        "fontsize": MessageLookupByLibrary.simpleMessage("Font size"),
        "former_prayerrequests":
            MessageLookupByLibrary.simpleMessage("Earlier prayer requests"),
        "god_helped": MessageLookupByLibrary.simpleMessage("God helped!"),
        "gods_word_reminder":
            MessageLookupByLibrary.simpleMessage("Remembering God\'s Word"),
        "hide_from_current":
            MessageLookupByLibrary.simpleMessage("Hide from current"),
        "highlight": MessageLookupByLibrary.simpleMessage("Highlight"),
        "hours": MessageLookupByLibrary.simpleMessage("Hours"),
        "info": MessageLookupByLibrary.simpleMessage("Info"),
        "intended_min": MessageLookupByLibrary.simpleMessage("Intended (min)"),
        "introduction": MessageLookupByLibrary.simpleMessage("Introduction"),
        "introduction_text": MessageLookupByLibrary.simpleMessage(
            "Welcome to the App2Heaven!\n\nThe app wants to support you in living with God in everyday life. Here are a few tips on how you can use the individual functions step by step.\n\nSelect the \"Prayer Time\" function and read the information text. Think about how much time you want to take each day for prayer. Personal prayer is the basis for spiritual life. That\'s why it\'s important to stay on top of it - even if it didn\'t work out on a particularly chaotic day. It is best to start with a shorter time that is realistic, e.g. 5 or 10 minutes. In the info text you will find different forms of prayer. Pray as it suits you and does you good. Let yourself be led by the Holy Spirit, who is our teacher in prayer.\n\nIf something clear in prayer that you don\'t want to forget, you can take notes after the prayer time. If it is a thought that is also uplifting for others, you can also share it with friends who also use the App2Heaven. So you stay in spiritual community.\n\nThe \"Prayer Requests\" menu is also intended for the prayer community. Here you can write down for yourself what you want to pray for, but you can also share these concerns with others so that you can pray for them together.\n\nWe cannot always experience God\'s work noticeably. It is all the more encouraging to hear testimonies of how God works today. You will find examples of this in the \"Faith Experiences\" function - and you can also write down and share them yourself if they are given to you as gifts.\n\nIf individual words of God particularly appeal to you, e.g. after a service or reading the Bible, you can write it down using the \"Word of God\" function, take it back with your personal prayer or be reminded of it to take it with you in everyday life.\n\nSometimes in prayer we come up with ideas and ideas about what we could do for God and people - you can write this down in the \"Actions\" function and plan when you want to implement it.\n\nThe two functions \"Preview\" and \"Day review\" help you to start and end the day with God.\n\nWe don\'t always succeed in life the way we want it to. When we experience painfully that we are lagging behind the love that we actually want to give each other and God, God offers us his mercy. In the “Confession” section you will find out what this sacrament is all about, how to prepare for it.\n\nAll these different functions of the app are offers. You do not have to use all of them at the same time, but you can individually select what is currently helping you personally to stay in contact with God. There is also a separate, more detailed info text for each function. The app wants to inspire you and give you suggestions - but the most important thing is that you go your own personal way with God!"),
        "introduction_to_the_app":
            MessageLookupByLibrary.simpleMessage("Introduction to the app"),
        "invalid_prayertimes": MessageLookupByLibrary.simpleMessage(
            "Not all items have a valid prayer time"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "large": MessageLookupByLibrary.simpleMessage("large"),
        "last_confession": m6,
        "later": MessageLookupByLibrary.simpleMessage("Later"),
        "loading_experience":
            MessageLookupByLibrary.simpleMessage("Loading experience..."),
        "loading_passage":
            MessageLookupByLibrary.simpleMessage("Loading passage..."),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "lock": MessageLookupByLibrary.simpleMessage("Lock"),
        "medium": MessageLookupByLibrary.simpleMessage("medium"),
        "menu_language": MessageLookupByLibrary.simpleMessage("Menu language"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutes"),
        "missing_text":
            MessageLookupByLibrary.simpleMessage("Please enter the text"),
        "missing_title":
            MessageLookupByLibrary.simpleMessage("Please enter a title"),
        "missing_value": MessageLookupByLibrary.simpleMessage("Please fill in"),
        "monthly_prayerrequest": MessageLookupByLibrary.simpleMessage(
            "Prayer intentions of the month"),
        "morning_prayer": MessageLookupByLibrary.simpleMessage(
            "(automatically translated from German)\n\nLord Jesus Christ, in the silence of this dawning morning, I come to you and plead with humility and confidence for your peace, your wisdom, your strength.\nGrant that today I look at the world with eyes that are full of love.\nLet me understand that all the glory of the church springs from your cross as its source.\nLet me receive my neighbor as the man whom you want to love through me.\nGive me the willingness to serve Him with devotion and unfold all the goodness you have put into Him.\nMy words should radiate gentleness and my whole behavior should bring peace.\nOnly those thoughts that spread blessings should stick in my mind.\nClose my ears to any malicious word and criticism.\nMay my tongue only serve to emphasize the good.\nAbove all, O Lord, cause that I am so full of joy and well-being that all who meet me will feel both your presence and your love.\nDress me with the splendor of your goodness and your beauty, so that I may reveal you in the course of this day.\nAmen."),
        "morning_prayer_head": MessageLookupByLibrary.simpleMessage(
            "Morning prayer of Sacred Mirjam of Abellin (view)"),
        "my_confession_was_on": m7,
        "my_confession_was_on_fallback":
            MessageLookupByLibrary.simpleMessage("No confession yet"),
        "my_faithexperiences":
            MessageLookupByLibrary.simpleMessage("My faith experiences"),
        "mynumber": MessageLookupByLibrary.simpleMessage("My Number"),
        "new_decision": MessageLookupByLibrary.simpleMessage("New Decision"),
        "new_decision_hint": MessageLookupByLibrary.simpleMessage(
            "Press + to add a new decision"),
        "new_deed": MessageLookupByLibrary.simpleMessage("New deed"),
        "new_deed_hint":
            MessageLookupByLibrary.simpleMessage("Press + to add a new deed"),
        "new_faith_experience":
            MessageLookupByLibrary.simpleMessage("New faith experience"),
        "new_faith_experience_hint": MessageLookupByLibrary.simpleMessage(
            "Press + to add a new faith experience"),
        "new_prayer_note":
            MessageLookupByLibrary.simpleMessage("New prayer note"),
        "new_prayer_note_hint": MessageLookupByLibrary.simpleMessage(
            "Press + to add a new prayer note"),
        "new_prayer_request":
            MessageLookupByLibrary.simpleMessage("New prayer request"),
        "new_prayer_request_hint": MessageLookupByLibrary.simpleMessage(
            "Press + to add a new prayer request"),
        "new_topic": MessageLookupByLibrary.simpleMessage("New topic"),
        "new_topic_hint": MessageLookupByLibrary.simpleMessage(
            "Press + to add a new confessional topic"),
        "new_word": MessageLookupByLibrary.simpleMessage("New word"),
        "new_word_hint":
            MessageLookupByLibrary.simpleMessage("Press + to add a new word"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "next_confession":
            MessageLookupByLibrary.simpleMessage("Next confession on:"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "no_bible_books": MessageLookupByLibrary.simpleMessage("No book found"),
        "no_communities": MessageLookupByLibrary.simpleMessage(
            "No communities found\nPlease, check your internet connection"),
        "no_community_experiences": MessageLookupByLibrary.simpleMessage(
            "No experiences found\nPlease, check your internet connection"),
        "no_confession_planned": MessageLookupByLibrary.simpleMessage(
            "Currently no confession planned"),
        "no_confession_topics": MessageLookupByLibrary.simpleMessage(
            "You haven\'t created any confession topics yet"),
        "no_confessions_yet":
            MessageLookupByLibrary.simpleMessage("No confessions yet"),
        "no_decisions": MessageLookupByLibrary.simpleMessage(
            "You haven\'t made any decisions yet"),
        "no_deeds": MessageLookupByLibrary.simpleMessage(
            "You haven\'t planned any deeds yet"),
        "no_deeds_today": MessageLookupByLibrary.simpleMessage(
            "You haven\'t planned any deeds for today"),
        "no_experiences": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any experiences yet"),
        "no_gods_words": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any words yet"),
        "no_prayer_notes": MessageLookupByLibrary.simpleMessage(
            "You haven\'t made any prayer notes yet"),
        "no_prayer_request_of_month": MessageLookupByLibrary.simpleMessage(
            "There is no prayer request for the current month."),
        "no_prayer_requests": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any prayer requests yet"),
        "no_stimuli": MessageLookupByLibrary.simpleMessage(
            "No stimuli found\nPlease, check your internet connection"),
        "no_stimulus_of_day": MessageLookupByLibrary.simpleMessage(
            "No daily stimulus found. Please check your internet connection."),
        "no_stimulus_tags": MessageLookupByLibrary.simpleMessage(
            "No categories found\nPlease, check your internet connection"),
        "note": MessageLookupByLibrary.simpleMessage("Note"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open_bible": MessageLookupByLibrary.simpleMessage("Open Bible"),
        "open_bible_needs_internet": MessageLookupByLibrary.simpleMessage(
            "You must be connected to the internet to read bible passages."),
        "open_bible_somewhere":
            MessageLookupByLibrary.simpleMessage("Suggest bible verse"),
        "open_bible_sub":
            MessageLookupByLibrary.simpleMessage("Read and write words"),
        "others": MessageLookupByLibrary.simpleMessage("Others"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_request":
            MessageLookupByLibrary.simpleMessage("Password request"),
        "passwords_dont_match":
            MessageLookupByLibrary.simpleMessage("The passwords do not match!"),
        "past_confessions":
            MessageLookupByLibrary.simpleMessage("Past confessions"),
        "plan_next_confession":
            MessageLookupByLibrary.simpleMessage("Plan next confession"),
        "planned": MessageLookupByLibrary.simpleMessage("Planned"),
        "planned_confession": m8,
        "planning": MessageLookupByLibrary.simpleMessage("Planning"),
        "planning_button_sub":
            MessageLookupByLibrary.simpleMessage("Finding time for God."),
        "planning_head": MessageLookupByLibrary.simpleMessage(
            "Tap the day and choose the time you want to take for prayer every day!"),
        "planning_sub": MessageLookupByLibrary.simpleMessage(
            "You will receive a reminder 10 minutes before the set time."),
        "prayer_clock": MessageLookupByLibrary.simpleMessage("Prayer clock"),
        "prayer_info_head":
            MessageLookupByLibrary.simpleMessage("What is prayer?"),
        "prayer_info_head2": MessageLookupByLibrary.simpleMessage("Why pray?"),
        "prayer_info_head3": MessageLookupByLibrary.simpleMessage("When pray?"),
        "prayer_info_head4": MessageLookupByLibrary.simpleMessage(
            "How to pray with App2Heaven?"),
        "prayer_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Prayer is more than addressing words to God. It is friendship with God. Prayer is: faith that He is there for you and loves you. Tell him what you have on your mind. Hear what he has to tell you. Or just relax in his presence. You\'ll learn: Prayer provides you light and strength for your way. When you pray, you will discover who you are and what you want to live."),
        "prayer_info_paragraph2": MessageLookupByLibrary.simpleMessage(
            "Can you imagine a friendship, in which one person not always talks to the other? Lack of communication takes us apart. So we are moving away from God if we don\'t spend time with him. The relationship with him is the most important one, because it shows us the meaning and the right paths for our lives. That\'s why prayer is so important for our spiritual life as breathing for the body. The difference is: Breathe goes automatically but pray quickly goes by the board, if you don\'t decide to it. But this app is here. With it you can organize your life, so that you can schedule time again to consciously spend it in communion with God. This will help you, living your whole life more and more in the presence of God. With that your life in heaven already has begun."),
        "prayer_info_paragraph3": MessageLookupByLibrary.simpleMessage(
            "Scripture tells us that we should “always pray” (Luke 18: 1). This means that we can always live in friendship with God, even in the midst of our everyday activities. But in order to stay with God inwardly, there are times in the day when we specifically turn to God. In addition to the Sunday service (or once a week), we suggest the following:\n\n• A short prayer in the morning, e.g. a sign of the cross, a song of praise, a psalm or a personal prayer. Look ahead to the day and ask God for his blessing!\n\n• A personal prayer time anytime of the day. It\'s best not to overdo it so that you can keep the time. But it should be long enough to really listen to God and be able to bring all important things to him. It is important to set a fixed time and be faithful to it so that prayer is not left to chance or mood. It is helpful to plan the prayer times in advance and enter them in the calendar.\n\n• A short prayer before going to bed with a look back at the day. Bring everything that was before God so that you can go to bed with gratitude and peace in your heart!"),
        "prayer_info_paragraph4": MessageLookupByLibrary.simpleMessage(
            "Jesus has withdrawn to loneliness for prayer. Find yourself a quiet place where you will not be disturbed. It is best to switch the cell phone to \"do not disturb\". In the app under “Prayer time” click on “Start prayer time”, open your prayer with a cross sign and make yourself aware that God is there. When you pray at home, a sign can help, e.g. a candle, a cross or an icon. Prayer is about being completely with God. Try to be quiet in his presence. Many thoughts may come up in you - all of this is part of your life. Make them a prayer, a thank you, or a request. So you bring everything before God. The most important thing is that He is there now. Don\'t let it bother you if you keep thinking of unimportant things - just let them go by and keep looking for the presence of God.\n\nThere is no particular \"method\" to follow as you continue to pray. After all, prayer is friendship with God, and in friendship friends make their relationship the way it suits them. But there are different forms of prayer. Pick the one that suits you right now and help pray!\n\n• The contemplation: take a text from the Holy Scriptures, e.g. one section at a time from a gospel. Or the daily gospel. Or just open the Bible somewhere - in book form or with the corresponding App2Heaven function. Or read the words you wrote down in the \"Word of God\" section of the app. Read the text slowly and carefully. Does God have something to say to you for your life through this text? How are you going to answer God\'s word? Does God let you know something to do? But not only the Scriptures, but also a spiritual book, creation and above all your life can be considered. God can speak to us in everything. You can also read an impulse or a certificate from this app. Try to talk to God based on these thoughts. Where do you hear a call from God? A well-tried method of viewing is also the rosary - you can find instructions at www.rosenkranz-beten.de.\n\n• Inner Prayer: You can just speak to God knowing that He is there and loves you. In any friendship, it is important not only to speak or to ask, but also to perceive the person of the other. And just like in a human friendship, you can be with God without words. In inner prayer, you can simply spend a long time remaining silent in God\'s presence and lingering in His light and love. Such a prayer can do more than a prayer with many words.\n\n• Eucharistic adoration: When the Emmaus disciples asked Jesus \"stay with us!\", Jesus went with them and broke the bread with them. In the celebration of the Eucharist, Jesus stays with us in a special way. Sometimes the consecrated host is shown for prayer, this is called “Eucharistic adoration”. We see the bread that has been transformed and know in faith: this is Jesus. He is there with all his love that he showed us on the cross. He is there as the Risen One who speaks to us today and gives us his Holy Spirit. In Eucharistic adoration you can pray in all the forms explained above, but the special thing is to look at Him - and let Him look at you.\n\nAt the end of the prayer time, look back and think about what you want to take with you from this prayer time. You can write down thoughts that came to you about your life or your beliefs. The writing down helps to record findings and to get them clearer again. It can also be nice to share such spiritual thoughts with people we trust.\n\nPerhaps in prayer you have recognized something that God wants from you and now it is up to you to decide to live life more according to God\'s will and following Jesus. Then you can write it down in the \"Decisions\" section.\n\nAt the end thank God and deliberately close with a sign of the cross or the Lord\'s Prayer - and click on \"End prayer time\", then the time is automatically saved. This way you can see how your prayer times are developing."),
        "prayer_info_sub":
            MessageLookupByLibrary.simpleMessage("Praying - Why, when, how?"),
        "prayer_note": MessageLookupByLibrary.simpleMessage("Prayer note"),
        "prayer_notes": MessageLookupByLibrary.simpleMessage("Prayer notes"),
        "prayer_notes_sub": MessageLookupByLibrary.simpleMessage(
            "Notice what you have received"),
        "prayer_request":
            MessageLookupByLibrary.simpleMessage("Prayer request"),
        "prayer_request_done": MessageLookupByLibrary.simpleMessage("Answered"),
        "prayer_time": MessageLookupByLibrary.simpleMessage("Prayer time"),
        "prayerrequests":
            MessageLookupByLibrary.simpleMessage("Prayer requests"),
        "prayerrequests_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Here you can write down all the concerns for which you want to pray, so they are not forgotten. Very urgent concerns can be highlighted. Perhaps it turns out over time, that your requests are changing - then you can rephrase them. With one click you have all your current prayer requests in mind. You can also share them with other App2heaven users. Your can tag your prayer requests in which you have experienced they have been heard. It feels good reading those petitions, who have been heard, now and again and for thanking what God has done for us."),
        "prayertime_reminder": m9,
        "prayertimes": MessageLookupByLibrary.simpleMessage("Prayer times"),
        "prayertimes1": MessageLookupByLibrary.simpleMessage("Prayer times"),
        "preparation": MessageLookupByLibrary.simpleMessage("Preparation"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "privacy_text": MessageLookupByLibrary.simpleMessage(
            "Bei der Installation der App2Heaven werden eine Reihe von Berechtigungen angefragt, die für die Funktionalität der App und insbesondere für die Messaging-Funktion notwendig sind. Grundsätzlich werden die Inhalte, die du in die App2Heaven schreibst, nur auf deinem Smartphone gespeichert - darauf können weder die App2Heaven-Zentrale noch andere App2Heaven-Nutzer zugreifen. Geteilte Inhalte laufen über einen App2Heaven-Internet-Server. Alle eingegebenen Daten werden von uns vertraulich behandelt. Sie werden nur im Rahmen der App2Heaven verwendet. Sie werden in keiner Form - weder anonym noch personalisiert - gelesen oder ausgewertet. Sie werden in keiner Form an Dritte weitergegeben. Es werden keine Statistiken über Inhalte oder Nutzerverhalten angelegt. So möchte die App2Heaven die größtmögliche Diskretion der Inhalte gewährleisten.\n\nBei der App-Entwicklung wurden im Rahmen des Möglichen Schutzmaßnahmen ergri?en, um Datensicherheit zu gewährleisten. Gleichwohl kann keine Verantwortung dafür übernommen werden, dass nicht doch solche Vorkehrungen überwunden werden und es zu Datenverlusten kommt. Eine 100%ige Sicherheit vertraulicher Daten kann damit nicht garantiert werden. Daher übernimmt der App2Heaven e.V. keine Haftung für Datenverlust oder Datendiebstahl. Weiterhin haftet der Verein nicht dafür, dass die Inhalte der App jederzeit zur Verfügung stehen.\n\nDer Verein behält sich vor, dass der Dienst jederzeit eingestellt werden kann."),
        "privacy_text_info": MessageLookupByLibrary.simpleMessage(
            "The privacy policy can be viewed in the Settings menu."),
        "privacy_text_ok": MessageLookupByLibrary.simpleMessage("Roger"),
        "privacy_text_title":
            MessageLookupByLibrary.simpleMessage("Privacy note"),
        "programmers_dialog": m10,
        "random_experience":
            MessageLookupByLibrary.simpleMessage("Faith experience"),
        "random_stimulus": MessageLookupByLibrary.simpleMessage("Stimulus"),
        "random_word_of_god":
            MessageLookupByLibrary.simpleMessage("Word of God"),
        "rating": MessageLookupByLibrary.simpleMessage("Rating"),
        "rating_max": MessageLookupByLibrary.simpleMessage(
            "Great! Thanks be to the Lord! You can do all things through Him who strengthens you. (cf. Phil. 4:13)"),
        "rating_min": MessageLookupByLibrary.simpleMessage(
            "Don\'t be sad. Tomorrow is a new day and “the Lord\'s mercies new every morning” (Lam. 3:22-23)"),
        "read": MessageLookupByLibrary.simpleMessage("Read"),
        "read_passage": MessageLookupByLibrary.simpleMessage("Read passage"),
        "read_verses": m11,
        "real_prayertimes": MessageLookupByLibrary.simpleMessage("Pray now"),
        "real_prayertimes_sub":
            MessageLookupByLibrary.simpleMessage("Your spent time with God"),
        "reference_example":
            MessageLookupByLibrary.simpleMessage("e.g. Rom. 2:28"),
        "refreshed_data":
            MessageLookupByLibrary.simpleMessage("Refreshed data"),
        "remember_confession":
            MessageLookupByLibrary.simpleMessage("Remember confession"),
        "reminder": MessageLookupByLibrary.simpleMessage("Reminder"),
        "reminder_created":
            MessageLookupByLibrary.simpleMessage("Reminder created"),
        "reminder_created_confession": m12,
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "reset_demo": MessageLookupByLibrary.simpleMessage("Reset demo"),
        "reset_password":
            MessageLookupByLibrary.simpleMessage("Reset password"),
        "reset_password_caution": MessageLookupByLibrary.simpleMessage(
            "The current confession topics will be deleted, if you reset the password."),
        "reset_password_message":
            MessageLookupByLibrary.simpleMessage("Shall password be reseted?"),
        "restore_backup_confirm": MessageLookupByLibrary.simpleMessage(
            "WARNING: YOU MAY LOOSE DATA\n\nRestoring a backup will delete all data currently stored in the app and replace it with the data from the backup."),
        "restore_from_backup":
            MessageLookupByLibrary.simpleMessage("Restore from backup"),
        "restore_from_backup_warning":
            MessageLookupByLibrary.simpleMessage("WARNING"),
        "same_time_every_day":
            MessageLookupByLibrary.simpleMessage("Use same time every day"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "save_and_empty":
            MessageLookupByLibrary.simpleMessage("Save and empty"),
        "save_confession":
            MessageLookupByLibrary.simpleMessage("Save confession"),
        "saved": MessageLookupByLibrary.simpleMessage("Saved"),
        "select_language":
            MessageLookupByLibrary.simpleMessage("Select your language"),
        "send_data": MessageLookupByLibrary.simpleMessage("Send data"),
        "send_mail": MessageLookupByLibrary.simpleMessage("Send e-mail"),
        "set_reminder":
            MessageLookupByLibrary.simpleMessage("Set new reminder"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "seven_day_review":
            MessageLookupByLibrary.simpleMessage("Seven-Day review"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "share_experience": m13,
        "share_gods_word": m14,
        "share_prayer_note": m15,
        "share_prayer_request": m16,
        "share_prayer_request_done": m17,
        "show_history": MessageLookupByLibrary.simpleMessage("Show history"),
        "show_in_current":
            MessageLookupByLibrary.simpleMessage("Show in Current"),
        "shown_elements":
            MessageLookupByLibrary.simpleMessage("Shown Elements"),
        "small": MessageLookupByLibrary.simpleMessage("small"),
        "soundcloud_button_info": MessageLookupByLibrary.simpleMessage(
            "If asked please select the \"Listen in Browser\" option below."),
        "start_prayertime":
            MessageLookupByLibrary.simpleMessage("Start prayer time"),
        "stimuli_by_category":
            MessageLookupByLibrary.simpleMessage("Stimuli by category"),
        "stimulus_head": m18,
        "stimulus_intro": MessageLookupByLibrary.simpleMessage(
            "In the name of the Father and the Son and the Holy Spirit. Amen."),
        "stimulus_to_prayer":
            MessageLookupByLibrary.simpleMessage("Stimulus to prayer"),
        "stimulus_to_prayer_sub": MessageLookupByLibrary.simpleMessage(
            "Thoughts that lead in prayer"),
        "successfully_registred": MessageLookupByLibrary.simpleMessage(
            "You are successfully registred."),
        "text": MessageLookupByLibrary.simpleMessage("Text"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "topics": MessageLookupByLibrary.simpleMessage("Topics"),
        "try_again": MessageLookupByLibrary.simpleMessage("Try again"),
        "unhighlight": MessageLookupByLibrary.simpleMessage("Unhighlight"),
        "unlock": MessageLookupByLibrary.simpleMessage("Unlock"),
        "update_confession_text": MessageLookupByLibrary.simpleMessage(
            "With the last update the encryption of the confession topics was changed. A password is now always required. If no password was set before the update, pleae leave the field in the following dialog empty and just click OK. The password can be (re-)set in the Settings menu, but in doing this you will loose your current confession topics."),
        "use_system_language":
            MessageLookupByLibrary.simpleMessage("Use system language"),
        "view_code": MessageLookupByLibrary.simpleMessage("View code"),
        "week_overview": MessageLookupByLibrary.simpleMessage("Week overview"),
        "welcome_app_language_text": MessageLookupByLibrary.simpleMessage(
            "For the beginning, please choose the app language :"),
        "welcome_content_language_text": MessageLookupByLibrary.simpleMessage(
            "Please now choose the content language:"),
        "welcome_intro": MessageLookupByLibrary.simpleMessage(
            "The app proposes different languages. You can configure it now, and later on in the settings."),
        "welcome_title":
            MessageLookupByLibrary.simpleMessage("Welcome to the App2Heaven!"),
        "when": MessageLookupByLibrary.simpleMessage("When?"),
        "word": MessageLookupByLibrary.simpleMessage("Word"),
        "word_format_error": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid bible reference (in German format). e.g. \'1. Petrus 2,3\' oder \'1. Petrus 2,4-6\'"),
        "word_of_god": MessageLookupByLibrary.simpleMessage("Word of God"),
        "word_reminder": m19,
        "word_saved": m20,
        "words": MessageLookupByLibrary.simpleMessage("Words"),
        "words_archive_sub":
            MessageLookupByLibrary.simpleMessage("of all saved words"),
        "words_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "In the words of Scripture, God speaks to us. He shows us what he is like and lets us see important things about our life. We often feel when we read the Bible or hear the services: This word is for me! It makes me understand something important. It shows me something to do. Then it is important that I also record this word. \"Don\'t just listen to the word, but act accordingly; otherwise you will cheat yourself,\" says the letter to James (1:22). The danger is that we will quickly forget what we have heard and nothing will change in our life. But if we hear the word and act on it, our life becomes and God leads us on his way. This function helps you to listen better to God\'s word. Write down the words that have spoken to you. Take them back for prayer, look at them again in between or let yourself through the memories remember them in everyday life. Then the words will seep into your heart, they will stay in you and bear fruit. You can decide which current words you want to see immediately, add new words or hide other words. Under \"all words\" you can also see those that have been hidden for some time. Sometimes it is interesting to read these words in context again and discover a “common thread” and see how God leads you through his word.\nYou can decide which current words you want to see immediately, add new words or hide other words. Under \"all words\" you can also see those that have been hidden for some time. Sometimes it is interesting to read these words together again and discover a “common thread” and see how God leads you through his word. "),
        "words_info_sub":
            MessageLookupByLibrary.simpleMessage("Life with God\'s Word"),
        "words_reminder_enabled": m21,
        "words_reminder_head": MessageLookupByLibrary.simpleMessage(
            "Let yourself remember in everyday life to the Word of God!"),
        "words_reminder_no_current_words": MessageLookupByLibrary.simpleMessage(
            "You must have an entry in \'Current Words\' to be reminded of it."),
        "words_reminder_sub":
            MessageLookupByLibrary.simpleMessage("the word in everyday life"),
        "write_text": MessageLookupByLibrary.simpleMessage("Write text"),
        "wrong_password":
            MessageLookupByLibrary.simpleMessage("Wrong password"),
        "wrong_password_text": MessageLookupByLibrary.simpleMessage(
            "The password is wrong, please try again. (You can reset your password in the settings, if you forgot it.)"),
        "x_h_y_min": m22,
        "x_hours": m23,
        "x_minutes": m24,
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
