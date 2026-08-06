// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get mainPage => 'Κύρια Σελίδα';

  @override
  String get settingsPage => 'Ρυθμίσεις';

  @override
  String get backArrowTooltip => 'Πήγαινε Πίσω';

  @override
  String get minutes => 'Λεπτά';

  @override
  String get reset2Default => 'Επαναφορά στα προεπιλεγμένα';

  @override
  String get alwaysOnTopOption => 'Window Always On Top';

  @override
  String get alwaysOnTopOptionDescription =>
      'Κάνει το παράθυρο να είναι πάνω από άλλα παράθυρα';

  @override
  String get playButtonTooltip => 'Ξεκίνα';

  @override
  String get resumeButtonTooltip => 'Συνέχισε';

  @override
  String get pauseButtonTooltip => 'Παύσε';

  @override
  String get resetSessionButtonTooltip => 'Επανάφερε';

  @override
  String get nextSessionButtonTooltip => 'Επόμενο';

  @override
  String get workTimeLabel => 'Χρόνος Συγκέντρωσης';

  @override
  String get breakTimeLabel => 'Χρόνος Διάλειμματος';

  @override
  String get longBreakTimeLabel => 'Χρόνος Μεγάλου Διάλειμματος';

  @override
  String get numberLabelSettings => 'Ακέραιος';

  @override
  String get roundsLabelSettings => 'Αριθμός Session';

  @override
  String get periodLB => 'Συχνότητα Μεγ. Διάλειμ.';

  @override
  String get manualStart => 'Χειροκίνητη Εκκίνηση';

  @override
  String get infoManualStart =>
      'Αν ενεργοποιηθεί, οι χρόνοι συγκέντρωσης θα ξεκινάνε χειροκίνητα.';

  @override
  String get infoBoxTitleSettings => 'Προσοχή';

  @override
  String get infoBoxContentSettings =>
      'Λόγω προβλημάτων, οι ρυθμίσεις του χρήστη επαναφέρθηκαν στις προεπιλεγμένες στην v2.0. Αυτό ΔΕΝ θα ξαναγίνει στις επόμενες εκδόσεις.';
}
