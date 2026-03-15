import 'package:lumen/data/models/song/song_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SongRepository {
  final Database db;

  SongRepository(this.db);

  Future<List<SongModel>> getSongs() async {
    final result = await db.query('songs');
    return result.map((e) => SongModel.fromMap(e)).toList();
  }

  Future<bool> deleteSong(int id) async {
    final result = await db.delete('songs', where: 'id = ?', whereArgs: [id]);
    if (result == 0) return false;
    return true;
  }

  Future<void> updateSong() async {}

  Future<bool> addSong(String title, String author, List<String> slides) async {
    final result = await db.insert('songs', {
      'title': title,
      'author': author,
      'created_at': DateTime.now().toIso8601String(),
    });
    if (result == 0) return false;
    for (int i = 0; i < slides.length; i++) {
      await db.insert('song_slides', {
        'song_id': result,
        'position': i,
        'content': slides[i],
        'type': 'text',
      });
    }
    return true;
  }
}
