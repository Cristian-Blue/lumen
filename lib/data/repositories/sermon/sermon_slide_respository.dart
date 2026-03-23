import 'package:lumen/data/models/sermon/sermon_slide.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SermonSlideRespository {
  final Database db;

  SermonSlideRespository(this.db);

  Future<List<SermonSlide>> getSermonSlides(int sermonId) async {
    final result = await db.query(
      'sermon_slides',
      where: 'sermon_id = ?',
      whereArgs: [sermonId],
      orderBy: 'position ASC',
    );
    return result.map((e) => SermonSlide.fromJson(e)).toList();
  }
}
