import 'dart:io';
import 'package:flutter/services.dart';
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

    print("DB PATH -> $path");

    // copiar la BD desde assets si no existe
    if (!await File(path).exists()) {
      final data = await rootBundle.load("assets/database/bible.db");
      final bytes = data.buffer.asUint8List();

      await File(path).writeAsBytes(bytes);
    }

    _database = await factory.openDatabase(path);

    return _database!;
  }
}
