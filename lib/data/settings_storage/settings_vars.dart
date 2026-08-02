import 'dart:core';
import 'package:drift/drift.dart';
import 'package:focuzd/data/settings_storage/db_settings.dart';


class SettingsVariables extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get windowOnTop => boolean().withDefault(const Constant(false))();
  IntColumn get defaultNumberOfSessionsPerRound => integer().withDefault(const Constant(4))();
  IntColumn get defaultBreakDurationStored => integer().withDefault(const Constant(5))();
  IntColumn get defaultFocusDurationStored => integer().withDefault(const Constant(25))();
  IntColumn get defaultLongBreakDurationStored => integer().withDefault(const Constant(15))();
  BoolColumn get atWillStart => boolean().withDefault(const Constant(false))();
  IntColumn get periodofLongBreak => integer().withDefault(const Constant(4))(); // how many sessions to complete before a long break
}