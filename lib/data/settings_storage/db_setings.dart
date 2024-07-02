import 'package:focuzd/data/settings_storage/settings_vars.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class SettingsDataProvider {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> edit(SettingsVariables varS) async {
    var isar = await db;
    isar.settingsVariables.put(varS);
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
