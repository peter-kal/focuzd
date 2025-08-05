// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mainPage => 'Main Page';

  @override
  String get settingsPage => 'Settings';

  @override
  String get backArrowTooltip => 'Go Back';

  @override
  String get minutes => 'Minutes';

  @override
  String get reset2Default => 'Reset to Default';

  @override
  String get alwaysOnTopOption => 'Window Always On Top';

  @override
  String get alwaysOnTopOptionDescription =>
      'Make the window always be on top of others';

  @override
  String get playButtonTooltip => 'Play';

  @override
  String get resumeButtonTooltip => 'Resume';

  @override
  String get pauseButtonTooltip => 'Pause';

  @override
  String get resetSessionButtonTooltip => 'Reset';

  @override
  String get nextSessionButtonTooltip => 'Next';

  @override
  String get workTimeLabel => 'Focus Time';

  @override
  String get breakTimeLabel => 'Break Time';

  @override
  String get longBreakTimeLabel => 'Long Break Time';

  @override
  String get numberLabelSettings => 'integer';

  @override
  String get roundsLabelSettings => 'Sessions per Round';
}
