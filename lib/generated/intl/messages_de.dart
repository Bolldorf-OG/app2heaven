// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(maxChapter) => "Gültige Kapitel: 1-${maxChapter}";

  static String m1(maxVerse) => "Gültige Verse: 1-${maxVerse}";

  static String m2(date) => "Tagesvorschau ${date}";

  static String m3(date) => "Tagesrückblick ${date}";

  static String m4(date) => "Geplant für: ${date}";

  static String m5(date) => "Deine letzte Beichte war am ${date}.";

  static String m6(date, time) =>
      "Meine letzte Beichte war am ${date} um ${time} Uhr";

  static String m7(date) => "Du hast deine nächste Beichte am ${date} geplant.";

  static String m8(startTime, duration) =>
      "Gebetszeit um ${startTime} Uhr (${duration}). Der Herr erwartet Dich!";

  static String m9(email) =>
      "Die App2Heaven sucht App-Programmierer für eine gemeinsame Weiterentwicklung der App auf einer Open-Source-Plattform. Interessiert? Dann melde dich unter ${email} oder sieh dir den Code auf https://github.com/Bolldorf-OG/app2heaven an.";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Vers lesen', other: 'Verse lesen')}";

  static String m11(date, time) =>
      "Erinnerung für deine nächste Beichte am ${date} erstellt. Du wirst am ${date} um ${time} erinnert.";

  static String m12(title, text, uri) =>
      "Sieh Dir diese Erfahrung aus meiner App2Heaven an:\n${title}\n\n${text}\n${uri}";

  static String m13(title, text, uri) =>
      "Sieh Dir dieses Bibelwort aus meiner App2Heaven an:\n${title}\n\n${text}\n${uri}";

  static String m14(title, text, uri) =>
      "Sieh Dir diese Gebetsnotiz aus meiner App2Heaven an:\n${title}\n\n${text}\n${uri}";

  static String m15(title, text, uri) =>
      "Bitte bete mit mir für dieses Gebetsanliegen aus meiner App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m16(title, text, uri) =>
      "Gott hat geholfen! Danke für dein Mitbeten für dieses Anliegen:\n${title}\n\n${text}\n${uri}";

  static String m17(date) => "Impuls ${date}";

  static String m18(title, text) =>
      "Deine täglich Erinnerung an \"${title}\":\n\n${text}";

  static String m19(title) => "\'${title}\' wurde gespeichert.";

  static String m20(title, time) =>
      "Du wirst jeden Tag um ${time} an \'${title}\' erinnert.";

  static String m21(x, y) => "${x} h ${y} min";

  static String m22(x) =>
      "${Intl.plural(x, one: '${x} Stunde', other: '${x} Stunden')}";

  static String m23(x) =>
      "${Intl.plural(x, one: '${x} Minute', other: '${x} Minuten')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actual": MessageLookupByLibrary.simpleMessage("Tatsächlich"),
        "actual_min": MessageLookupByLibrary.simpleMessage("Tatsächlich (min)"),
        "add": MessageLookupByLibrary.simpleMessage("Hinzufügen"),
        "add_confession":
            MessageLookupByLibrary.simpleMessage("Abgelegte Beichte eintragen"),
        "all_deeds_done_for_today": MessageLookupByLibrary.simpleMessage(
            "Du hast bereits alle für heute geplanten Taten erledigt."),
        "all_topics_were_deleted": MessageLookupByLibrary.simpleMessage(
            "Alle Beichtthemen wurden gelöscht"),
        "already_done":
            MessageLookupByLibrary.simpleMessage("Bereits erledigt"),
        "analytics_dialog": MessageLookupByLibrary.simpleMessage(
            "Hilf uns, die App weiterzuentwickeln, indem du uns anonym deine Nutzungsstatistik übermittelst. Du kannst deine Entscheidung jederzeit in den Einstellungen ändern."),
        "analytics_info": MessageLookupByLibrary.simpleMessage(
            "Wenn aktiviert, werden anonyme Nutzungsstatistiken gesammelt. Weitere Informationen können den Datenschutzbestimmungen entnommen werden."),
        "archive": MessageLookupByLibrary.simpleMessage("Archiv"),
        "at": MessageLookupByLibrary.simpleMessage("Um:"),
        "attention": MessageLookupByLibrary.simpleMessage("Achtung"),
        "audio_stimuli_last_days": MessageLookupByLibrary.simpleMessage(
            "Audio-Impulse der vergangenen Tage auf credo-online nachhören"),
        "audio_stimulus": MessageLookupByLibrary.simpleMessage("Audio-Impuls"),
        "avg_per_day":
            MessageLookupByLibrary.simpleMessage("Durchschnitt pro Tag"),
        "back": MessageLookupByLibrary.simpleMessage("Zurück"),
        "backup_explanation": MessageLookupByLibrary.simpleMessage(
            "Du kannst alle lokal in der App gespeicherten Daten (einschließlich Einstellungen) in eine einzige Datei exportieren. Diese Datei kann dann auf andere Geräte übertragen werden, z.B. via Cloud-Speicher oder per E-Mail. Die Datenübertragung funktioniert auch von iOS auf Android und umgekehrt.\n\nAber Achtung: Das Wiederherstellen eines Backups ist destruktiv, d.h. alle zuvor vorhandenen Daten gehen während der Wiederherstellung verloren."),
        "backup_restore":
            MessageLookupByLibrary.simpleMessage("Backup / Wiederherstellen"),
        "backup_version_mismatch": MessageLookupByLibrary.simpleMessage(
            "Wiederherstellen abgebrochen. Das Backup stammt von einer inkompatiblen Version der App."),
        "bible_book": MessageLookupByLibrary.simpleMessage("Buch"),
        "bible_chapter": MessageLookupByLibrary.simpleMessage("Kapitel"),
        "bible_chapter_max": m0,
        "bible_passage": MessageLookupByLibrary.simpleMessage("Bibelstelle"),
        "bible_passage_not_found_text": MessageLookupByLibrary.simpleMessage(
            "Die gesuchte Bibelstelle wurde nicht gefunden. Überprüfe die Referenz und versuche noch ein mal."),
        "bible_passage_not_found_title":
            MessageLookupByLibrary.simpleMessage("Bibelstelle nicht gefunden"),
        "bible_reference_advice": MessageLookupByLibrary.simpleMessage(
            "Gib die Stelle ein, die du lesen willst!"),
        "bible_verse_max": m1,
        "bible_verses": MessageLookupByLibrary.simpleMessage("Vers(e)"),
        "bible_verses_hint":
            MessageLookupByLibrary.simpleMessage("z.B. 3 oder 1-5"),
        "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
        "caution": MessageLookupByLibrary.simpleMessage("ACHTUNG"),
        "change_reminder":
            MessageLookupByLibrary.simpleMessage("Erinnerung ändern"),
        "choose_folder":
            MessageLookupByLibrary.simpleMessage("Ordner auswählen"),
        "choose_word_for_reminder": MessageLookupByLibrary.simpleMessage(
            "Wähle den Eintrag, an den du erinnert werden willst"),
        "clear_confession_topics": MessageLookupByLibrary.simpleMessage(
            "Beichtzettel löschen (benötigt Passwort)"),
        "clear_reminder":
            MessageLookupByLibrary.simpleMessage("Erinnerung löschen"),
        "communities": MessageLookupByLibrary.simpleMessage("Gemeinschaften"),
        "community_experiences": MessageLookupByLibrary.simpleMessage(
            "Erfahrungen aus Gemeinschaften"),
        "community_experiences_sub":
            MessageLookupByLibrary.simpleMessage("Berufung und mehr"),
        "community_select":
            MessageLookupByLibrary.simpleMessage("Gemeinschaft wählen..."),
        "confession": MessageLookupByLibrary.simpleMessage("Beichte"),
        "confession_empty_info": MessageLookupByLibrary.simpleMessage(
            "Durch das Speichern deiner Beichte, wird dein Beichtzettel geleert."),
        "confession_info_head":
            MessageLookupByLibrary.simpleMessage("Warum beichten?"),
        "confession_info_head2":
            MessageLookupByLibrary.simpleMessage("Wie beichten?"),
        "confession_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "„Wem ihr die Sünden vergebt, dem sind sie vergeben“, sagt Jesus seinen Aposteln. Die Beichte schenkt die wunderbare Erfahrung, dass dir im Namen Jesu die Vergebung deiner Sünden hörbar zugesprochen wird. So kannst du die barmherzige Liebe Gottes ganz persönlich und hautnah erfahren. Gewiss, zur Beichte zu gehen, kostet immer Überwindung und fällt niemandem leicht. Aber wenn du es wagst, nicht nur deine schöne Fassade zu zeigen, sondern ganz ehrlich zu sein, kannst du die beglückende Erfahrung machen, dass Gott dich annimmt und liebt, wie du bist, und dir durch seine Vergebung eine neue Zukunft eröffnet. Wer dieses Sakrament in Anspruch nimmt, der erfährt: Die Beichte schenkt immer neue Freude am Leben und neuen Schwung, um das Gute zu tun. Deswegen ist es ratsam, regelmäßig (z.B. monatlich, aber jedenfalls vor großen Festen wie Weihnachten und Ostern) zur Beichte zu gehen."),
        "confession_info_paragraph2": MessageLookupByLibrary.simpleMessage(
            "1. Nimm dir Zeit für eine Vorbereitung auf die Beichte (z.B. mit den Anregungen zum Nachdenken in dieser App). Wenn dir zwischendurch Dinge einfallen, die in eine Beichte gehören, kannst du sie hier notieren, damit sie nicht in Vergessenheit geraten. Um Diskretion zu gewährleisten (deine Sünden gehen nur dich und Gott etwas an!), kannst du diesen Bereich durch ein Kennwort schützen. Um ganz sicher zu gehen, dass nicht fremde Leute in deinen Sünden herumschnüffeln, solltest du eher Stichwörter oder die Themen notieren, um die es geht, so dass du weißt, worum es geht, aber sonst niemand.\n\n2. Sage Gott, dass es dir leid tut, und bitte um seine Hilfe, um dich zu bessern. Du kannst auch gleich eine Entscheidung für die Zukunft eintragen.\n\n3. Geh zu einem Priester und bekenne deine Sünden. Keine Angst, der Priester ist nicht da, um dich zu richten, sondern um dir Gottes Barmherzigkeit zu bringen. Wenn du Schwierigkeiten hast, weil du schon lange nicht mehr beim Beichten warst, oder einige Dinge nicht ganz klar siehst, sag es einfach. Der Priester wird dir helfen. Nach dem Bekenntnis wird er dir einige Hinweise geben, einen ermutigenden Zuspruch und eine Buße, d.h. er trägt dir ein Gebet oder eine Tat auf. Die Buße ist dafür da, einen Schritt in die richtige Richtung tun und so etwas zu heilen, was durch die Sünde verletzt worden ist. Und vor allem: Der Priester gibt dir die Lossprechung, die Vergebung aller Sünden im Namen Gottes. Wenn du die Beichte einträgst, werden alle Themen für die Beichte gelöscht – denn nicht einmal Gott erinnert sich dann noch an sie!\n\n4. Du bist neu geworden! Sage Gott Dank – und starte neu mit ihm in den Alltag."),
        "confession_info_sub":
            MessageLookupByLibrary.simpleMessage("Beichte - warum und wie"),
        "confession_password":
            MessageLookupByLibrary.simpleMessage("Beichtzettel-Passwort"),
        "confession_planned_on_future": MessageLookupByLibrary.simpleMessage(
            "Deine nächste Beichte ist geplant für"),
        "confession_planned_on_past": MessageLookupByLibrary.simpleMessage(
            "Eine Beichte war geplant für"),
        "confession_planner":
            MessageLookupByLibrary.simpleMessage("Beichttermine"),
        "confession_planner_description": MessageLookupByLibrary.simpleMessage(
            "Beichte eintragen und planen"),
        "confession_preparation_head": MessageLookupByLibrary.simpleMessage(
            "Vorbereitung auf die Beichte"),
        "confession_preparation_paragraph": MessageLookupByLibrary.simpleMessage(
            "Beginne mit einer einfachen Bitte: „Heiliger Geist, zeige mir, welche Dinge in meinem Leben Versöhnung brauchen. Hilf mir, mein Leben ganz ehrlich anzuschauen. Gib mir den Mut, mich ganz zu öffnen.“ Das Wichtigste ist: Nichts ist peinlich. Im Gegenteil: Es verdient höchsten Respekt, wenn jemand aufrichtig seine Sünden bekennt. Die Worte Jesu helfen dir, dein Leben im Licht Gottes anzuschauen."),
        "confession_preparation_sub": MessageLookupByLibrary.simpleMessage(
            "Anleitung und Fragen zum Nachdenken"),
        "confession_reminder_message_today": MessageLookupByLibrary.simpleMessage(
            "‚Der Herr ist barmherzig und gnädig, langmütig und reich an Güte‘ (Ps 103,8). Du hast für heute eine Beichte vorgemerkt."),
        "confession_today_text": MessageLookupByLibrary.simpleMessage(
            "„Lobe den Herrn, meine Seele, und vergiss nicht, was er dir Gutes getan hat: der dir all deine Schuld vergibt und all deine Gebrechen heilt, der dein Leben vor dem Untergang rettet und dich mit Huld und Erbarmen krönt“ (Ps 103,2-4)."),
        "confession_topics_sub": MessageLookupByLibrary.simpleMessage(
            "Worüber ich in der Beichte sprechen will"),
        "confessional_topic":
            MessageLookupByLibrary.simpleMessage("Beichtthema"),
        "confirm": MessageLookupByLibrary.simpleMessage("Bestätigen"),
        "confirmation": MessageLookupByLibrary.simpleMessage("Bestätiung"),
        "content_language":
            MessageLookupByLibrary.simpleMessage("Inhaltsprache"),
        "country_code": MessageLookupByLibrary.simpleMessage("Landesvorwahl"),
        "create_backup":
            MessageLookupByLibrary.simpleMessage("Backup erstellen"),
        "creation_date":
            MessageLookupByLibrary.simpleMessage("Erstellungsdatum"),
        "current_decisions":
            MessageLookupByLibrary.simpleMessage("Aktuelle Entscheidungen"),
        "current_decisions_sub":
            MessageLookupByLibrary.simpleMessage("nach denen ich leben will"),
        "current_deeds":
            MessageLookupByLibrary.simpleMessage("Aktuell geplant"),
        "current_deeds_sub":
            MessageLookupByLibrary.simpleMessage("Was ich tun möchte"),
        "current_prayerrequests":
            MessageLookupByLibrary.simpleMessage("Aktuelle Gebetsanliegen"),
        "current_words": MessageLookupByLibrary.simpleMessage("Aktuelle Worte"),
        "current_words_sub":
            MessageLookupByLibrary.simpleMessage("die mich begleiten"),
        "custom": MessageLookupByLibrary.simpleMessage("Benutzerdefiniert"),
        "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
        "dashboard_settings":
            MessageLookupByLibrary.simpleMessage("Einstellungen: Dashboard"),
        "dayspreview": MessageLookupByLibrary.simpleMessage("Tagesvorschau"),
        "dayspreview_date": m2,
        "dayspreview_decisions_head":
            MessageLookupByLibrary.simpleMessage("Entscheidungen"),
        "dayspreview_decisions_sub":
            MessageLookupByLibrary.simpleMessage("die ich heute umsetzen will"),
        "dayspreview_deeds_head": MessageLookupByLibrary.simpleMessage("Taten"),
        "dayspreview_deeds_sub": MessageLookupByLibrary.simpleMessage(
            "die ich heute verwirklichen will"),
        "dayspreview_no_elements_enabled_description":
            MessageLookupByLibrary.simpleMessage(
                "Du kannst die angezeigten Elemente in den Einstellungen wählen."),
        "dayspreview_no_elements_enabled_title":
            MessageLookupByLibrary.simpleMessage("Keine Elemente konfiguriert"),
        "dayspreview_prayertime_head":
            MessageLookupByLibrary.simpleMessage("Die Zeit"),
        "dayspreview_prayertime_sub": MessageLookupByLibrary.simpleMessage(
            "die ich mir heute für das Gebet nehmen will"),
        "dayspreview_settings": MessageLookupByLibrary.simpleMessage(
            "Einstellungen: Tagesvorschau"),
        "dayspreview_words_head":
            MessageLookupByLibrary.simpleMessage("Die Worte Gottes"),
        "dayspreview_words_sub": MessageLookupByLibrary.simpleMessage(
            "mit denen ich heute leben will"),
        "daysreview": MessageLookupByLibrary.simpleMessage("Tagesrückblick"),
        "daysreview_calm_head":
            MessageLookupByLibrary.simpleMessage("Zur Ruhe kommen"),
        "daysreview_calm_text":
            MessageLookupByLibrary.simpleMessage("Werde still."),
        "daysreview_calm_text2": MessageLookupByLibrary.simpleMessage(
            "Lass dich anschauen\nvon Gottes liebendem Blick."),
        "daysreview_calm_text3": MessageLookupByLibrary.simpleMessage(
            "Lass vor deinem inneren Auge\nden heutigen Tag noch einmal\nan dir vorbeiziehen."),
        "daysreview_calm_text4": MessageLookupByLibrary.simpleMessage(
            "Wofür willst du Gott danken?"),
        "daysreview_confession_button": MessageLookupByLibrary.simpleMessage(
            "Thema für die Beichte eintragen"),
        "daysreview_confession_head": MessageLookupByLibrary.simpleMessage(
            "Wofür willst du Gott um Verzeihung bitten?"),
        "daysreview_date": m3,
        "daysreview_decisions_head":
            MessageLookupByLibrary.simpleMessage("Aktuelle Entscheidungen"),
        "daysreview_deeds_head":
            MessageLookupByLibrary.simpleMessage("Aktuelle Taten"),
        "daysreview_eveningprayer_head":
            MessageLookupByLibrary.simpleMessage("Nachtgebet"),
        "daysreview_eveningprayer_paragraph": MessageLookupByLibrary.simpleMessage(
            "Bevor des Tages Licht vergeht, o Herr der Welt, hör dies Gebet. Behüte uns in dieser Nacht durch deine große Güt und Macht.\n\nHüllt Schlaf die müden Glieder ein, lass uns in dir geborgen sein. Und mach am Morgen uns bereit zum Lobe deiner Herrlichkeit.\n\nDank dir, o Vater, reich an Macht, der über uns voll Güte wacht, und mit dem Sohn und Heilgen Geist des Lebens Fülle uns verheißt."),
        "daysreview_forgivness_head":
            MessageLookupByLibrary.simpleMessage("Schuldbekenntnis"),
        "daysreview_forgivness_head2":
            MessageLookupByLibrary.simpleMessage("Vergebungsbitte"),
        "daysreview_forgivness_paragraph": MessageLookupByLibrary.simpleMessage(
            "Ich bekenne Gott, dem Allmächtigen, dass ich Gutes unterlassen und Böses Getan habe. Ich habe gesündigt in Gedanken, Worten und Werken, durch meine Schuld, durch meine Schuld, durch meine große Schuld."),
        "daysreview_forgivness_paragraph2": MessageLookupByLibrary.simpleMessage(
            "Der allmächtige Gott erbarme sich meiner, er vergebe mir meine Sünden und führe mich zu ewigen Leben."),
        "daysreview_prayertime_head":
            MessageLookupByLibrary.simpleMessage("Gebetszeit"),
        "daysreview_prayertime_sub":
            MessageLookupByLibrary.simpleMessage("Heute habe ich gebetet"),
        "daysreview_prayertime_sub2":
            MessageLookupByLibrary.simpleMessage("Geplante Gebetszeit morgen"),
        "daysreview_settings": MessageLookupByLibrary.simpleMessage(
            "Einstellungen: Tagesrückblick"),
        "decision": MessageLookupByLibrary.simpleMessage("Entscheidung"),
        "decision_view":
            MessageLookupByLibrary.simpleMessage("Entwicklung anschauen"),
        "decisions": MessageLookupByLibrary.simpleMessage("Entscheidungen"),
        "decisions_archive_sub": MessageLookupByLibrary.simpleMessage(
            "aller bisherigen Entscheidungen"),
        "decisions_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Es gibt Momente, da verstehen wir, dass wir etwas ändern sollten in unserem Leben. Das kann geschehen im Gebet oder beim Lesen des Wortes Gottes – oder wenn wir so richtig auf die Nase gefallen sind. Dann nehmen wir uns meist einen guten Vorsatz. Aber wie lange gute Vorsätze halten, ist ja bekannt… Deswegen ist dem heiligen Ignatius von Loyola ein nützliches Hilfsmittel eingefallen: Er schlägt vor, am Morgen an die Entscheidung zu denken, die wir getroffen haben, und am Ende des Tages zu überprüfen, wie es gelungen ist, sie umzusetzen. Der Vorteil daran ist: Auch wenn du nicht immer eine Erfolg verbuchen kannst – die Sache verläuft nicht im Sand, sondern du wirst immer neu darauf gestoßen. So kannst du, mit der Hilfe Gottes, auch festgefahrene Gewohnheiten unter die Lupe nehmen und langsam aber sicher neue, bessere Verhaltensweisen einüben. Es stimmt: Ohne Jesus können wir gar nichts tun. Er gibt uns sein Licht, um zu erkennen, wo wir umkehren sollen, und die Kraft, das Erkannte auch umzusetzen. Aber es gilt ebenso: Es geht auch nicht ohne uns. Gehen müssen wir den Weg schon selbst – und auch die entsprechenden Hilfsmittel in Anspruch nehmen. Diese Funktion ist so ein Hilfsmittel, um das, was du von Gott her erkannt hast, mit seiner Hilfe in deinem Leben umzusetzen."),
        "decisions_info_sub": MessageLookupByLibrary.simpleMessage(
            "Mein Leben bewusst gestalten"),
        "deed": MessageLookupByLibrary.simpleMessage("Tat"),
        "deed_date_label":
            MessageLookupByLibrary.simpleMessage("Wann willst du das tun?"),
        "deed_planned_for": m4,
        "deeds": MessageLookupByLibrary.simpleMessage("Taten"),
        "deeds_archive_sub":
            MessageLookupByLibrary.simpleMessage("Was ich getan habe"),
        "deeds_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "„Verkündet das Evangelium allen Geschöpfen!“ (Mk 16,15), sagt Jesus. Es heißt in der Heiligen Schrift auch: „Wir wollen nicht mit Wort und Zunge lieben, sondern in Tat und Wahrheit“ (1 Joh 3,18). Evangelisieren heißt, die Frohe Botschaft von der Liebe Gottes anderen Menschen mitteilen – in Wort und Tat. Damit das nicht nur ein schöner Gedanke bleibt, kannst du hier notieren, für welche Personen du etwas tun willst: eine Hilfeleistung, ein kleiner Dienst, ein Besuch, ein Gespräch, eine Einladung zu einer Veranstaltung. Oder vielleicht kommen dir Ideen für Initiativen zum Aufbau des Reiches Gottes. Wenn wir im Gebet hinhören und wenn wir auf die Menschen schauen, die um uns herum leben, wird Gott uns erkennen lassen, was wir tun sollen, damit Er zu den Menschen und die Menschen zu ihm kommen können. Dabei ist klar: Nicht wir können „machen“, dass sich ein Mensch Gott zuwendet – das ist das Werk des Heiligen Geistes. Aber klar ist auch: Gott möchte uns als seine Mitarbeiter, um den Menschen seine Liebe erfahrbar zu machen."),
        "deeds_info_sub":
            MessageLookupByLibrary.simpleMessage("Mitarbeiten am Reich Gottes"),
        "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
        "deregister": MessageLookupByLibrary.simpleMessage("Abmelden"),
        "description_delete_many": MessageLookupByLibrary.simpleMessage(
            "Du kannst jetzt mehrere Elemente gleichzeitig löschen, indem du auf dieses Symbol klickst, die Elemente  in der Liste auswählst und dann auf den Button in der unteren rechten Ecke klickst."),
        "description_share_many": MessageLookupByLibrary.simpleMessage(
            "Du kannst jetzt mehrere Elemente gleichzeitig teilen oder exportieren, indem du auf dieses Symbol klickst, die Elemente in der Liste auswählst und dann auf den Button in der unteren rechten Ecke klickst."),
        "display": MessageLookupByLibrary.simpleMessage("Anzeige"),
        "donate_now": MessageLookupByLibrary.simpleMessage("Mehr Infos"),
        "done": MessageLookupByLibrary.simpleMessage("Erledigt"),
        "duration": MessageLookupByLibrary.simpleMessage("Dauer:"),
        "edit": MessageLookupByLibrary.simpleMessage("Bearbeiten"),
        "edit_decision":
            MessageLookupByLibrary.simpleMessage("Entscheidung bearbeiten"),
        "edit_deed": MessageLookupByLibrary.simpleMessage("Tat bearbeiten"),
        "edit_faith_experience": MessageLookupByLibrary.simpleMessage(
            "Glaubenserfahrung bearbeiten"),
        "edit_prayer_note":
            MessageLookupByLibrary.simpleMessage("Gebetsnotiz bearbeiten"),
        "edit_prayer_request":
            MessageLookupByLibrary.simpleMessage("Gebetsanliegen bearbeiten"),
        "edit_topic": MessageLookupByLibrary.simpleMessage("Thema bearbeiten"),
        "edit_word": MessageLookupByLibrary.simpleMessage("Wort bearbeiten"),
        "end_prayertime":
            MessageLookupByLibrary.simpleMessage("Gebetszeit beenden"),
        "enter_new_password": MessageLookupByLibrary.simpleMessage(
            "Bitte gib ein neues Passwort für deinen Beichtzettel ein:"),
        "enter_password": MessageLookupByLibrary.simpleMessage(
            "Bitte gib dein Passwort ein:"),
        "error": MessageLookupByLibrary.simpleMessage("Fehler"),
        "error_no_location":
            MessageLookupByLibrary.simpleMessage("Bitte einen Ort eingeben."),
        "error_past_time": MessageLookupByLibrary.simpleMessage(
            "Bitte ein Datum in der Zukunft wählen."),
        "experiences": MessageLookupByLibrary.simpleMessage("Erfahrungen"),
        "experiences_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Gott ist immer am Werk (vgl. Joh 5,17), aber nicht immer ist es leicht, sein Wirken zu erkennen. Manchmal können wir gerade im Nachhinein seine Spuren in unserem Leben entdecken - ähnlich wie Mose, der Gott zwar nicht direkt sehen durfte, wohl aber seinen „Rücken“ (vgl. Ex 33,18-33). Das kann sein: wie ein Wort Gottes mir den richtigen Weg gezeigt und etwas in meinem Leben verwandelt hat. Eine Entwicklung der Dinge, in der ich eine Frucht des Gebets oder die überraschende Fügung Gottes erkenne. Zeugnis geben heißt: Davon sprechen, wie ich Gottes Wirken erfahre. Nichts ermutigt uns so sehr zum Glauben als das Zeugnis anderer Menschen. Das zeigt uns, dass der Glaube nicht eine zweifelhafte Theorie ist, sondern dass Gott lebt und in unser Leben hinein wirkt. Deswegen kannst du in diesem Bereich aufschreiben, wie du Gottes Wirken erfahren hast. Diese Zeugnisse kannst du dann auch mit anderen teilen und so Zeugnis geben von deinem Glauben. Und natürlich die Zeugnisse der anderen lesen und dich von ihnen im Glauben stärken lassen."),
        "experiences_info_sub": MessageLookupByLibrary.simpleMessage(
            "Warum Glaubenszeugnisse wichtig sind"),
        "experiences_sub":
            MessageLookupByLibrary.simpleMessage("Wie Gott wirkt"),
        "faith_experience":
            MessageLookupByLibrary.simpleMessage("Glaubenserfahrung"),
        "faithexperiences":
            MessageLookupByLibrary.simpleMessage("Glaubenserfahrungen"),
        "favourites": MessageLookupByLibrary.simpleMessage("Favoriten"),
        "font_size": MessageLookupByLibrary.simpleMessage("Schriftgröße"),
        "fontsize": MessageLookupByLibrary.simpleMessage("Schriftgröße"),
        "former_prayerrequests":
            MessageLookupByLibrary.simpleMessage("Frühere Gebetsanliegen"),
        "god_helped":
            MessageLookupByLibrary.simpleMessage("Gott hat geholfen!"),
        "gods_word_reminder":
            MessageLookupByLibrary.simpleMessage("Erinnerung an Wort Gottes"),
        "hide_from_current":
            MessageLookupByLibrary.simpleMessage("Aus Aktuell ausblenden"),
        "highlight": MessageLookupByLibrary.simpleMessage("Hervorheben"),
        "hours": MessageLookupByLibrary.simpleMessage("Stunden"),
        "imprint_address_text": MessageLookupByLibrary.simpleMessage(
            "App2Heaven e. V.\nSpiritual Dr. Andreas Schmidt\nGeorgenstr. 14\n80799 München\nTel: +49 89 38176180\nWebsite: "),
        "imprint_address_title":
            MessageLookupByLibrary.simpleMessage("Postanschrift"),
        "imprint_donations_account_text": MessageLookupByLibrary.simpleMessage(
            "App2Heaven e.V.\nIBAN: DE14 7509 0300 0002 2355 28\nBIC: GENODEF1M05"),
        "imprint_donations_account_title":
            MessageLookupByLibrary.simpleMessage("Spendenkonto"),
        "imprint_donations_text": MessageLookupByLibrary.simpleMessage(
            "Der App2Heaven e.V. ist anerkannt als gemeinnütziger Verein. Spenden können von der Steuer abgesetzt werden."),
        "imprint_feedback_text": MessageLookupByLibrary.simpleMessage(
            "Gib uns Feedback über deine Nutzererfahrung und schreib deine Ideen für die Weiterentwicklung der App an "),
        "imprint_text": MessageLookupByLibrary.simpleMessage(
            "Die App2Heaven wird als Projekt getragen von der Gemeinschaft Emmanuel, will aber eine Plattform sein, auf der alle teilnehmenden Gemeinschaften sich gleichberechtigt einbringen können."),
        "imprint_title": MessageLookupByLibrary.simpleMessage("Impressum"),
        "info": MessageLookupByLibrary.simpleMessage("Info"),
        "intended_min": MessageLookupByLibrary.simpleMessage("Geplant (min)"),
        "introduction": MessageLookupByLibrary.simpleMessage("Einführung"),
        "introduction_text": MessageLookupByLibrary.simpleMessage(
            "Herzlich willkommen bei der App2Heaven!\n\nDie App will dich dabei unterstützen, im Alltag mit Gott zu leben. Hier ein paar Tipps, wie du Schritt für Schritt die einzelnen Funktionen nutzen kannst.\n\nWähle die Funktion „Gebetszeit“ und lies den Infotext. Überlege dir, wieviel Zeit du dir täglich für das Gebet nehmen willst. Das persönliche Gebet ist die Grundlage für das geistliche Leben. Deswegen ist es wichtig dranzubleiben - selbst wenn es mal an einem besonders chaotischen Tag nicht geklappt hat. Am Anfang am besten mit einer kürzeren Zeit einsteigen, die realistisch ist, z.B. 5 oder 10 Minuten. Im Infotext findest du verschiedene Gebetsformen. Bete so, wie es dir entspricht und gut tut. Lass dich führen vom Heiligen Geist, der unser Lehrer im Gebet ist.\n\nWenn dir im Gebet etwas klar geworden ist, was du nicht vergessen willst, kannst du dir nach der Gebetszeit Notizen machen. Wenn es ein Gedanke ist, der auch für andere aufbauend ist, kannst du ihn auch mit Freunden teilen, die ebenfalls die App2Heaven nutzen. So bleibt ihr in geistlicher Gemeinschaft.\n\nFür die Gebetsgemeinschaft ist auch das Menü „Gebetsanliegen“ gedacht. Hier kannst du für dich selbst notieren, wofür du beten willst, aber du kannst diese Anliegen auch mit anderen teilen, damit ihr gemeinsam dafür betet.\n\nNicht immer können wir Gottes Wirken spürbar erfahren. Umso ermutigender ist es, Glaubenszeugnisse zu hören, wie Gott auch heute am Wirken ist. In der Funktion „Glaubenserfahrungen“ findest du Beispiele dafür - und kannst auch selbst solche notieren und teilen, wenn sie dir geschenkt werden.\n\nWenn dich einzelne Worte Gottes besonders ansprechen, z.B. nach einem Gottesdienst oder beim persönlichen Bibellesen, kannst du sie unter der Funktion „Wort Gottes“ aufschreiben, sie beim persönlichen Gebet wieder hernehmen oder dich an sie erinnern lassen, um sie mit in den Alltag zu nehmen.\n\nManchmal kommen uns im Gebet auch Ideen und Einfälle, was wir tun könnten für Gott und die Menschen - das kannst du in der Funktion „Taten“ notieren und planen, wann du es umsetzen willst.\n\nDie beiden Funktionen „Vorschau“ und „Tagesrückblick“ helfen dir, den Tag mit Gott zu beginnen und abzuschließen.\n\nNicht immer gelingt uns das Leben so, wie wir uns das wünschen. Wenn wir schmerzhaft erfahren, dass wir hinter der Liebe zurückbleiben, die wir einander und Gott eigentlich schenken möchten, bietet uns Gott seine Barmherzigkeit an. Im Bereich „Beichte“ erfährst du, was es mit diesem Sakrament auf sich hat, wie man sich darauf vorbereiten kann.\n\nAll diese verschiedenen Funktionen der App sind Angebote. Du musst sie nicht alle zugleich nutzen, sondern kannst individuell auswählen, was dir momentan persönlich hilft, um mit Gott im Kontakt zu bleiben. Zu jeder Funktion gibt es auch noch einmal einen eigenen, ausführlicheren Infotext. Die App will dich inspirieren und dir Anregungen geben - das wichtigste bleibt aber, dass du deinen ganz persönlichen Weg mit Gott gehst!"),
        "introduction_to_the_app":
            MessageLookupByLibrary.simpleMessage("Einführung in die App"),
        "invalid_prayertimes": MessageLookupByLibrary.simpleMessage(
            "Nicht alle Einträge haben eine gültige Gebetszeit"),
        "language": MessageLookupByLibrary.simpleMessage("Sprache"),
        "large": MessageLookupByLibrary.simpleMessage("groß"),
        "last_confession": m5,
        "later": MessageLookupByLibrary.simpleMessage("Später"),
        "loading_experience":
            MessageLookupByLibrary.simpleMessage("Lade Erfahrung..."),
        "loading_passage":
            MessageLookupByLibrary.simpleMessage("Lade Bibelstelle..."),
        "location": MessageLookupByLibrary.simpleMessage("Ort"),
        "lock": MessageLookupByLibrary.simpleMessage("Verschlüsseln"),
        "medium": MessageLookupByLibrary.simpleMessage("mittel"),
        "menu_language": MessageLookupByLibrary.simpleMessage("Menüsprache"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minuten"),
        "missing_text":
            MessageLookupByLibrary.simpleMessage("Bitte gib den Text ein"),
        "missing_title":
            MessageLookupByLibrary.simpleMessage("Bitte gib einen Titel ein"),
        "missing_value":
            MessageLookupByLibrary.simpleMessage("Bitte ausfüllen"),
        "monthly_prayerrequest":
            MessageLookupByLibrary.simpleMessage("Gebetsanliegen des Monats"),
        "morning_prayer": MessageLookupByLibrary.simpleMessage(
            "Herr Jesus Christus, im Schweigen dieses anbrechenden Morgens komme ich zu dir und bitte dich mit Demut und Vertrauen um deinen Frieden, deine Weisheit, deine Kraft.\nGib, dass ich heute die Welt betrachte mit Augen, die voller Liebe sind. Lass mich begreifen, dass alle Herrlichkeit der Kirche aus deinem Kreuz als deren Quelle entspringt. Lass mich meinen Nächsten als den Menschen empfangen, den du durch mich lieben willst. Schenke mir die Bereitschaft, ihm mit Hingabe zu dienen und alles Gute, das du in ihn hineingelegt hast, zu entfalten.\nMeine Worte sollen Sanftmut ausstrahlen, und mein ganzes Verhalten soll Frieden stiften. Nur jene Gedanken, die Segen verbreiten, sollen in meinem Geiste haften bleiben. Verschließe meine Ohren vor jedem übelwollenden Wort und jeder böswilligen Kritik. Möge meine Zunge nur dazu dienen, das Gute hervorzuheben. Vor allem bewirke, o Herr, dass ich so voller Frohmut und Wohlwollen bin, dass alle, die mir begegnen, sowohl deine Gegenwart als auch deine Liebe spüren. Bekleide mich mit dem Glanz deiner Güte und deiner Schönheit, damit ich dich im Verlaufe dieses Tages offenbare. Amen."),
        "morning_prayer_head": MessageLookupByLibrary.simpleMessage(
            "Morgengebet der hl. Mirjam von Abellin (anzeigen)"),
        "my_confession_was_on": m6,
        "my_confession_was_on_fallback":
            MessageLookupByLibrary.simpleMessage("Noch keine Beichte"),
        "my_faithexperiences":
            MessageLookupByLibrary.simpleMessage("Meine Glaubenserfahrungen"),
        "mynumber": MessageLookupByLibrary.simpleMessage("Meine Nummer"),
        "new_decision":
            MessageLookupByLibrary.simpleMessage("Neue Entscheidung"),
        "new_decision_hint": MessageLookupByLibrary.simpleMessage(
            "Auf + drücken, um Entscheidungen hinzuzufügen"),
        "new_deed": MessageLookupByLibrary.simpleMessage("Neue Tat"),
        "new_deed_hint": MessageLookupByLibrary.simpleMessage(
            "Auf + drücken, um Tat hinzuzufügen"),
        "new_faith_experience":
            MessageLookupByLibrary.simpleMessage("Neue Glaubenserfahrung"),
        "new_faith_experience_hint": MessageLookupByLibrary.simpleMessage(
            "Auf + drücken, um Glaubenserfahrungen hinzuzufügen"),
        "new_prayer_note":
            MessageLookupByLibrary.simpleMessage("Neue Gebetsnotiz"),
        "new_prayer_note_hint": MessageLookupByLibrary.simpleMessage(
            "Auf + drücken, um eine Gebetsnotiz hinzuzufügen"),
        "new_prayer_request":
            MessageLookupByLibrary.simpleMessage("Neues Gebetsanliegen"),
        "new_prayer_request_hint": MessageLookupByLibrary.simpleMessage(
            "Auf + drücken, um Gebetsanliegen hinzuzufügen"),
        "new_topic": MessageLookupByLibrary.simpleMessage("Neues Thema"),
        "new_topic_hint": MessageLookupByLibrary.simpleMessage(
            "Auf + drücken, um Beichtthema hinzuzufügen"),
        "new_word": MessageLookupByLibrary.simpleMessage("Neues Wort"),
        "new_word_hint": MessageLookupByLibrary.simpleMessage(
            "Auf + drücken, um Wort hinzuzufügen"),
        "next": MessageLookupByLibrary.simpleMessage("Nächste"),
        "next_confession":
            MessageLookupByLibrary.simpleMessage("Nächste Beichte am:"),
        "no": MessageLookupByLibrary.simpleMessage("Nein"),
        "no_bible_books":
            MessageLookupByLibrary.simpleMessage("Kein Buch gefunden"),
        "no_communities": MessageLookupByLibrary.simpleMessage(
            "Keine Gemeinschaften gefunden\nBitte überprüfe deine Internetverbindung"),
        "no_community_experiences": MessageLookupByLibrary.simpleMessage(
            "Keine Erfahrungen gefunden\nBitte überprüfe deine Internetverbindung"),
        "no_confession_planned": MessageLookupByLibrary.simpleMessage(
            "Derzeit ist keine Beichte geplant"),
        "no_confession_topics":
            MessageLookupByLibrary.simpleMessage("Dein Beichtzettel ist leer"),
        "no_confessions_yet": MessageLookupByLibrary.simpleMessage(
            "Noch keine Beichten gespeichert"),
        "no_decisions": MessageLookupByLibrary.simpleMessage(
            "Du hast noch keine Entscheidungen getroffen"),
        "no_deeds": MessageLookupByLibrary.simpleMessage(
            "Du hast noch keine Taten geplant"),
        "no_deeds_today": MessageLookupByLibrary.simpleMessage(
            "Du hast heute keine Taten geplant"),
        "no_experiences": MessageLookupByLibrary.simpleMessage(
            "Du hast noch keine Erfahrungen gesammelt"),
        "no_gods_words": MessageLookupByLibrary.simpleMessage(
            "Du hast noch keine Worte gespeichert"),
        "no_prayer_notes": MessageLookupByLibrary.simpleMessage(
            "Du hast noch keine Gebetsnotizen"),
        "no_prayer_request_of_month": MessageLookupByLibrary.simpleMessage(
            "Kein Gebetsanliegen des Monats."),
        "no_prayer_requests": MessageLookupByLibrary.simpleMessage(
            "Du hast noch keine Gebetsanliegen"),
        "no_stimuli": MessageLookupByLibrary.simpleMessage(
            "Keine Impulse gefunden\nBitte überprüfe deine Internetverbindung"),
        "no_stimulus_of_day": MessageLookupByLibrary.simpleMessage(
            "Kein Impuls gefunden. Prüfe die Internetverbindung."),
        "no_stimulus_tags": MessageLookupByLibrary.simpleMessage(
            "Keine Kategorien gefunden\nBitte überprüfe deine Internetverbindung"),
        "note": MessageLookupByLibrary.simpleMessage("Notieren"),
        "notifications":
            MessageLookupByLibrary.simpleMessage("Neue Mitteilungen"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "open_bible":
            MessageLookupByLibrary.simpleMessage("Die Bibel aufschlagen"),
        "open_bible_needs_internet": MessageLookupByLibrary.simpleMessage(
            "Eine bestehende Internetverbindung ist nötig, um Bibelstellen zu lesen."),
        "open_bible_somewhere":
            MessageLookupByLibrary.simpleMessage("Bibelstelle vorschlagen"),
        "open_bible_sub":
            MessageLookupByLibrary.simpleMessage("Worte lesen und notieren"),
        "oss_libs":
            MessageLookupByLibrary.simpleMessage("Open Source Libraries"),
        "others": MessageLookupByLibrary.simpleMessage("Andere"),
        "password": MessageLookupByLibrary.simpleMessage("Passwort"),
        "password_request":
            MessageLookupByLibrary.simpleMessage("Passwortabfrage"),
        "passwords_dont_match": MessageLookupByLibrary.simpleMessage(
            "Die Passwörter stimmen nicht überein!"),
        "past_confessions":
            MessageLookupByLibrary.simpleMessage("Vergangene Beichten"),
        "plan_next_confession":
            MessageLookupByLibrary.simpleMessage("Nächste Beichte planen"),
        "planned": MessageLookupByLibrary.simpleMessage("Geplant"),
        "planned_confession": m7,
        "planning": MessageLookupByLibrary.simpleMessage("Planung"),
        "planning_button_sub":
            MessageLookupByLibrary.simpleMessage("Zeit finden für Gott."),
        "planning_head": MessageLookupByLibrary.simpleMessage(
            "Tippe auf den Tag und wähle die Zeit, die du täglich für das Gebet nehmen möchtest!"),
        "planning_sub": MessageLookupByLibrary.simpleMessage(
            "Du erhältst 10 min vor der eingestellten Zeit eine Erinnerung."),
        "prayer_clock": MessageLookupByLibrary.simpleMessage("Gebetsuhr"),
        "prayer_info_head":
            MessageLookupByLibrary.simpleMessage("Was ist Gebet?"),
        "prayer_info_head2":
            MessageLookupByLibrary.simpleMessage("Warum beten?"),
        "prayer_info_head3":
            MessageLookupByLibrary.simpleMessage("Wann beten?"),
        "prayer_info_head4": MessageLookupByLibrary.simpleMessage(
            "Wie beten mit der App2Heaven?"),
        "prayer_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Beten ist mehr als Worte an Gott richten. Es ist Freundschaft mit Gott. Beten heißt: Glauben, dass Er da ist für dich und dich liebt. Ihm sagen, was du auf dem Herzen hast. Hören, was Er dir zu sagen hat. Oder einfach ausruhen in seiner Gegenwart. Du wirst erfahren: Beten schenkt Dir Licht und Kraft für Deinen Weg. Wenn du betest, wirst du entdecken, wer du bist und wofür du leben willst."),
        "prayer_info_paragraph2": MessageLookupByLibrary.simpleMessage(
            "Kannst du dir eine Freundschaft vorstellen, in der man nicht immer wieder persönlich miteinander redet? Wenn das Gespräch fehlt, entfremden wir uns uns voneinander. Genauso entfernen wir uns von Gott, wenn wir nicht Zeit mit ihm verbringen. Die Beziehung zu ihm ist die wichtigste überhaupt, denn sie zeigt uns den Sinn und den richtigen Weg für unser Leben. Deswegen ist Beten für das geistliche Leben so wichtig wie Atmen für den Leib. Der Unterschied ist: Atmen geht automatisch, das Beten fällt schnell unter den Tisch, wenn man sich nicht dafür entscheidet. Dafür ist diese App da. Mit ihr kannst du dein Leben so organisieren, dass du immer wieder Zeit einplanst, um sie bewusst in Gemeinschaft mit Gott zu verbringen. Das wird dir helfen, dein ganzes Leben immer mehr in Gegenwart Gottes zu leben. Damit hat für dich das Leben im Himmel bereits begonnen."),
        "prayer_info_paragraph3": MessageLookupByLibrary.simpleMessage(
            "Die Heilige Schrift sagt uns: Wir sollen „allezeit beten“ (Lk 18,1). Damit ist gemeint: Wir können immer in der Freundschaft mit Gott leben, selbst mitten in unseren alltäglichen Beschäftigungen. Aber damit wir innerlich bei Gott bleiben, braucht es Zeiten am Tag, in denen wir uns ganz ausdrücklich Gott zuwenden. Neben dem Gottesdienst am Sonntag (oder auch einmal unter der Woche) schlagen wir dir folgendes vor:\n\n• Am Morgen ein kurzes Gebet, z.B. ein Kreuzzeichen, ein Loblied, ein Psalm oder ein persönliches Gebet. Blicke voraus auf den Tag und bitte Gott um seinen Segen!\n\n• Eine persönliche Gebetszeit irgendwann am Tag. Am besten nimmst du dir nicht zuviel vor, damit du die Zeit auch einhalten kannst. Aber es soll lang genug sein, um wirklich auf Gott hören und alle wichtigen Dinge vor ihn bringen zu können. Es ist wichtig, sich eine feste Zeit vorzunehmen und darin auch treu zu sein, damit das Gebet nicht dem Zufall oder der Stimmung überlassen bleibt. Hilfreich ist, die Gebetszeiten im Vorhinein zu planen und in den Kalender einzutragen.\n\n• Vor dem Schlafengehen noch einmal ein kurzes Gebet mit einem Rückblick auf den Tag. Bring alles, was war, vor Gott, damit du mit Dankbarkeit und Frieden im Herzen zu Bett gehen kannst!"),
        "prayer_info_paragraph4": MessageLookupByLibrary.simpleMessage(
            "Jesus hat sich zum Gebet in die Einsamkeit zurückgezogen. Suche auch du dir einen ruhigen Ort, an dem du nicht gestört wirst. Am besten, du schaltest das Handy auf „nicht stören“. Klicke in der App unter „Gebetszeit“ auf „Gebetszeit beginnen“, eröffne dein Gebet mit einem Kreuzzeichen und mach dir bewusst, dass Gott da ist. Wenn du zu Hause betest, kann ein Zeichen dabei helfen, z.B. eine Kerze, ein Kreuz oder eine Ikone. Im Gebet geht es darum, ganz bei Gott zu sein. Versuche, still zu werden in seiner Gegenwart. Es kann sein, dass viele Gedanken in dir hochkommen – all das gehört zu deinem Leben. Mach aus ihnen ein Gebet, einen Dank oder eine Bitte. So bringst du alles vor Gott. Das wichtigste ist, dass Er jetzt da ist. Lass dich nicht davon stören, wenn dir immer wieder irgendwelche unwichtigen Dinge durch den Kopf gehen - lass sie einfach vorbeiziehen und und suche immer neu die Gegenwart Gottes.\n\nEs gibt keine bestimmte „Methode“, an die man sich im weiteren Verlauf des Gebets halten muss. Schließlich ist das Gebet Freundschaft mit Gott, und in einer Freundschaft gestalten die Freunde ihre Beziehung so, wie sie ihnen entspricht. Es gibt aber verschiedenen Formen des Gebets. Wähle diejenigen aus, die dir jetzt im Moment entspricht und hilft zu beten!\n\n• Die Betrachtung: Nimm einen Text aus der Heiligen Schrift, z.B. einen Abschnitt nach dem anderen aus einem Evangelium. Oder das Tagesevangelium. Oder schlag die Bibel einfach irgendwo auf - in Buchform oder mit der entsprechenden App2Heaven-Funktion. Oder lies noch einmal die Worte nach, die du dir in der App im Bereich „Wort Gottes“ notiert hast. Lies den Text langsam und aufmerksam. Hat Gott dir durch diesen Text etwas zu sagen für dein Leben? Wie willst du Gott antworten auf sein Wort? Lässt Gott dich etwas erkennen, was du tun sollst? Aber nicht nur die Heilige Schrift, auch ein geistliches Buch, die Schöpfung und vor allem dein Leben kann Gegenstand der Betrachtung werden. In allem kann Gott zu uns sprechen. Du kannst auch einen Impuls oder ein Zeugnis aus dieser App lesen. Versuche, anhand dieser Gedanken ins Gespräch mit Gott zu kommen. Wo hörst du einen Anruf Gottes? Eine altbewährte Methode der Betrachtung ist auch der Rosenkranz - eine Anleitung findest du unter www.rosenkranz-beten.de.\n\n• Das innere Gebet: Du kannst einfach mit Gott sprechen, im Wissen, dass er da ist und dich liebt. In jeder Freundschaft ist es wichtig, nicht nur zu reden oder zu bitten, sondern auch die Person des anderen wahrzunehmen. Und ähnlich wie in einer menschlichen Freundschaft kannst du mit Gott auch ohne Worte zusammensein. Im inneren Gebet kannst du lange Zeit einfach damit verbringen, still in Gottes Gegenwart zu bleiben und in seinem Licht und seiner Liebe zu verweilen. Ein solches Gebet kann mehr bewirken als ein Gebet mit vielen Worten.\n\n• Die eucharistische Anbetung: Als die Emmausjünger Jesus baten „Bleibe bei uns!“, ging Jesus mit ihnen und brach das Brot mit ihnen. In der Eucharistiefeier bleibt Jesus in besonderer Weise bei uns. Manchmal wird die geweihte Hostie zum Gebet gezeigt, das nennt man „eucharistische Anbetung“. Wir sehen das Brot, das verwandelt ist, und wissen im Glauben: Das ist Jesus. Er ist da mit seiner ganzen Liebe, die er uns am Kreuz gezeigt hat. Er ist da als Auferstandener, der heute zu uns spricht und uns seinen Heiligen Geist schenkt. In der eucharistischen Anbetung kannst du in allen Formen beten, die oben erklärt sind, aber das Besondere ist, Ihn dabei anzuschauen – und sich von Ihm anschauen zu lassen.\n\nAm Ende der Gebetszeit blick noch einmal zurück und überlege dir, was du mitnehmen möchtest aus dieser Gebetszeit. Du kannst Gedanken notieren, die dir über dein Leben oder über deinen Glauben gekommen sind. Das Aufschreiben hilft, Erkenntnisse festzuhalten und noch einmal klarer zu bekommen. Es kann auch schön sein, mit Personen unseres Vertrauens solche geistlichen Gedanken zu teilen.\n\nVielleicht hast du im Gebet etwas erkannt, was Gott von dir will und was jetzt dran ist zu entscheiden, um das Leben mehr nach dem Willen Gottes und in der Nachfolge Jesu zu gestalten. Dann kannst du es im Bereich „Entscheidungen“ notieren.\n\nAm Ende danke Gott und schließe bewusst mit einem Kreuzzeichen oder einem Vaterunser – und klicke auf „Gebetszeit beenden“, dann ist die Zeit automatisch gespeichert. So kannst du überblicken, wie sich deine Gebetszeiten entwickeln."),
        "prayer_info_sub":
            MessageLookupByLibrary.simpleMessage("Beten - Warum, wann, wie?"),
        "prayer_note": MessageLookupByLibrary.simpleMessage("Gebetsnotiz"),
        "prayer_notes": MessageLookupByLibrary.simpleMessage("Gebetsnotizen"),
        "prayer_notes_sub": MessageLookupByLibrary.simpleMessage(
            "Halte fest, was du empfangen hast"),
        "prayer_request":
            MessageLookupByLibrary.simpleMessage("Gebetsanliegen"),
        "prayer_request_done": MessageLookupByLibrary.simpleMessage("Erhört"),
        "prayer_time": MessageLookupByLibrary.simpleMessage("Gebetszeit"),
        "prayerrequests":
            MessageLookupByLibrary.simpleMessage("Gebetsanliegen"),
        "prayerrequests_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Hier kannst du all die Anliegen notieren, für die du beten willst, damit sie nicht in Vergessenheit geraten. Besonders dringende Anliegen können hervorgehoben werden. Vielleicht stellt sich im Lauf der Zeit heraus, dass sich deine Bitten verändern – dann kannst du sie umformulieren. Mit einem Klick hast du so in deiner Gebetszeit alle aktuellen Anliegen vor Augen. Du kannst deine Gebetsanliegen auch mit anderen App2heaven- Nutzern teilen. Gebetsanliegen, in denen du Erhörung erfahren hast, kannst du markieren. Es tut gut, ab und zu diese erhörten Bitten noch einmal nachzulesen und für das zu danken, was Gott für uns getan hat."),
        "prayertime_reminder": m8,
        "prayertimes": MessageLookupByLibrary.simpleMessage("Gebetszeiten"),
        "prayertimes1": MessageLookupByLibrary.simpleMessage("Gebetszeiten"),
        "preparation": MessageLookupByLibrary.simpleMessage("Vorbereitung"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("Datenschutzbestimmungen"),
        "privacy_text": MessageLookupByLibrary.simpleMessage(
            "Bei der Installation der App2Heaven werden eine Reihe von Berechtigungen angefragt, die für die Funktionalität der App und insbesondere für die Messaging-Funktion notwendig sind. Grundsätzlich werden die Inhalte, die du in die App2Heaven schreibst, nur auf deinem Smartphone gespeichert - darauf können weder die App2Heaven-Zentrale noch andere App2Heaven-Nutzer zugreifen. Geteilte Inhalte laufen über einen App2Heaven-Internet-Server. Alle eingegebenen Daten werden von uns vertraulich behandelt. Sie werden nur im Rahmen der App2Heaven verwendet. Sie werden in keiner Form - weder anonym noch personalisiert - gelesen oder ausgewertet. Sie werden in keiner Form an Dritte weitergegeben. Es werden keine Statistiken über Inhalte oder Nutzerverhalten angelegt. So möchte die App2Heaven die größtmögliche Diskretion der Inhalte gewährleisten.\n\nBei der App-Entwicklung wurden im Rahmen des Möglichen Schutzmaßnahmen ergri?en, um Datensicherheit zu gewährleisten. Gleichwohl kann keine Verantwortung dafür übernommen werden, dass nicht doch solche Vorkehrungen überwunden werden und es zu Datenverlusten kommt. Eine 100%ige Sicherheit vertraulicher Daten kann damit nicht garantiert werden. Daher übernimmt der App2Heaven e.V. keine Haftung für Datenverlust oder Datendiebstahl. Weiterhin haftet der Verein nicht dafür, dass die Inhalte der App jederzeit zur Verfügung stehen.\n\nDer Verein behält sich vor, dass der Dienst jederzeit eingestellt werden kann."),
        "privacy_text_info": MessageLookupByLibrary.simpleMessage(
            "Die Datenschutzbestimmugen können in den Einstellungen eingesehen werden."),
        "privacy_text_ok": MessageLookupByLibrary.simpleMessage("Gelesen"),
        "privacy_text_title":
            MessageLookupByLibrary.simpleMessage("Hinweise zum Datenschutz"),
        "programmers_dialog": m9,
        "random_experience":
            MessageLookupByLibrary.simpleMessage("Glaubenserfahrung"),
        "random_stimulus": MessageLookupByLibrary.simpleMessage("Impuls"),
        "random_word_of_god":
            MessageLookupByLibrary.simpleMessage("Wort Gottes"),
        "rating": MessageLookupByLibrary.simpleMessage("Bewertung"),
        "rating_max": MessageLookupByLibrary.simpleMessage(
            "Super, Dank sei dem Herrn! Alles vermagst du durch ihn, der dich stark macht! (vgl. Phil 4,13)"),
        "rating_min": MessageLookupByLibrary.simpleMessage(
            "Sei nicht traurig. Morgen ist ein neuer Tag und „neu ist das Erbarmen des Herrn an jedem Morgen“ (Klgl 3,23)."),
        "read": MessageLookupByLibrary.simpleMessage("Lesen"),
        "read_passage": MessageLookupByLibrary.simpleMessage("Stelle lesen"),
        "read_verses": m10,
        "real_prayertimes": MessageLookupByLibrary.simpleMessage("Jetzt beten"),
        "real_prayertimes_sub": MessageLookupByLibrary.simpleMessage(
            "Deine mit Gott verbrachte Zeit"),
        "reference_example":
            MessageLookupByLibrary.simpleMessage("z.B. Röm. 2, 28"),
        "refreshed_data":
            MessageLookupByLibrary.simpleMessage("Daten aktualisiert"),
        "remember_confession":
            MessageLookupByLibrary.simpleMessage("Beichte vormerken"),
        "reminder": MessageLookupByLibrary.simpleMessage("Erinnerung"),
        "reminder_created":
            MessageLookupByLibrary.simpleMessage("Erinnerung erstellt"),
        "reminder_created_confession": m11,
        "reset": MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
        "reset_demo": MessageLookupByLibrary.simpleMessage("Reset Demo"),
        "reset_dialog":
            MessageLookupByLibrary.simpleMessage("Dialog zurücksetzen"),
        "reset_password":
            MessageLookupByLibrary.simpleMessage("Passwort zurücksetzen"),
        "reset_password_caution": MessageLookupByLibrary.simpleMessage(
            "Durch das Zurücksetzen, wird der aktuelle Beichtzettel gelöscht."),
        "reset_password_message": MessageLookupByLibrary.simpleMessage(
            "Soll das Passwort zurückgesetzt werden?"),
        "restore_backup_confirm": MessageLookupByLibrary.simpleMessage(
            "ACHTUNG: DATENVERLUST MÖGLICH\n\nDas Wiederherstellen eines Backups löscht zunächst alle Daten, die derzeit in der App gespeichert sind, und ersetzt diese dann mit den Daten aus dem Backup."),
        "restore_from_backup":
            MessageLookupByLibrary.simpleMessage("Wiederherstellen"),
        "restore_from_backup_warning":
            MessageLookupByLibrary.simpleMessage("WARNUNG"),
        "same_time_every_day": MessageLookupByLibrary.simpleMessage(
            "Jeden Tag die gleiche Zeit verwenden"),
        "save": MessageLookupByLibrary.simpleMessage("Speichern"),
        "save_and_empty":
            MessageLookupByLibrary.simpleMessage("Beichtzettel löschen"),
        "save_confession":
            MessageLookupByLibrary.simpleMessage("Beichte eintragen"),
        "saved": MessageLookupByLibrary.simpleMessage("Gespeichert"),
        "select_language":
            MessageLookupByLibrary.simpleMessage("Sprache wählen"),
        "send_data": MessageLookupByLibrary.simpleMessage("Daten senden"),
        "send_mail": MessageLookupByLibrary.simpleMessage("E-Mail senden"),
        "set_reminder": MessageLookupByLibrary.simpleMessage("Neue Erinnerung"),
        "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "seven_day_review":
            MessageLookupByLibrary.simpleMessage("Sieben-Tages-Rückblick"),
        "share": MessageLookupByLibrary.simpleMessage("Teilen"),
        "share_experience": m12,
        "share_gods_word": m13,
        "share_prayer_note": m14,
        "share_prayer_request": m15,
        "share_prayer_request_done": m16,
        "show_history":
            MessageLookupByLibrary.simpleMessage("Entwicklung anzeigen"),
        "show_in_current":
            MessageLookupByLibrary.simpleMessage("In Aktuell einblenden"),
        "shown_elements":
            MessageLookupByLibrary.simpleMessage("Angezeigte Elemente"),
        "small": MessageLookupByLibrary.simpleMessage("klein"),
        "soundcloud_button_info": MessageLookupByLibrary.simpleMessage(
            "Falls du gefragt wirst, bitte wähle unten \"Listen in Browser\" aus."),
        "start_prayertime":
            MessageLookupByLibrary.simpleMessage("Gebetszeit beginnen"),
        "stimuli_by_category":
            MessageLookupByLibrary.simpleMessage("Impulse nach Kategorie"),
        "stimulus_head": m17,
        "stimulus_intro": MessageLookupByLibrary.simpleMessage(
            "Im Namen des Vaters und des Sohnes und des Heiligen Geistes. Amen."),
        "stimulus_to_prayer":
            MessageLookupByLibrary.simpleMessage("Impuls zum Gebet"),
        "stimulus_to_prayer_sub": MessageLookupByLibrary.simpleMessage(
            "Gedanken, die ins Gebet führen"),
        "successfully_registred": MessageLookupByLibrary.simpleMessage(
            "Du bist angemeldet, um mit anderen App2Heaven-Nutzern Gebetsanliegen, Notizen, Worte und Glaubenserfahrungen teilen zu können."),
        "text": MessageLookupByLibrary.simpleMessage("Text"),
        "title": MessageLookupByLibrary.simpleMessage("Titel"),
        "topics": MessageLookupByLibrary.simpleMessage("Themen"),
        "try_again": MessageLookupByLibrary.simpleMessage("Nochmal versuchen"),
        "unhighlight":
            MessageLookupByLibrary.simpleMessage("Nicht mehr hervorheben"),
        "unlock": MessageLookupByLibrary.simpleMessage("Entsperren"),
        "update_confession_text": MessageLookupByLibrary.simpleMessage(
            "Mit dem letzten Update wurde die Verschlüsselung des Beichtzettels geändert. Ein Passwort ist nun immer notwendig. Falls vor dem Update kein Passwort gesetzt war, bitte im nachfolgenden Dialog einfach OK drücken, ohne ein Passwort einzugeben. Das Passwort kann in den Einstellungen (zurück-)gesetzt werden. Dabei geht jedoch der aktuelle Beichtzettel verloren."),
        "use_system_language":
            MessageLookupByLibrary.simpleMessage("Systemsprache verwenden"),
        "view_code": MessageLookupByLibrary.simpleMessage("Code ansehen"),
        "week_overview": MessageLookupByLibrary.simpleMessage("Wochenansicht"),
        "welcome_app_language_text": MessageLookupByLibrary.simpleMessage(
            "Erstmal, wähle die Sprache der App:"),
        "welcome_content_language_text": MessageLookupByLibrary.simpleMessage(
            "Wähle jetzt die Sprache des Inhalts:"),
        "welcome_intro": MessageLookupByLibrary.simpleMessage(
            "Die App ist in verschiedene Sprachen verfügbar. Du kannst sie jetzt konfigurieren, und auch später sie noch in der Einstellungen ändern."),
        "welcome_title": MessageLookupByLibrary.simpleMessage(
            "Willkommen in der App2Heaven!"),
        "when": MessageLookupByLibrary.simpleMessage("Wann?"),
        "word": MessageLookupByLibrary.simpleMessage("Wort"),
        "word_format_error": MessageLookupByLibrary.simpleMessage(
            "Bitte eine gültige Bibelstelle eingeben. z.B. \'1. Petrus 2,3\' oder \'1. Petrus 2,4-6\'"),
        "word_of_god": MessageLookupByLibrary.simpleMessage("Worte Gottes"),
        "word_reminder": m18,
        "word_saved": m19,
        "words": MessageLookupByLibrary.simpleMessage("Worte"),
        "words_archive_sub":
            MessageLookupByLibrary.simpleMessage("aller notierten Worte"),
        "words_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "In den Worten der Heiligen Schrift spricht Gott zu uns. Er zeigt uns, wie er selbst ist, und lässt uns wichtige Dinge über unser Leben erkennen. Oft spüren wir, wenn wir in der Bibel lesen oder im Gottesdienst die Lesungen hören: Dieses Wort ist für mich! Es lässt mich etwas Wichtiges verstehen. Es zeigt mir etwas, was ich tun soll. Dann kommt es darauf an, dass ich dieses Wort auch aufnehme. „Hört das Wort nicht nur an, sondern handelt danach; sonst betrügt ihr euch selbst“, heißt es im Jakobusbrief (1,22). Die Gefahr ist, dass wir das Gehörte schnell wieder vergessen und sich nichts ändert in unserem Leben. Wenn wir das Wort aber hören und danach handeln, dann wird unser Leben verwandelt, und Gott führt uns seine Wege. Diese Funktion hilft dir dabei, besser auf Gottes Wort zu hören. Notiere dir die Worte, die dich angesprochen haben. Nimm sie wieder her zum Gebet, schaue sie dir zwischendurch noch einmal an oder lass dich über die Erinnerungsfunktion im Alltag an sie erinnern. Dann werden die Worte einsickern in dein Herz, sie bleiben in dir und bringen Frucht. Du kannst entscheiden, welche aktuellen Worte du sofort sehen willst, neue Worte hinzufügen oder andere Worte ausblenden. Unter „alle Worte“ siehst du auch die schon länger ausgeblendeten. Manchmal ist es interessant, diese Worte wieder im Zusammenhang zu lesen und so einen „roten Faden“ zu entdecken und zu sehen, wie Gott dich durch sein Wort führt.\nDu kannst entscheiden, welche aktuellen Worte du sofort sehen willst, neue Worte hinzufügen oder andere Worte ausblenden. Unter „alle Worte“ siehst du auch die schon länger ausgeblendeten. Manchmal ist es interessant, diese Worte wieder im Zusammenhang zu lesen und so einen „roten Faden“ zu entdecken und zu sehen, wie Gott dich durch sein Wort führt."),
        "words_info_sub":
            MessageLookupByLibrary.simpleMessage("Leben mit dem Wort Gottes"),
        "words_reminder_enabled": m20,
        "words_reminder_head": MessageLookupByLibrary.simpleMessage(
            "Lass dich im Alltag an das Wort Gottes erinnern!"),
        "words_reminder_no_current_words": MessageLookupByLibrary.simpleMessage(
            "Du musst einen Eintrag in \'Aktuelle Worte\' haben, um daran erinnert werden zu können."),
        "words_reminder_sub":
            MessageLookupByLibrary.simpleMessage("an das Wort im Alltag"),
        "write_text": MessageLookupByLibrary.simpleMessage("Text schreiben"),
        "wrong_password":
            MessageLookupByLibrary.simpleMessage("Falsches Passwort"),
        "wrong_password_text": MessageLookupByLibrary.simpleMessage(
            "Das Passwort war falsch, bitte versuche es erneut. (Du kannst dein Passwort in den Einstellungen zurücksetzen, falls du es vergessen hast.)"),
        "x_h_y_min": m21,
        "x_hours": m22,
        "x_minutes": m23,
        "yes": MessageLookupByLibrary.simpleMessage("Ja")
      };
}
