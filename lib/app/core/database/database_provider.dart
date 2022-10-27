import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider databaseProvider = DatabaseProvider();
  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase();

    return _database!;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "nasa_image.db");
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: createTables,
    );

    return database;
  }

  void createTables(Database database, int version) async {
    await database.execute("""
      CREATE TABLE image (
        id TEXT PRIMARY KEY,
        title TEXT,
        location TEXT,
        description TEXT,
        image_url TEXT
      );"""
    );

    await database.execute("""
      CREATE TABLE image_gallery (
        master_image_id TEXT,
        image_url TEXT,
        FOREIGN KEY(master_image_id) REFERENCES image(id)
      );
    """);

    await database.execute("""
      CREATE TABLE favorites (
        image_id TEXT,
        FOREIGN KEY(image_id) REFERENCES image(id)
      );
    """);
  }
}