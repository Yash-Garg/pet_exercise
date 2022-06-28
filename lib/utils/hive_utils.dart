import 'package:hive/hive.dart';

class HiveUtils {
  static const String dbName = 'pet-db';
  static const String mediaKey = 'media-url';

  static Future<void> saveToDb(String url) async {
    final box = await Hive.openBox(dbName);
    box.put(mediaKey, url);
  }
}
