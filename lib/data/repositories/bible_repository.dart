import 'package:lumen/data/mappers/bible_mappers.dart';
import 'package:lumen/data/models/bible/bible_book.dart';
import 'package:lumen/data/models/bible/bible_verse.dart';
import 'package:lumen/data/models/bible/bible_version.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class BibleRepository {
  final Database db;

  BibleRepository(this.db);

  Future<List<BibleVersion>> getVersions() async {
    final result = await db.query('bible_versions');

    return result.map((e) => BibleVersion.fromMap(e)).toList();
  }

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

  Future<List<BibleBook>> getBooks(String version) async {
    final result = await db.rawQuery(
      '''
      SELECT DISTINCT book, book_abbrev
      FROM bible_verses
      where version_id = ?
      ORDER BY book
    ''',
      [version],
    );

    return result.map((e) {
      return BibleBook(
        name: bibleBookMap[e['book_abbrev']] ?? e['book_abbrev'] as String,
        abbrev: e['book_abbrev'] as String,
      );
    }).toList();
  }

  Future<int> getChaptersCount(version, book) async {
    final result = await db.rawQuery(
      '''
    SELECT COUNT(DISTINCT chapter) AS chapters
    FROM bible_verses
    WHERE book_abbrev = ?
    AND version_id = ?
    ''',
      [book, version],
    );

    if (result.isEmpty) return 0;

    return result.first['chapters'] as int;
  }
}
