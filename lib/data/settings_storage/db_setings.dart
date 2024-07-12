import 'package:focuzd/data/settings_storage/settings_vars.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class SettingsDataProvider {
  late Future<Isar> db;

  SettingsDataProvider() {
    db = openDB();
  }

  Future<void> edit(var changedVar, int whatChangedVar) async {
    final isar = await db;
    isar.writeTxn(() async {
      var isar = await db;
      var defaults = await isar.settingsVariables.get(1);
      switch (whatChangedVar) {
        case 1: // always on top
          defaults!.windowOnTop = changedVar;
          break;
        case 2: //requested rounds
          defaults!.requestedNumberOfSessions = changedVar;
          break;
        case 3: // break duration
          defaults!.selectedBreakDurationStored = changedVar;
          break;

        case 4: //work duration
          defaults!.selectedWorkDurationStored = changedVar;
          break;
        case 5: //long break
          defaults!.selectedLongBreakDuration = changedVar;
          break;

        default:
      }

      isar.settingsVariables.put(defaults!);
    });
  }

  Future<SettingsVariables> readVar() async {
    var isar = await db;
    var thesettings = await isar.settingsVariables.get(1);
    return thesettings!;
  }

  Future<dynamic> readSpecificVar(int wantToReadVar) async {
    var isar = await db;
    var thesettings = await isar.settingsVariables.get(1);
    switch (wantToReadVar) {
      case 1: // always on top
        var windowSettingVar = thesettings!.windowOnTop;
        return windowSettingVar;
      case 2: //requested rounds
        var requestedRoundsVar = thesettings!.requestedNumberOfSessions;
        return requestedRoundsVar;
      case 3: // break duration
        var breakDurationVar = thesettings!.selectedBreakDurationStored;
        return breakDurationVar;

      case 4: //work duration
        var workDurationVar = thesettings!.selectedWorkDurationStored;
        return workDurationVar;
      case 5: //long break
        var longBreakDurationVar = thesettings!.selectedLongBreakDuration;
        return longBreakDurationVar;

      default:
    }
  }

  Future<void> addTheDefaults() async {
    var isar = await db;
    isar.writeTxn(() async {
      final vars = SettingsVariables();
      vars.requestedNumberOfSessions = 4;
      vars.selectedBreakDurationStored = 5;
      vars.selectedLongBreakDuration = 15;
      vars.selectedWorkDurationStored = 25;
      vars.windowOnTop = false;

      isar.settingsVariables.put(vars);
    });
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([SettingsVariablesSchema],
          directory: dir.path, inspector: true);
    }

    return Future.value(Isar.getInstance());
  }
}
