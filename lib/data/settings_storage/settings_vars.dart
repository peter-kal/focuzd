import 'dart:core';
import 'package:drift/drift.dart';
import 'package:focuzd/data/settings_storage/db_settings.dart';


class SettingsVariables extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get windowOnTop => boolean()();
  IntColumn get defaultNumberOfSessionsPerRound => integer()();
  IntColumn get defaultBreakDurationStored => integer()();
  IntColumn get defaultFocusDurationStored => integer()();
  IntColumn get defaultLongBreakDurationStored => integer()();
  BoolColumn get atWillStart => boolean().withDefault(const Constant(false))();
  IntColumn get periodofLongBreak => integer().withDefault(const Constant(4))(); // how many sessions to complete before a long break
}