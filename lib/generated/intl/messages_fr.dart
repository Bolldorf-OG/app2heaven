// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(maxChapter) => "Chapitre valides: 1-${maxChapter}";

  static String m1(maxVerse) => "Versets valides: 1-${maxVerse}";

  static String m2(date) => "Aperçu du jour ${date}";

  static String m3(date) => "Examen de la journée ${date}";

  static String m4(date) => "Planifié pour: ${date}";

  static String m5(link) =>
      "App2Heaven sera toujours entièrement gratuit pour ses utilisateurs. App2Heaven e.V. travaille pour atteindre plus de gens et apporter la lumière de Dieu dans le monde. Aidez-nous à faire passer le message! Plus d\'infos sur [App2Heaven e.V.](${link})";

  static String m6(date) => "Votre dernière confession remonte au ${date}.";

  static String m7(date, time) => "Ma confession était le ${date} à ${time}";

  static String m8(date) =>
      "Vous avez planifié votre prochaine confession le ${date}.";

  static String m9(startTime, duration) =>
      "Temps de prière à ${startTime} aujourd\'hui (${duration}). Dieu t\'attend.";

  static String m10(email) =>
      "App2Heaven recherche des programmeurs d\'applications pour développer conjointement l\'application sur une plate-forme open source. Intéressé? Alors écrivez-nous à ${email} ou jetez un œil au code à l\'adresse https://github.com/Bolldorf-OG/app2heaven.";

  static String m11(count) =>
      "${Intl.plural(count, one: 'Lire le verset', other: 'Lire les versets')}";

  static String m12(date, time) =>
      "Un rappel pour votre prochaine confession le ${date} a été créé. Vous en serez rappelé le ${date} à ${time}.";

  static String m13(title, text, uri) =>
      "Jetez un oeil à cette expérience de mon App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m14(title, text, uri) =>
      "Jetez un oeil à cette parole de dieu de mon App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m15(title, text, uri) =>
      "Jetez un oeil à cette note de prière de mon App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m16(title, text, uri) =>
      "Merci de prier avec moi pour cette demande de mon App2Heaven:\n${title}\n\n${text}\n${uri}";

  static String m17(title, text, uri) =>
      "Dieu a aidé! Merci d\'avoir prié pour cette demande:\n${title}\n\n${text}\n${uri}";

  static String m18(date) => "Topo ${date}";

  static String m19(title, text) =>
      "Votre rappel quotidien pour \"${title}\":\n\n${text}";

  static String m20(title) => "\'${title}\' a été sauvé.";

  static String m21(title, time) =>
      "Vous vous souviendrez de «${title}» tous les jours à ${time}.";

  static String m22(x, y) => "${x} h ${y} min";

  static String m23(x) =>
      "${Intl.plural(x, one: '${x} heure', other: '${x} heures')}";

  static String m24(x) =>
      "${Intl.plural(x, one: '${x} minute', other: '${x} minutes')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actual": MessageLookupByLibrary.simpleMessage("Réel"),
        "actual_min": MessageLookupByLibrary.simpleMessage("Réel (min)"),
        "add": MessageLookupByLibrary.simpleMessage("Ajouter"),
        "add_confession":
            MessageLookupByLibrary.simpleMessage("Ajouter une confession"),
        "all_deeds_done_for_today": MessageLookupByLibrary.simpleMessage(
            "Vous avez déjà accompli tous les actes prévus pour aujourd\'hui."),
        "all_topics_were_deleted": MessageLookupByLibrary.simpleMessage(
            "Tous les thèmes pour la confession ont été effacés. "),
        "already_done": MessageLookupByLibrary.simpleMessage("Déjà fait"),
        "analytics_dialog": MessageLookupByLibrary.simpleMessage(
            "Aidez-nous à développer davantage l\'application en soumettant vos statistiques d\'utilisation de manière anonyme. Vous pouvez modifier votre décision à tout moment dans les paramètres."),
        "analytics_info": MessageLookupByLibrary.simpleMessage(
            "Si activé, les statistiques d\'utilisateurs anonymes seront collectées. Pour plus d\'informations, consultez la politique de confidentialité."),
        "archive": MessageLookupByLibrary.simpleMessage("Archives"),
        "at": MessageLookupByLibrary.simpleMessage("À :"),
        "attention": MessageLookupByLibrary.simpleMessage("Attention"),
        "audio_stimuli_last_days": MessageLookupByLibrary.simpleMessage(
            "Écoutez les stimuli audio de ces derniers jours sur credo-online"),
        "audio_stimulus": MessageLookupByLibrary.simpleMessage("Topo audio"),
        "avg_per_day": MessageLookupByLibrary.simpleMessage("Moyenne par jour"),
        "back": MessageLookupByLibrary.simpleMessage("Retour"),
        "backup_explanation": MessageLookupByLibrary.simpleMessage(
            "Vous pouvez exporter toutes les données stockées localement dans l\'application (y compris les paramètres) dans un seul fichier. Ce fichier peut ensuite être transféré vers d\'autres appareils, par exemple via le stockage dans le cloud ou par e-mail. Le transfert de données fonctionne également depuis iOS vers Android et vice-versa.\n\nVeuillez noter cependant que la restauration d\'une sauvegarde est destructrice. Toutes les données précédemment existantes sont perdues lors de la restauration. "),
        "backup_restore":
            MessageLookupByLibrary.simpleMessage("Sauvegarde / Restauration"),
        "backup_version_mismatch": MessageLookupByLibrary.simpleMessage(
            "Restauration abandonnée, car la sauvegarde a été créée par une version non prise en charge."),
        "bible_book": MessageLookupByLibrary.simpleMessage("Livre"),
        "bible_chapter": MessageLookupByLibrary.simpleMessage("Chapitre"),
        "bible_chapter_max": m0,
        "bible_passage":
            MessageLookupByLibrary.simpleMessage("Passage de la Bible"),
        "bible_passage_not_found_text": MessageLookupByLibrary.simpleMessage(
            "Le passage recherché n\'a pas été trouvé. Vérifie la référence et essaye de nouveau."),
        "bible_passage_not_found_title":
            MessageLookupByLibrary.simpleMessage("Passage non trouvé"),
        "bible_reference_advice": MessageLookupByLibrary.simpleMessage(
            "Saisis la référence que tu veux lire !"),
        "bible_verse_max": m1,
        "bible_verses": MessageLookupByLibrary.simpleMessage("Verset(s)"),
        "bible_verses_hint":
            MessageLookupByLibrary.simpleMessage("par ex. 3 ou 1-5"),
        "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
        "caution": MessageLookupByLibrary.simpleMessage("MISE EN GARDE"),
        "change_reminder":
            MessageLookupByLibrary.simpleMessage("Modifier le rappel"),
        "choose_folder":
            MessageLookupByLibrary.simpleMessage("Choisissez un dossier"),
        "clear_confession_topics": MessageLookupByLibrary.simpleMessage(
            "Effacer les sujets de confession (nécessite un mot de passe)"),
        "clear_reminder":
            MessageLookupByLibrary.simpleMessage("Effacer le rappel"),
        "communities": MessageLookupByLibrary.simpleMessage("Les communautés"),
        "community_experiences": MessageLookupByLibrary.simpleMessage(
            "Les expériences des communautés"),
        "community_experiences_sub":
            MessageLookupByLibrary.simpleMessage("Vocation et plus"),
        "community_select":
            MessageLookupByLibrary.simpleMessage("Sélectionner une communauté"),
        "confession": MessageLookupByLibrary.simpleMessage("Confession"),
        "confession_empty_info": MessageLookupByLibrary.simpleMessage(
            "En sauvegardant votre confession, vos sujets de confession seront supprimés."),
        "confession_info_head":
            MessageLookupByLibrary.simpleMessage("Pourquoi se confesser?"),
        "confession_info_head2":
            MessageLookupByLibrary.simpleMessage("Comment se confesser?"),
        "confession_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "„Celui à qui vous remettez ses péchés, ses péchés lui sont remis“, dit Jésus à ses apôtres. La confession nous permet de faire l’expérience merveilleuse et concrète de se faire remettre nos péchés au nom de Jésus. Ainsi, tu peux faire l’expérience personnelle et instantanée de la miséricorde de Dieu. Il est certain qu’il n’est pour personne facile d’aller se confesser. Mais quand tu oses ne plus te contenter de montrer une belle apparence, pour être honnête, tu fais alors l’expérience heureuse que Dieu t’accepte et t’aime comme tu es, et t’ouvre un nouvel avenir en te remettant tes péchés. Celui qui a recours à ce sacrement fait l’expérience que la confession est toujours une source de joie pour la vie et un nouvel élan pour faire le bien. C’est pourquoi il est conseillé de se confesser régulièrement (e.g. tous les mois, et dans tous les cas avant chaque grande fête comme Noël ou Pâques)."),
        "confession_info_paragraph2": MessageLookupByLibrary.simpleMessage(
            "1. Prends le temps de préparer ta confession (e.g. avec les suggestions de réflexion dans cette app). Si entretemps t’apparaissent des éléments qui ont leur place dans la confession, tu peux les noter ici pour qu’ils ne tombent pas dans l’oubli. Afin d’en garantir la confidentialité (tes péchés ne concernent que Dieu et toi-même !), tu peux protéger cette section avec un mot de passe. Pour être certain que d’autres personnes ne mettent pas le nez dans tes péchés, il est conseillé de noter juste des mots-clés et des thèmes qui sont pour toi, et toi seul, directement porteurs de sens. \n2. Dis à Dieu que tu es contrit et que tu demandes son aide pour t’améliorer. Tu peux également inscrire une décision pour l’avenir.\n3. Va voir un prêtre et reconnais tes péchés. N’aie pas peur, le prêtre n’est pas là pour juger tes péchés, mais pour te montrer la miséricorde de Dieu. Si tu n’es pas allé te confesser depuis très longtemps, ou s’il y a des choses que tu ne vois pas clairement, dis-le simplement. Le prêtre t’aidera. Après la confession il te donnera des conseils, une parole de réconfort et une pénitence, c’est-à-dire une prière à dire ou une action à réaliser. La pénitence est là pour faire un pas dans la bonne direction et pour guérir ce qui a été blessé par le péché. Et surtout le prêtre te donne l’absolution, le pardon des péchés au nom de Dieu. Enfin, quand tu notes que tu t’es confessé, tous les thèmes de la confession sont supprimés - car pas même Dieu ne les garde en mémoire !\n4. Tu es une créature nouvelle ! Remercie Dieu - et repars à neuf avec lui dans ton quotidien."),
        "confession_info_sub": MessageLookupByLibrary.simpleMessage(
            "Confession - pourquoi et comment"),
        "confession_password": MessageLookupByLibrary.simpleMessage(
            "Confession Sujets Mot de passe"),
        "confession_planned_on_future": MessageLookupByLibrary.simpleMessage(
            "Votre prochaine confession est prévue pour"),
        "confession_planned_on_past": MessageLookupByLibrary.simpleMessage(
            "Vous aviez prévu de vous confesser le"),
        "confession_planner":
            MessageLookupByLibrary.simpleMessage("Planificateur de confession"),
        "confession_planner_description": MessageLookupByLibrary.simpleMessage(
            "Planifier et enregistrer les confessions"),
        "confession_preparation_head": MessageLookupByLibrary.simpleMessage(
            "Préparation pour la confession"),
        "confession_preparation_paragraph": MessageLookupByLibrary.simpleMessage(
            "Commence par une simple demande: “Esprit Saint, montre-moi quelles choses dans ma vie ont besoin d’être réconciliées. Aide-moi à regarder ma vie en vérité. Donne-moi le courage de m’ouvrir à la vérité sur toute ma vie et à ta miséricorde”. Il est essentiel de comprendre qu’aucun péché n’est trop grave pour être confessé. Au contraire, cela mérite le plus grand respect quand quelqu’un reconnaît ses péchés avec sincérité. "),
        "confession_preparation_sub": MessageLookupByLibrary.simpleMessage(
            "Questions et pistes de réflexion"),
        "confession_today_text": MessageLookupByLibrary.simpleMessage(
            "„Mon âme, bénis l\'Eternel, Et n\'oublie aucun de ses bienfaits! C\'est lui qui pardonne toutes tes iniquités, Qui guérit toutes tes maladies; C\'est lui qui délivre ta vie de la fosse, Qui te couronne de bonté et de miséricorde;“ (Ps 103,2-4)."),
        "confession_topics_sub": MessageLookupByLibrary.simpleMessage(
            "Que je veux aborder dans la confession"),
        "confessional_topic":
            MessageLookupByLibrary.simpleMessage("Sujet confessionnel"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmer"),
        "confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
        "content_language":
            MessageLookupByLibrary.simpleMessage("Langue du contenu"),
        "country_code":
            MessageLookupByLibrary.simpleMessage("Indicatif téléphonique"),
        "create_backup":
            MessageLookupByLibrary.simpleMessage("Créer sauvegarde"),
        "creation_date":
            MessageLookupByLibrary.simpleMessage("Date de création"),
        "current_decisions":
            MessageLookupByLibrary.simpleMessage("Les décisions actuelles"),
        "current_decisions_sub":
            MessageLookupByLibrary.simpleMessage("que je veux vivre"),
        "current_deeds":
            MessageLookupByLibrary.simpleMessage("Actuellement prévu"),
        "current_deeds_sub":
            MessageLookupByLibrary.simpleMessage("Ce que je veux faire"),
        "current_prayerrequests": MessageLookupByLibrary.simpleMessage(
            "Intentions de prières récentes"),
        "current_words":
            MessageLookupByLibrary.simpleMessage("Paroles récentes"),
        "current_words_sub":
            MessageLookupByLibrary.simpleMessage("qui m\'accompagnent"),
        "custom": MessageLookupByLibrary.simpleMessage("Personnalisé"),
        "dashboard": MessageLookupByLibrary.simpleMessage("Tableau de bord"),
        "dashboard_settings":
            MessageLookupByLibrary.simpleMessage("Réglages: Tableau de bord"),
        "dayspreview": MessageLookupByLibrary.simpleMessage("Aperçu du jour"),
        "dayspreview_date": m2,
        "dayspreview_decisions_head":
            MessageLookupByLibrary.simpleMessage("Décisions"),
        "dayspreview_decisions_sub": MessageLookupByLibrary.simpleMessage(
            "que je veux mettre en pratique aujourd\'hui"),
        "dayspreview_deeds_head": MessageLookupByLibrary.simpleMessage("Actes"),
        "dayspreview_deeds_sub": MessageLookupByLibrary.simpleMessage(
            "que je veux faire aujourd\'hui"),
        "dayspreview_no_elements_enabled_description":
            MessageLookupByLibrary.simpleMessage(
                "Vous pouvez choisir les éléments à afficher dans les paramètres."),
        "dayspreview_no_elements_enabled_title":
            MessageLookupByLibrary.simpleMessage("Aucun élément configuré"),
        "dayspreview_prayertime_head":
            MessageLookupByLibrary.simpleMessage("Le temps"),
        "dayspreview_prayertime_sub": MessageLookupByLibrary.simpleMessage(
            "que je veux prendre pour la prière aujourd\'hui"),
        "dayspreview_settings":
            MessageLookupByLibrary.simpleMessage("Réglages: Aperçu du jour"),
        "dayspreview_words_head":
            MessageLookupByLibrary.simpleMessage("Les Paroles de Dieu"),
        "dayspreview_words_sub": MessageLookupByLibrary.simpleMessage(
            "avec lesquelles je veux vivre aujourd\'hui"),
        "daysreview":
            MessageLookupByLibrary.simpleMessage("Examen de la journée"),
        "daysreview_calm_head": MessageLookupByLibrary.simpleMessage(
            "Entrer dans le repos du soir"),
        "daysreview_calm_text":
            MessageLookupByLibrary.simpleMessage("Fais silence."),
        "daysreview_calm_text2": MessageLookupByLibrary.simpleMessage(
            "Laisse-toi regarder\npar le regard aimant de Dieu"),
        "daysreview_calm_text3": MessageLookupByLibrary.simpleMessage(
            "Laisse défiler intérieurement\ndevant toi encore une fois\nla journée d’aujourd’hui."),
        "daysreview_calm_text4": MessageLookupByLibrary.simpleMessage(
            "De quoi veux-tu remercier Dieu ?"),
        "daysreview_confession_button": MessageLookupByLibrary.simpleMessage(
            "Ajouter un thème pour la confession"),
        "daysreview_confession_head": MessageLookupByLibrary.simpleMessage(
            "Pour quoi veux-tu demander à Dieu son pardon ? "),
        "daysreview_date": m3,
        "daysreview_decisions_head":
            MessageLookupByLibrary.simpleMessage("Décisions actuelles"),
        "daysreview_deeds_head":
            MessageLookupByLibrary.simpleMessage("Actes en cours"),
        "daysreview_eveningprayer_head":
            MessageLookupByLibrary.simpleMessage("Prière du soir"),
        "daysreview_eveningprayer_paragraph": MessageLookupByLibrary.simpleMessage(
            "Ferme mes yeux pour revoir tes merveilles en ce moment que le jour fuit!\nAllume dans la nuit\nune clarté nouvelle!\nQue le silence alentour me console\nde la faiblesse de ma foi,\npuisque j\'écoute en moi\nrésonner ta parole!\nJusqu\'à demain, si se lève l\'aurore, je t\'abandonne mon esprit!\nTa grâce me suffit,\nc\'est elle que j\'implore."),
        "daysreview_forgivness_head":
            MessageLookupByLibrary.simpleMessage("Confession des péchés"),
        "daysreview_forgivness_head2":
            MessageLookupByLibrary.simpleMessage("Demande de pardon"),
        "daysreview_forgivness_paragraph": MessageLookupByLibrary.simpleMessage(
            "Je confesse à Dieu tout-puissant, je reconnais devant mes frères que j’ai péché en pensée, en parole, par action et par omission. Oui, J’ai vraiment péché. C’est pourquoi je supplie la Vierge Marie, les anges et tous les saints, et vous aussi mes frères, de prier pour moi le Seigneur notre Dieu."),
        "daysreview_forgivness_paragraph2": MessageLookupByLibrary.simpleMessage(
            "Que Dieu tout-puissant nous fasse miséricorde ; qu\'il nous pardonne nos péchés et nous conduise à la vie éternelle."),
        "daysreview_prayertime_head":
            MessageLookupByLibrary.simpleMessage("Temps de prière"),
        "daysreview_prayertime_sub":
            MessageLookupByLibrary.simpleMessage("Aujourd\'hui j\'ai prié"),
        "daysreview_prayertime_sub2": MessageLookupByLibrary.simpleMessage(
            "Temps de prière que je veux prendre demain"),
        "daysreview_settings": MessageLookupByLibrary.simpleMessage(
            "Réglages: Examen de la journée"),
        "decision": MessageLookupByLibrary.simpleMessage("Décision"),
        "decision_view":
            MessageLookupByLibrary.simpleMessage("Voir les progrès"),
        "decisions": MessageLookupByLibrary.simpleMessage("Décisions"),
        "decisions_archive_sub": MessageLookupByLibrary.simpleMessage(
            "toutes les décisions antérieures"),
        "decisions_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Il y a des moments où nous comprenons que nous devons changer quelque chose dans notre vie. Cela peut arriver dans la prière ou à la lecture de la Parole de Dieu - ou si nous avons eu un problème sérieux. Ensuite, nous prenons généralement une bonne résolution. Mais nous savons bien combien de temps les bonnes résolutions tiennent... C’est ainsi que Saint Ignace a trouvé une manière efficace : Il suggère de réfléchir le matin aux décisions que nous avons prises, et de vérifier à la fin de la journée si nous avons réussi à les mettre en œuvre. L\'avantage, c’est que même si tu ne rencontres pas un succès, tu ne t’enlises pas - tu es simplement rappelé à l’ordre. Ainsi, tu peux, avec l\'aide de Dieu, scruter tes habitudes les plus établies et, lentement mais sûrement, en prendre de nouvelles qui soient meilleures. Il est vrai que sans Jésus, nous ne pouvons rien faire. Il nous donne Sa lumière pour voir où nous devons nous convertir, et la force de mettre en œuvre ce que nous avons reconnu comme nécessaire. Mais il est également vrai que cela ne peut se faire sans nous. Nous devons déjà nous mettre en chemin et prendre les mesures appropriées pour réussir. Ainsi cette fonction est un moyen de mettre en oeuvre dans ta vie ce que tu as reconnu de bon par Dieu. Si tu inscris chaque jour comment tu as mis en oeuvre tes décisions, tu pourras voir l’évolution de tes progrès jour après jour."),
        "decisions_info_sub":
            MessageLookupByLibrary.simpleMessage("Mener ma vie délibérément"),
        "deed": MessageLookupByLibrary.simpleMessage("Action"),
        "deed_date_label":
            MessageLookupByLibrary.simpleMessage("Quand voulez-vous faire ça?"),
        "deed_planned_for": m4,
        "deeds": MessageLookupByLibrary.simpleMessage("Actes"),
        "deeds_archive_sub":
            MessageLookupByLibrary.simpleMessage("Ce que j\'ai fait"),
        "deeds_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "„Allez dans le monde entier. Proclamez la Bonne Nouvelle à toute la création !“ (Mc 16,15), dit Jésus. Il est également écrit : “N’aimons pas en paroles ni par des discours, mais par des actes et en vérité” (Jean 3, 18). Evangéliser, c’est annoncer aux hommes la Bonne Nouvelle de l’amour de Dieu - en paroles et en actes. Afin que cela ne demeure pas simplement une belle pensée, tu peux noter ici ce que tu veux faire aux autres : aider, rendre un service, rendre visite, discuter, inviter à un événement. Ou peut-être te viennent des idées d’initiatives qui participent à la construction du Royaume de Dieu. Quand nous sommes à l’écoute lors de notre prière et regardons ceux qui vivent à nos côtés, Dieu nous fait reconnaître ce que nous devons faire, afin qu’Il vienne aux hommes et que les hommes viennent à Lui. Il est ici clair qu’à nous seuls, nous ne pouvons faire en sorte qu’un homme se tourne vers Dieu - c’est l’oeuvre de l’Esprit Saint. Mais il est aussi clair que Dieu veut faire de nous ses ouvriers, pour que les hommes fassent l’expérience concrète de Son amour."),
        "deeds_info_sub":
            MessageLookupByLibrary.simpleMessage("Coopérer au Royaume de Dieu"),
        "delete": MessageLookupByLibrary.simpleMessage("Effacer"),
        "deregister":
            MessageLookupByLibrary.simpleMessage("Se désinscrire de "),
        "description_delete_many": MessageLookupByLibrary.simpleMessage(
            "Vous pouvez maintenant supprimer plusieurs éléments à la fois en cliquant sur cette icône, en les sélectionnant dans la liste, puis en cliquant sur le bouton dans le coin inférieur droit."),
        "description_share_many": MessageLookupByLibrary.simpleMessage(
            "Vous pouvez désormais partager ou exporter plusieurs éléments à la fois en cliquant sur cette icône, en les sélectionnant dans la liste, puis en cliquant sur le bouton dans le coin inférieur droit."),
        "display": MessageLookupByLibrary.simpleMessage("Affichage"),
        "donate_now": MessageLookupByLibrary.simpleMessage("En savoir plus"),
        "donations": MessageLookupByLibrary.simpleMessage("Des dons"),
        "donations_dialog": MessageLookupByLibrary.simpleMessage(
            "App2Heaven sera toujours entièrement gratuit pour ses utilisateurs. App2Heaven e.V. travaille pour atteindre plus de gens et apporter la lumière de Dieu dans le monde. Aidez-nous en nous faisant part de vos commentaires sur votre expérience utilisateur, en nous faisant part de vos suggestions pour le développement ultérieur de l\'application, en parlant d\'App2Heaven à vos amis ou en visitant la page de dons."),
        "donations_text_markdown": m5,
        "done": MessageLookupByLibrary.simpleMessage("Fini"),
        "duration": MessageLookupByLibrary.simpleMessage("Durée :"),
        "edit": MessageLookupByLibrary.simpleMessage("Modifier"),
        "edit_decision":
            MessageLookupByLibrary.simpleMessage("Modifier décision"),
        "edit_deed": MessageLookupByLibrary.simpleMessage("Modifier l\'action"),
        "edit_faith_experience":
            MessageLookupByLibrary.simpleMessage("Modifier expérience de foi"),
        "edit_prayer_note":
            MessageLookupByLibrary.simpleMessage("Modifier note de prière"),
        "edit_prayer_request": MessageLookupByLibrary.simpleMessage(
            "Modifier ma prière de demande"),
        "edit_topic":
            MessageLookupByLibrary.simpleMessage("Modifier Nouveau thème"),
        "edit_word": MessageLookupByLibrary.simpleMessage("Modifier parole"),
        "end_prayertime":
            MessageLookupByLibrary.simpleMessage("Terminer le temps de prière"),
        "enter_new_password": MessageLookupByLibrary.simpleMessage(
            "Veuillez entrer un nouveau mot de passe pour vos sujets de confession:"),
        "enter_password": MessageLookupByLibrary.simpleMessage(
            "s\'il vous plait entrez votre mot de passe:"),
        "error": MessageLookupByLibrary.simpleMessage("erreur"),
        "error_no_location":
            MessageLookupByLibrary.simpleMessage("Veuillez entrer un lieu."),
        "error_past_time": MessageLookupByLibrary.simpleMessage(
            "Veuillez choisir une date et une heure dans le futur."),
        "experiences": MessageLookupByLibrary.simpleMessage("Expériences"),
        "experiences_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Dieu est toujours à l\'oeuvre (Jean 5, 17), mais nous ne nous en rendons pas toujours compte. Il nous arrive parfois de découvrir ses traces dans notre vie en prenant du recul – comme Moïse, qui ne put pas voir Dieu directement, mais seulement son « dos » (Exode 33, 18-33).\nCela peut être par une expérience dans laquelle je reconnais la Providence surprenante de Dieu ; ou cela peut venir comme un fruit de la prière. Ou par une Parole de Dieu qui m\'a montré le chemin que je dois suivre, et qui a transformé quelque chose dans ma vie. Témoigner, c’est parler de ma propre expérience de l’action de Dieu dans ma vie. Rien ne nous encourage tant à croire comme les expériences concrètement vécues de la présence de Dieu. Elles nous montrent que la foi n’est pas une théorie douteuse, mais que Dieu vit et agit dans notre vie elle-même. Voilà pourquoi tu peux noter dans cette partie tes expériences de la présence de Dieu. Tu peux ensuite partager ces expériences avec les autres et ainsi témoigner de ta foi. Et bien sûr, tu peux aussi lire les expériences des autres et ainsi affermir ta foi."),
        "experiences_info_sub": MessageLookupByLibrary.simpleMessage(
            "Pourquoi les témoignages sont importants"),
        "experiences_sub":
            MessageLookupByLibrary.simpleMessage("Comment Dieu agit"),
        "faith_experience":
            MessageLookupByLibrary.simpleMessage("Expérience de foi"),
        "faithexperiences":
            MessageLookupByLibrary.simpleMessage("Expériences de foi"),
        "favourites": MessageLookupByLibrary.simpleMessage("Favoris"),
        "font_size": MessageLookupByLibrary.simpleMessage("Taille du texte"),
        "fontsize":
            MessageLookupByLibrary.simpleMessage("Taille des caractères"),
        "former_prayerrequests": MessageLookupByLibrary.simpleMessage(
            "Intentions de prières antérieures"),
        "god_helped": MessageLookupByLibrary.simpleMessage("Dieu a aidé !"),
        "gods_word_reminder": MessageLookupByLibrary.simpleMessage(
            "Se souvenir de la Parole de Dieu"),
        "hide_from_current": MessageLookupByLibrary.simpleMessage("Archiver"),
        "highlight": MessageLookupByLibrary.simpleMessage("Surligner"),
        "hours": MessageLookupByLibrary.simpleMessage("Heures"),
        "info": MessageLookupByLibrary.simpleMessage("Infos"),
        "intended_min": MessageLookupByLibrary.simpleMessage("Prévu (min)"),
        "introduction": MessageLookupByLibrary.simpleMessage("Introduction"),
        "introduction_text": MessageLookupByLibrary.simpleMessage(
            "Bienvenue dans l’App2Heaven!\nCette App a pour objectif de te soutenir dans ta vie spirituelle au quotidien. Voici quelques conseils pour utiliser les différentes fonctions.\nChoisis la fonction « prière » et lis la page d\'information. Réfléchis au temps que tu veux consacrer chaque jour à la prière. La prière personnelle est le fondement de la vie spirituelle. C\'est pourquoi il est important de s’y tenir – même si c’est plus difficile certains jours. Il est préférable de commencer à prier un temps assez court et qui soit réaliste, par exemple 5 ou 10 minutes. Sur la page d\'information, tu trouveras une description des différentes formes de prière. Prie selon ce qui te semble bon et selon ce qui te fait du bien. Laisse-toi guider par l\'Esprit Saint, qui est celui qui nous apprend à prier. S’il te vient dans la prière une idée que tu ne veux pas oublier, tu peux la noter après la prière. Si c’est une pensée qui peut édifier d’autres, tu peux aussi la partager avec des amis utilisateurs de App2Heaven. Ainsi vous resterez en communion spirituelle.\nLa fonction “Intentions de prière” est également destinée aux groupes de prière. C’est dans cette fonction que tu peux noter ceux pour qui tu veux prier personnellement, mais tu peux aussi partager ces intentions, afin que vous priez en groupe.\nNous ne pouvons pas toujours faire de façon sensible l\'expérience de l\'action de Dieu. Il est donc d\'autant plus encourageant d\'entendre des témoignages sur l\'action de Dieu, aujourd\'hui dans notre monde. Dans la fonction « témoignages » tu trouveras des exemples concrets – et tu pourras toi-même noter et partager des signes d’action de Dieu que tu reçois personnellement.\nQuand des paroles de Dieu te touchent particulièrement, par exemple pendant une messe ou quand tu lis la Bible chez toi, tu peux les noter sous la fonction « Paroles de Dieu », les relire lors de ton temps de prière personnelle et te les rappeler au quotidien.\nParfois nous viennent, lors du temps de prière, des idées ou des éclairages sur ce que nous pouvons faire pour Dieu ou pour les hommes – tu peux les noter dans la fonction « Actions » et prévoir quand tu les mettras en oeuvre.\nLes deux fonctions « anticipation » et « rétrospective» t\'aident à commencer et à terminer ta journée avec Dieu.\nTout ne nous réussit pas dans la vie toujours comme nous le désirons. Quand nous faisons l\'́expérience douloureuse de ne pas être à la hauteur de l\'amour que nous voudrions donner aux autres et à Dieu, Dieu nous offre son pardon. Dans la partie « confession » tu pourras découvrir ce que ce sacrement nous apporte, et comment l’on peut s\'y préparer.\nCes différentes fonctions de l\'App sont des propositions. Tu n\'as pas besoin de toutes les utiliser à la fois ; tu peux choisir ce qui ces temps-ci peut t\'aider à rester en contact avec Dieu. Pour chaque fonction il y a une page d’information plus détaillée. Cette App va t’inspirer et te donner des idées - mais l’essentiel est que tu avances sur ton chemin personnel vers Dieu !"),
        "introduction_to_the_app": MessageLookupByLibrary.simpleMessage(
            "Introduction à l\'application"),
        "invalid_prayertimes": MessageLookupByLibrary.simpleMessage(
            "Tous les articles ont pas un temps de prière valide"),
        "language": MessageLookupByLibrary.simpleMessage("Langue"),
        "large": MessageLookupByLibrary.simpleMessage("grand"),
        "last_confession": m6,
        "later": MessageLookupByLibrary.simpleMessage("Plus tard"),
        "loading_experience": MessageLookupByLibrary.simpleMessage(
            "Chargement d\'une expérience"),
        "loading_passage":
            MessageLookupByLibrary.simpleMessage("Chargement de la parole... "),
        "location": MessageLookupByLibrary.simpleMessage("Lieu"),
        "lock": MessageLookupByLibrary.simpleMessage("Fermer"),
        "medium": MessageLookupByLibrary.simpleMessage("moyen"),
        "menu_language": MessageLookupByLibrary.simpleMessage("Langue du menu"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutes"),
        "missing_text":
            MessageLookupByLibrary.simpleMessage("Veuillez saisir le texte"),
        "missing_title":
            MessageLookupByLibrary.simpleMessage("Veuillez saisir un titre"),
        "missing_value":
            MessageLookupByLibrary.simpleMessage("Veuillez remplir"),
        "monthly_prayerrequest": MessageLookupByLibrary.simpleMessage(
            "Intentions de prière du mois"),
        "morning_prayer": MessageLookupByLibrary.simpleMessage(
            "(traduction automatique de l\'allemand)\n\nSeigneur Jésus-Christ, dans le silence de ce matin naissant, je viens à vous et plaide avec humilité et confiance pour votre paix, votre sagesse, votre force.\nAccorde que je regarde le monde aujourd\'hui avec des yeux pleins d\'amour.\nLaissez-moi comprendre que toute la gloire de l\'église jaillit de votre croix comme source.\nLaisse-moi recevoir mon prochain comme l\'homme que tu veux aimer à travers moi.\nDonnez-moi la volonté de le servir avec dévotion et déployez toute la bonté que vous avez mise en lui.\nMes paroles devraient rayonner la douceur et tout mon comportement devrait apporter la paix.\nSeules les pensées qui transmettent des bénédictions devraient rester dans ma mémoire.\nFermez mes oreilles à tout mot malveillant et à toute critique.\nQue ma langue ne serve qu\'à souligner le bien.\nSurtout, Seigneur, parce que je suis tellement rempli de joie et de bien-être que tous ceux qui me rencontrent ressentiront à la fois ta présence et ton amour.\nHabille-moi de la splendeur de ta bonté et de ta beauté, afin que je puisse te révéler au cours de cette journée.\nAmen."),
        "morning_prayer_head": MessageLookupByLibrary.simpleMessage(
            "Prière du matin de Mirjam sacré d\'Abelin (vue)"),
        "my_confession_was_on": m7,
        "my_confession_was_on_fallback": MessageLookupByLibrary.simpleMessage(
            "Aucune confession pour le moment"),
        "my_faithexperiences":
            MessageLookupByLibrary.simpleMessage("Mes expériences de foi"),
        "mynumber": MessageLookupByLibrary.simpleMessage("Mon numéro"),
        "new_decision":
            MessageLookupByLibrary.simpleMessage("Nouveau décision"),
        "new_decision_hint": MessageLookupByLibrary.simpleMessage(
            "Appuie sur + pour ajouter une nouvelle décision"),
        "new_deed": MessageLookupByLibrary.simpleMessage("Nouvelle action"),
        "new_deed_hint": MessageLookupByLibrary.simpleMessage(
            "Appuie sur + pour ajouter un nouvel acte"),
        "new_faith_experience":
            MessageLookupByLibrary.simpleMessage("Nouveau expérience de foi"),
        "new_faith_experience_hint": MessageLookupByLibrary.simpleMessage(
            "Appuie sur + pour ajouter un témoignage"),
        "new_prayer_note":
            MessageLookupByLibrary.simpleMessage("Nouveau note de prière"),
        "new_prayer_note_hint": MessageLookupByLibrary.simpleMessage(
            "Appuie sur + pour ajouter une note"),
        "new_prayer_request": MessageLookupByLibrary.simpleMessage(
            "Nouvelle intention de prière"),
        "new_prayer_request_hint": MessageLookupByLibrary.simpleMessage(
            "Appuie sur + pour ajouter une intention"),
        "new_topic": MessageLookupByLibrary.simpleMessage("Nouveau thème"),
        "new_topic_hint": MessageLookupByLibrary.simpleMessage(
            "Appuie sur + pour ajouter un nouveau thème pour la confession"),
        "new_word": MessageLookupByLibrary.simpleMessage("Nouveau parole"),
        "new_word_hint": MessageLookupByLibrary.simpleMessage(
            "Appuie sur + pour ajouter une parole"),
        "next": MessageLookupByLibrary.simpleMessage("Suivant"),
        "next_confession":
            MessageLookupByLibrary.simpleMessage("Prochaine confession le :"),
        "no": MessageLookupByLibrary.simpleMessage("Non"),
        "no_bible_books":
            MessageLookupByLibrary.simpleMessage("Aucun livre trouvé"),
        "no_communities": MessageLookupByLibrary.simpleMessage(
            "Aucune communauté trouvée\nVeuillez vérifier votre connexion Internet"),
        "no_community_experiences": MessageLookupByLibrary.simpleMessage(
            "Aucune expérience trouvée\nVeuillez vérifier votre connexion Internet"),
        "no_confession_planned": MessageLookupByLibrary.simpleMessage(
            "Aucune confession n\'est actuellement prévue"),
        "no_confession_topics": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez pas encore créé de sujets de confession"),
        "no_confessions_yet": MessageLookupByLibrary.simpleMessage(
            "Aucune confession enregistrée pour le moment"),
        "no_decisions": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez pas encore pris de décision"),
        "no_deeds": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez encore rien planifié"),
        "no_deeds_today": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez aucune action planifiée aujourd\'hui"),
        "no_experiences": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez encore ajouté aucune expérience"),
        "no_gods_words": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez pas encore ajouté de mots"),
        "no_prayer_notes": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez pas encore pris de notes de prière"),
        "no_prayer_request_of_month": MessageLookupByLibrary.simpleMessage(
            "Il n\'y a pas de demande de prière pour le mois en cours."),
        "no_prayer_requests": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez encore ajouté aucune demande de prière"),
        "no_stimuli": MessageLookupByLibrary.simpleMessage(
            "Aucun stimuli trouvé\nVeuillez vérifier votre connexion Internet"),
        "no_stimulus_of_day": MessageLookupByLibrary.simpleMessage(
            "Aucun stimulus quotidien trouvé. S\'il vous plait, vérifiez votre connexion internet."),
        "no_stimulus_tags": MessageLookupByLibrary.simpleMessage(
            "Aucune catégorie trouvée\nVeuillez vérifier votre connexion Internet"),
        "note": MessageLookupByLibrary.simpleMessage("Noter"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("D\'accord"),
        "open_bible": MessageLookupByLibrary.simpleMessage("Ouvrir la Bible"),
        "open_bible_needs_internet": MessageLookupByLibrary.simpleMessage(
            "Vous devez être connecté à Internet pour lire les passages bibliques."),
        "open_bible_somewhere":
            MessageLookupByLibrary.simpleMessage("Suggérer verset biblique"),
        "open_bible_sub":
            MessageLookupByLibrary.simpleMessage("Lire et noter des passages"),
        "others": MessageLookupByLibrary.simpleMessage("Autres"),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "password_request":
            MessageLookupByLibrary.simpleMessage("Demande de mot de passe"),
        "passwords_dont_match": MessageLookupByLibrary.simpleMessage(
            "Les mots de passe ne correspondent pas!"),
        "past_confessions":
            MessageLookupByLibrary.simpleMessage("Confessions passées"),
        "plan_next_confession": MessageLookupByLibrary.simpleMessage(
            "Planifier la prochaine confession"),
        "planned": MessageLookupByLibrary.simpleMessage("Prévu"),
        "planned_confession": m8,
        "planning": MessageLookupByLibrary.simpleMessage("Planification"),
        "planning_button_sub":
            MessageLookupByLibrary.simpleMessage("Trouver du temps pour Dieu."),
        "planning_head": MessageLookupByLibrary.simpleMessage(
            "Appuie sur le jour et choisis le temps que tu veux prendre pour la prière chaque jours !"),
        "planning_sub": MessageLookupByLibrary.simpleMessage(
            "Vous recevrez un rappel 10 minutes avant l\'heure fixée."),
        "prayer_clock": MessageLookupByLibrary.simpleMessage("Temps de prière"),
        "prayer_info_head":
            MessageLookupByLibrary.simpleMessage("Qu\'est-ce que la prière?"),
        "prayer_info_head2":
            MessageLookupByLibrary.simpleMessage("Pourquoi prier?"),
        "prayer_info_head3":
            MessageLookupByLibrary.simpleMessage("Quand prier?"),
        "prayer_info_head4": MessageLookupByLibrary.simpleMessage(
            "Comment prier avec App2Heaven?"),
        "prayer_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Prier, c\'est bien plus qu\'adresser des paroles à Dieu. C\'est entretenir une amitié avec Dieu. Prier, c’est croire qu\'Il est là pour toi et qu\'Il t\'aime. C’est Lui dire ce que tu as sur le cœur. C’est écouter ce qu\'Il a à te dire. Ou tout simplement te reposer en Sa présence. Tu expérimenteras que prier te donnera la lumière et la force sur ton chemin vers Dieu. Quand tu prieras, tu découvriras qui tu es et ce pour quoi tu veux vivre."),
        "prayer_info_paragraph2": MessageLookupByLibrary.simpleMessage(
            "Peux-tu t\'imaginer une amitié dans laquelle on ne parlerait pas régulièrement l\'un avec l\'autre ? Le manque de communication nous éloigne l\'un de l\'autre. De même, nous nous éloignons de Dieu si nous ne passons pas du temps avec Lui. La relation avec Lui est la relation la plus importante, car elle nous donne le sens de notre vie et la direction à lui donner. C\'est pourquoi la prière est aussi importante pour la vie spirituelle que la respiration pour le corps. La différence c\'est que la respiration est automatique, alors que la prière disparaît si on ne s’en préoccupe pas. C\'est pour cela que cette App est là. Avec elle, tu peux organiser ta vie de façon à avoir le temps de vivre dès maintenant en communion avec Dieu. Cela t’aidera à vivre ta vie toujours plus en présence de Dieu. En faisant cela, ta vie au Ciel aura déjà commencé !"),
        "prayer_info_paragraph3": MessageLookupByLibrary.simpleMessage(
            "L\'Écriture Sainte nous enseigne que nous devons prier tout le temps (Luc 18, 1). C\'est-à-dire qu’il est possible de vivre constamment dans l\'amitié avec Dieu, même au milieu de nos occupations quotidiennes. Mais pour vraiment vivre intérieurement avec Dieu, nous avons besoin de prendre des moments dans la journée pour nous tourner vers Lui. En plus de la messe du dimanche (ou aussi une fois dans la semaine), nous te proposons ce qui suit : \n- Le matin, une courte prière, par exemple un signe de croix, un chant de louange, un psaume ou une prière personnelle. Pense au jour à venir et demande à Dieu sa bénédiction !\n- Pendant la journée, un temps de prière personnelle. Mieux vaut ne pas vouloir trop en faire, afin que tu puisses tenir le temps que tu auras décidé. Mais ce temps doit être suffisamment long pour écouter Dieu en vérité et lui confier ce qui compte vraiment. Il est important de définir un temps fixé et de s\'y tenir, afin que la prière ne se fasse pas en fonction du hasard ou de l\'humeur du jour. Tu peux planifier et inscrire dans ton agenda les temps de prière, si cela t’aide.\n -Le soir, avant de te coucher, un court temps de prière et de rétrospection de la journée écoulée. Confie à Dieu ce qui s’est passé, pour te coucher en paix et avec reconnaissance !"),
        "prayer_info_paragraph4": MessageLookupByLibrary.simpleMessage(
            "Jésus s\'est retiré dans la solitude pour prier. Cherche toi aussi un lieu calme, où tu ne seras pas dérangé (et, pourquoi pas, mets ton téléphone en mode avion !). Clique sur “Commencer le temps de prière” sous le menu “temps de prière”.\n\nPrends conscience que Dieu est là. Quand tu es chez toi, tu peux te le rappeler par un simple signe, par exemple en allumant une bougie, en regardant une croix ou une icône. La prière, c’est être pleinement en présence de Dieu. Essaye de rester silencieux en Sa présence. Il se peut que beaucoup de pensées viennent te troubler – tout cela fait partie de ta vie. Fais-en une prière, un remerciement ou une demande ! Ainsi tu peux tout remettre à Dieu. L’essentiel, c\'est qu\'Il est là, maintenant. Ne te laisse pas déranger si des pensées superficielles te reviennent constamment - laisse-les passer et cherche constamment la présence de Dieu.\n\nIl n\'y a pas de « méthode » particulière à laquelle on doit se tenir pour la suite de la prière. La prière est au final une amitié avec Dieu ; et dans une amitié, les amis sont l’un avec l’autre selon ce qui leur convient au mieux. Il y a toutefois différentes formes de prière. Choisis celles qui te parlent le plus au moment de la prière, et qui t\'aident à prier ! (les explications de chaque forme de prière s\'ouvrent en cliquant dessus).\n- La méditation : choisis un texte de l\'Écriture Sainte, par un exemple un passage de l\'un ou l’autre Évangile. Ou l\'Évangile du jour. Ou bien ouvre la Bible au hasard - un exemplaire en papier ou dans l’App2Heaven. Ou encore, relis les paroles que tu as notées dans App2Heaven dans la fonction « Paroles ». Lis le texte lentement et attentivement. Dieu a-t-il quelque chose à te dire pour ta vie à travers ce texte ? Comment veux-tu répondre à Sa Parole ? Dieu te fait-il comprendre ce que tu dois faire ? Non seulement l\'Écriture Sainte, mais aussi un livre de spiritualité, la création et surtout ta vie peuvent devenir l\'objet de ta méditation. Dieu peut se servir de tout pour nous parler. Tu peux aussi lire un enseignement ou un témoignage dans l’App2Heaven. Où entends-tu un appel de Dieu ? Une méthode épouvée pour méditer, c\'est de prier le chapelet – tu trouveras une explication sur le site Internet http://prieres-catholiques-traditionnelles.over-blog.com/article-le-chapelet-113398683.html.\n- La prière intérieure : tu peux tout parler en toute simplicité avec Dieu, en sachant qu\'Il est là et qu\'Il t\'aime. Dans chaque amitié, il est important de ne pas seulement parler ou demander, mais aussi de se mettre à disposition de l\'autre. Et comme dans une amitié humaine, tu peux passer du temps avec Dieu sans parler. Pendant un temps de prière intérieure, tu peux rester un long moment en Présence de Dieu, et simplement te tenir là, dans Sa lumière et Son amour. Une telle prière peut être plus efficace qu\'une prière avec beaucoup de mots.\n- L’adoration eucharistique : quand les disciples d\'Emmaüs demandèrent à Jésus « Reste avec nous ! », Jésus entra dans la maison et rompit le pain avec eux. Par l\'Eucharistie, Jésus est présent à nous d\'une manière particulière. Parfois, l\'hostie consacrée est exposée pour la prière, on appelle cela « l\'adoration eucharistique ». Nous contemplons alors le pain transformé et reconnaissons avec les yeux de la foi que c\'est Jésus que nous adorons. Il est là, rayonnant de l’amour qu\'Il nous a montré sur la Croix. Il est là, ressucité, Il nous parle et nous donne Son Esprit Saint. Dans l\'adoration eucharistique, tu peux prier selon toutes les formes qui sont expliquées ci-dessus ; mais ce qui compte vraiment, c\'est de Le regarder – et de se laisser regarder par Lui.\n\nA la fin de ton temps de prière, prends un temps de recul et réfléchis à ce que tu aimerais en retenir. Tu peux noter les pensées qui te sont venues sur ta vie ou sur ta foi. Écrire t’aidera à conserver les découvertes et à gagner en clarté. Il peut aussi être bon de partager tes réflexions spirituelles avec quelqu\'un de confiance.\n\nPeut-être as-tu reconu dans le temps de prière ce que Dieu attend de toi, et ce qu’il faut que tu décides afin de vivre plus selon Sa volonté, à la suite de Jésus. Tu peux noter de telles décisions dans la partie “Décisions”.\n\nPour finir, remercie Dieu et termine par un signe de croix ou un Notre Père - et clique sur “terminer le temps de prière”, ce qui enregistre automatiquement la durée de la prière. Ainsi tu pourras voir comment ton temps de prière a évolué."),
        "prayer_info_sub": MessageLookupByLibrary.simpleMessage(
            "Priez - Pourquoi, quand, comment?"),
        "prayer_note": MessageLookupByLibrary.simpleMessage("Note de prière"),
        "prayer_notes": MessageLookupByLibrary.simpleMessage("Notes de prière"),
        "prayer_notes_sub": MessageLookupByLibrary.simpleMessage(
            "Garde en mémoire ce que tu as reçu"),
        "prayer_request":
            MessageLookupByLibrary.simpleMessage("Prière Demande"),
        "prayer_request_done": MessageLookupByLibrary.simpleMessage("Répondue"),
        "prayer_time": MessageLookupByLibrary.simpleMessage("Temp de prière"),
        "prayerrequests":
            MessageLookupByLibrary.simpleMessage("Intentions de prières"),
        "prayerrequests_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Ici, tu peux noter les intentions pour lesquelles tu veux prier, afin qu’elles ne tombent pas dans l’oubli. Tu peux mettre en avant les intentions les plus urgentes. Si tes intentions évoluent au cours du temps, tu as la possibilité de les reformuler. En un clic, tu as ainsi sous les yeux pendant ton temps de prière toutes tes intentions actuelles. Tu peux également partager tes intentions avec d’autres utilisateurs de App2Heaven, car la prière commune possède une force particulière (cf. Mt 18,19). Nos intentions ne sont pas toujours exaucées exactement comme on se l’imagine, mais nous savons tout de même que Dieu répond à notre prière. Il est alors important de le remercier, car l’action de grâce renforce notre confiance et notre amour pour Dieu. C’est pourquoi tu peux glisser dans une autre section les intentions qui ont été exaucées d’une manière ou d’une autre. Il est bon de relire ces intentions de temps à autre et de rendre grâce à Dieu pour ce qu’Il fait pour nous."),
        "prayertime_reminder": m9,
        "prayertimes": MessageLookupByLibrary.simpleMessage("Temps de prière"),
        "prayertimes1": MessageLookupByLibrary.simpleMessage("Temps de prière"),
        "preparation": MessageLookupByLibrary.simpleMessage("Préparation"),
        "privacy_policy": MessageLookupByLibrary.simpleMessage(
            "politique de confidentialité"),
        "privacy_text": MessageLookupByLibrary.simpleMessage(
            "À l\'installation de l\'application, plusieurs autorisations sont demandées. Elles sont nécessaires pour son fonctionnement, particulièrement pour la fonction de messagerie. En principe, le contenu que tu écris dans l\'App2Heaven ne sont sauvegardés que sur ton smartphone - ainsi ni l\'équipe d\'administration ni les utilisateurs de l\'App2Heaven ne peuvent y avoir accès. Les contenus partagés sont transférés par Internet via un serveur dédié à l\'App2Heaven. Toutes les données sont traités confidentiellement. Elles ne seront utilisées que dans le cadre de l\'App2Heaven. Elles ne seront jamais lues ni exploitées, que ce soit de manière anonyme ou personalisée. Elle ne seront jamais transmises à un tiers, quelle que soit leur forme. Aucune statistique sur le contenu ou le comportement utilisateur n\'est calculée. L\'App2Heaven veut ainsi assurer la plus grande discrétion du contenu possible.\n\nPendant le développement de l\'application, des mesures de précaution ont été prises pour assurer la sûreté des données. Pourtant, aucune garantie ne peut être donnée que de telles mesures soient dépassées et que des données soient perdues. Une sûreté des données à 100% ne peut ainsi pas être garantie. C\'est pourquoi l\'association App2Heaven e.v. ne peut pas être tenue responsable de la perte ou du vol de données. En outre l\'association ne peut pas garantir que le contenu sera en tout temps disponible.\n\nL\'association se réserve le droit de mettre un terme au service."),
        "privacy_text_info": MessageLookupByLibrary.simpleMessage(
            "La politique de confidentialité peut être consultée dans le menu Paramètres."),
        "privacy_text_ok":
            MessageLookupByLibrary.simpleMessage("OK, bien reçu"),
        "privacy_text_title":
            MessageLookupByLibrary.simpleMessage("Protection des données"),
        "programmers_dialog": m10,
        "random_experience":
            MessageLookupByLibrary.simpleMessage("Expérience de foi"),
        "random_stimulus": MessageLookupByLibrary.simpleMessage("Topo"),
        "random_word_of_god":
            MessageLookupByLibrary.simpleMessage("Verset biblique"),
        "rating": MessageLookupByLibrary.simpleMessage("Évaluation"),
        "rating_max": MessageLookupByLibrary.simpleMessage(
            "Super! Merci au Seigneur! Vous pouvez tout faire par Celui qui vous fortifie. (cf. Phil. 4:13)"),
        "rating_min": MessageLookupByLibrary.simpleMessage(
            "Ne sois pas triste. Demain est un nouveau jour et «les miséricordes du Seigneur sont nouvelles chaque matin» (Lam. 3:22-23)"),
        "read": MessageLookupByLibrary.simpleMessage("Lire"),
        "read_passage": MessageLookupByLibrary.simpleMessage("Lire le passage"),
        "read_verses": m11,
        "real_prayertimes":
            MessageLookupByLibrary.simpleMessage("Prier maintenant"),
        "real_prayertimes_sub":
            MessageLookupByLibrary.simpleMessage("Ton temps passé avec Dieu"),
        "reference_example":
            MessageLookupByLibrary.simpleMessage("p.e. Rom. 2:28"),
        "refreshed_data":
            MessageLookupByLibrary.simpleMessage("Dates mises à jour"),
        "remember_confession":
            MessageLookupByLibrary.simpleMessage("Retenir la confession"),
        "reminder": MessageLookupByLibrary.simpleMessage("Rappel"),
        "reminder_created": MessageLookupByLibrary.simpleMessage("Rappel créé"),
        "reminder_created_confession": m12,
        "reset": MessageLookupByLibrary.simpleMessage("Réinitialiser"),
        "reset_demo": MessageLookupByLibrary.simpleMessage("Reset demo"),
        "reset_password": MessageLookupByLibrary.simpleMessage(
            "Réinitialiser le mot de passe"),
        "reset_password_caution": MessageLookupByLibrary.simpleMessage(
            "Les sujets de confession actuels seront supprimés si vous réinitialisez le mot de passe."),
        "reset_password_message": MessageLookupByLibrary.simpleMessage(
            "Si le mot de passe réinitialisé?"),
        "restore_backup_confirm": MessageLookupByLibrary.simpleMessage(
            "AVERTISSEMENT: VOUS POUVEZ PERDRE DES DONNÉES\n\nLa restauration d\'une sauvegarde supprimera toutes les données actuellement stockées dans l\'application et les remplacera par les données de la sauvegarde."),
        "restore_from_backup":
            MessageLookupByLibrary.simpleMessage("Restaurer"),
        "restore_from_backup_warning":
            MessageLookupByLibrary.simpleMessage("AVERTISSEMENT"),
        "same_time_every_day": MessageLookupByLibrary.simpleMessage(
            "Utilisez la même heure tous les jours"),
        "save": MessageLookupByLibrary.simpleMessage("Sauvegarder"),
        "save_and_empty":
            MessageLookupByLibrary.simpleMessage("enregistrer et vider"),
        "save_confession":
            MessageLookupByLibrary.simpleMessage("Entrez la confession"),
        "saved": MessageLookupByLibrary.simpleMessage("Sauvé"),
        "select_language":
            MessageLookupByLibrary.simpleMessage("Choisir la langue"),
        "send_data":
            MessageLookupByLibrary.simpleMessage("envoyer des données"),
        "send_mail": MessageLookupByLibrary.simpleMessage("Envoyer un e-mail"),
        "set_reminder": MessageLookupByLibrary.simpleMessage("Nouveau rappel"),
        "settings": MessageLookupByLibrary.simpleMessage("Réglages"),
        "seven_day_review":
            MessageLookupByLibrary.simpleMessage("Sept jours d\'examen"),
        "share": MessageLookupByLibrary.simpleMessage("Partager"),
        "share_experience": m13,
        "share_gods_word": m14,
        "share_prayer_note": m15,
        "share_prayer_request": m16,
        "share_prayer_request_done": m17,
        "show_history":
            MessageLookupByLibrary.simpleMessage("Afficher l\'historique"),
        "show_in_current":
            MessageLookupByLibrary.simpleMessage("Montrer dans actuel"),
        "shown_elements":
            MessageLookupByLibrary.simpleMessage("Éléments affichés"),
        "small": MessageLookupByLibrary.simpleMessage("petit"),
        "soundcloud_button_info": MessageLookupByLibrary.simpleMessage(
            "Si vous y êtes invité, sélectionnez l\'option \"Listen in Browser\" ci-dessous."),
        "start_prayertime": MessageLookupByLibrary.simpleMessage(
            "Commencer le temps de prière"),
        "stimuli_by_category":
            MessageLookupByLibrary.simpleMessage("Topos par catégorie"),
        "stimulus_head": m18,
        "stimulus_intro": MessageLookupByLibrary.simpleMessage(
            "Au nom du Père et du Fils et du Saint-Esprit. Amen."),
        "stimulus_to_prayer":
            MessageLookupByLibrary.simpleMessage("Topos sur la prière"),
        "stimulus_to_prayer_sub": MessageLookupByLibrary.simpleMessage(
            "Des pensées qui conduisent à la prière"),
        "successfully_registred":
            MessageLookupByLibrary.simpleMessage("Vous êtes connectés."),
        "text": MessageLookupByLibrary.simpleMessage("Texte"),
        "title": MessageLookupByLibrary.simpleMessage("Titre"),
        "topics": MessageLookupByLibrary.simpleMessage("Thèmes"),
        "try_again": MessageLookupByLibrary.simpleMessage("Essayez à nouveau"),
        "unhighlight":
            MessageLookupByLibrary.simpleMessage("Pas plus de surligner"),
        "unlock": MessageLookupByLibrary.simpleMessage("Ouvrir"),
        "update_confession_text": MessageLookupByLibrary.simpleMessage(
            "Avec la dernière mise à jour, le cryptage des sujets de confession a été modifié. Un mot de passe est maintenant toujours requis. Si aucun mot de passe n\'a été défini avant la mise à jour, laissez le champ vide dans la boîte de dialogue suivante et cliquez simplement sur OK. Le mot de passe peut être (ré) défini dans le menu Paramètres, mais vous perdrez ainsi vos sujets de confession actuels."),
        "use_system_language": MessageLookupByLibrary.simpleMessage(
            "Utiliser la langue du système"),
        "view_code": MessageLookupByLibrary.simpleMessage("Afficher le code"),
        "week_overview":
            MessageLookupByLibrary.simpleMessage("Vue de la semaine"),
        "welcome_app_language_text": MessageLookupByLibrary.simpleMessage(
            "Pour commencer, choisis la langue de l\'application :"),
        "welcome_content_language_text": MessageLookupByLibrary.simpleMessage(
            "Maintenant choisis la langue du contenu :"),
        "welcome_intro": MessageLookupByLibrary.simpleMessage(
            "L\'application est disponible dans plusieurs langues. Tu peux en choisir maintenant, et tu pourras en changer plus tard dans les paramètres."),
        "welcome_title": MessageLookupByLibrary.simpleMessage(
            "Bienvenue dans l\'App2Heaven !"),
        "when": MessageLookupByLibrary.simpleMessage("Quand?"),
        "word": MessageLookupByLibrary.simpleMessage("Parole"),
        "word_format_error": MessageLookupByLibrary.simpleMessage(
            "Veuillez entrer une référence biblique valide (en format allemand). par exemple \'1. Petrus 2,3\' oder \'1. Petrus 2,4-6\'"),
        "word_of_god": MessageLookupByLibrary.simpleMessage("Parole de Dieu"),
        "word_reminder": m19,
        "word_saved": m20,
        "words": MessageLookupByLibrary.simpleMessage("Paroles"),
        "words_archive_sub": MessageLookupByLibrary.simpleMessage(
            "de tous les mots sauvegardés"),
        "words_info_paragraph": MessageLookupByLibrary.simpleMessage(
            "Dieu nous parle à travers l’Ecriture. Il se montre à nous tel qu’il est en vérité et nous laisse reconnaître des choses importantes sur notre vie. Nous ressentons souvent en lisant la Bible ou en écoutant les lectures à la messe “cette parole s’adresse à moi ! Elle me fait comprendre quelque chose d’important. Elle me montre quelque chose que je dois faire.” Il tient alors à nous de prendre en compte cette parole. “Mais efforcez-vous de la mettre en pratique, et ne vous contentez pas de l\'écouter, en vous abusant vous-mêmes par de faux raisonnements”(Jc 1, 22). Le risque est grand que nous oublions rapidement la parole entendue et que rien ne change dans notre vie. Mais si nous écoutons la parole et la mettons en pratique, nous tranformons notre vie et Dieu nous conduit sur sa route.\nCette fonction aide donc à mieux écouter Dieu. Note les paroles qui t’ont parlé. Reprends-les dans ta prière ou même en dehors. Ainsi en te les rappelant régulièrement tu les comprendras mieux. Elles t’accompagneront comme Jésus Lui-même t’accompagne. La parole pourra alors s’infiltrer dans ton coeur, rester en toi et porter du fruit.\nTu peux décider des paroles que tu veux voir immédiatement, de celles que tu veux ajouter et de celles que tu veux archiver. Dans la catégorie “toutes les paroles” tu trouveras également toutes les paroles que tu as archivées depuis déjà longtemps. Il est parfois intéressant de lire ces paroles dans leur ensemble, d’y découvrir un “fil rouge”, et de voir ainsi comme Dieu te mène à travers Sa parole."),
        "words_info_sub": MessageLookupByLibrary.simpleMessage(
            "La vie avec la Parole de Dieu"),
        "words_reminder_enabled": m21,
        "words_reminder_head": MessageLookupByLibrary.simpleMessage(
            "Laisse-toi rappeler la Parole de Dieu au quotidien !"),
        "words_reminder_no_current_words": MessageLookupByLibrary.simpleMessage(
            "Vous devez avoir une entrée dans «Paroles récentes» pour vous en souvenir."),
        "words_reminder_sub": MessageLookupByLibrary.simpleMessage(
            "à la Parole dans la vie quotidienne"),
        "write_text": MessageLookupByLibrary.simpleMessage("Écrire un texte"),
        "wrong_password":
            MessageLookupByLibrary.simpleMessage("mauvais mot de passe"),
        "wrong_password_text": MessageLookupByLibrary.simpleMessage(
            "Le mot de passe est incorrect, veuillez réessayer. (Vous pouvez réinitialiser votre mot de passe dans les paramètres, si vous l\'avez oublié.)"),
        "x_h_y_min": m22,
        "x_hours": m23,
        "x_minutes": m24,
        "yes": MessageLookupByLibrary.simpleMessage("Oui")
      };
}
