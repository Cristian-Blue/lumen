import 'dart:io';
import 'package:flutter/services.dart';
import 'package:lumen/core/database/tables.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  DatabaseService._();
  static final DatabaseService instance = DatabaseService._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    sqfliteFfiInit();
    final factory = databaseFactoryFfi;

    final dbPath = await factory.getDatabasesPath();

    // asegurarse de que la carpeta exista
    await Directory(dbPath).create(recursive: true);

    final path = join(dbPath, "bible.db");

    // copiar la BD desde assets si no existe
    if (!await File(path).exists()) {
      final data = await rootBundle.load("assets/database/bible.db");
      final bytes = data.buffer.asUint8List();

      await File(path).writeAsBytes(bytes);
    }

    _database = await factory.openDatabase(path);
    await _createTables(_database!);

    return _database!;
  }

  Future<void> _createTables(Database db) async {
    await db.transaction((txn) async {
      await txn.execute(Tables.createVersions);
      await txn.execute(Tables.createVerses);
      await txn.execute(Tables.createIndexReference);
      await txn.execute(Tables.createSong);
      await txn.execute(Tables.createSongSlide);
      await txn.execute(Tables.createSongSlidesIndex);
      await txn.execute(Tables.createSermons);
      await txn.execute(Tables.createSermonSlide);
      await txn.execute(Tables.createSermonSlidesIndex);
    });
  }
}
