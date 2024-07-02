import 'dart:core';
import 'package:isar/isar.dart';

part 'settings_vars.g.dart';

@collection
class SettingsVariables {
  Id id = Isar.autoIncrement;
  @ignore
  Duration selectedBreakDurationStored = Duration(minutes: 5);
  @ignore
  Duration selectedWorkDurationStored = Duration(minutes: 25);
  @ignore
  Duration selectedLongBreakDuration = Duration(minutes: 15);
  @ignore
  double requestedNumberOfSessions = 4;
}
