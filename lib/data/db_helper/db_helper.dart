import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static const String _kPrefsKey = 'saved_items';

  late SharedPreferences prefs;

  Future<void> initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  List<int> getSavedData() {
    final savedIds = prefs.getStringList(_kPrefsKey) ?? [];

    return savedIds.map(int.parse).toList();
  }

  Future<void> saveData(int id) async {
    final savedIds = prefs.getStringList(_kPrefsKey) ?? [];

    savedIds.add(id.toString());

    await prefs.setStringList(_kPrefsKey, savedIds);
  }

  bool getIsSave(String id) {
    final savedIds = prefs.getStringList(_kPrefsKey) ?? [];

    for (var element in savedIds) {
      if (element == id) {
        return true;
      }
    }

    return false;
  }

  Future<void> deleteData(int id) async {
    final deleteIds = prefs.getStringList(_kPrefsKey) ?? [];

    deleteIds.remove(id.toString());

    await prefs.setStringList(_kPrefsKey, deleteIds);
  }
}
