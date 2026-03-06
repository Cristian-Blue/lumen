import 'package:lumen/data/mappers/bible_mappers.dart';
import 'package:lumen/data/models/bible/bible_book.dart';
import 'package:lumen/data/models/bible/bible_verse.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class BibleRepository {
  final Database db;

  BibleRepository(this.db);

  Future<List<BibleVerse>> getChapter({
    required String version,
    required String book,
    required int chapter,
  }) async {
    final result = await db.query(
      'bible_verses',
      where: 'version_id=? AND book_abbrev=? AND chapter=?',
      whereArgs: [version, book, chapter],
      orderBy: 'verse',
    );

    return result.map((e) => BibleVerse.fromMap(e)).toList();
  }

  Future<BibleVerse?> getVerse({
    required String version,
    required String book,
    required int chapter,
    required int verse,
  }) async {
    final result = await db.query(
      'bible_verses',
      where: 'version_id=? AND book_abbrev=? AND chapter=? AND verse=?',
      whereArgs: [version, book, chapter, verse],
      limit: 1,
    );

    if (result.isEmpty) return null;

    return BibleVerse.fromMap(result.first);
  }

  Future<List<BibleBook>> getBooks() async {
    final result = await db.rawQuery('''
      SELECT DISTINCT book, book_abbrev
      FROM bible_verses
      ORDER BY book
    ''');

    return result.map((e) {
      return BibleBook(
        name: bibleBookMap[e['book_abbrev']] ?? e['book_abbrev'] as String,
        abbrev: e['book_abbrev'] as String,
      );
    }).toList();
  }
}
