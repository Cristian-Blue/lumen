import 'package:lumen/data/models/song/song_slide.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SongSlideRepository {
  final Database db;

  SongSlideRepository(this.db);

  Future<List<SongSlide>> getSongsSlide() async {
    return [];
  }
}
