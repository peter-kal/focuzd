import 'dart:core';
import 'package:isar/isar.dart';

part 'settings_vars.g.dart';

@collection
class SettingsVariables {
  Id id = Isar.autoIncrement;
  bool? windowOnTop;
  int? requestedNumberOfSessions;
  int? selectedBreakDurationStored;
  int? selectedWorkDurationStored;
  int? selectedLongBreakDuration;
}
