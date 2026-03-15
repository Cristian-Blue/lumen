import 'package:lumen/data/models/sermon/sermon_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SermonRepository {
  final Database db;
  SermonRepository(this.db);

  Future<List<SermonModel>> getSermons() async {
    final result = await db.query('sermons');
    return result.map((e) => SermonModel.fromJson(e)).toList();
  }

  Future<bool> deleteSermon(int id) async {
    final result = await db.delete('sermons', where: 'id = ?', whereArgs: [id]);
    if (result == 0) return false;
    return true;
  }

  Future<void> updateSermon() async {}

  Future<bool> addSermon(
    String title,
    String author,
    String date,
    List<String> tags,
    String description,
    List<String> slides,
  ) async {
    final result = await db.insert('sermons', {
      'title': title,
      'author': author,
      'date': date,
      'tags': tags,
      'description': description,
    });
    if (result == 0) return false;
    for (int i = 0; i < slides.length; i++) {
      await db.insert('sermon_slides', {
        'sermon_id': result,
        'position': i,
        'content': slides[i],
        'type': 'text',
      });
    }
    return true;
  }
}
