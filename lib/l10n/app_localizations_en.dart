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
  String get playButtonTooltip => 'Plan';

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

  @override
  String get roundPlanningTitleBar => 'Round Plan';

  @override
  String get addSessionButton => 'Add Session';

  @override
  String get startButtonOnPlanning => 'Start';

  @override
  String get changeDurationLabel => 'Change Duration';

  @override
  String get selectSubjectLabel => 'Select a Subject';

  @override
  String get deleteSessionTooltip => 'Delete Session';

  @override
  String get tooltipTakeNotes => 'Take Notes';

  @override
  String get tooltipRoundProgressEnd => 'Round Progress:';
}
