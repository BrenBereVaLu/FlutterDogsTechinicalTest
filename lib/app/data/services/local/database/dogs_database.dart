import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../domain/models/dogs/allDogs.dart';

class DogsDatabase {
  DogsDatabase._init();
  static final DogsDatabase instance = DogsDatabase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('dogs.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT NOT NULL
      )
    ''');
  }

  Future<void> insertDog(Alldogs dog) async {
    final db = await instance.database;
    await db.insert(
      'dogs',
      {
        'data': jsonEncode(dog.toJson())
      }, // Convierte a JSON y guarda como texto
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

Future<List<Alldogs>> fetchDogs() async {
  final db = await instance.database;
  final result = await db.query('dogs');

  List<Alldogs> dogsList = result.map((row) {
    final data = row['data'] as String;
    return Alldogs.fromJson(jsonDecode(data));
  }).toList();

  // Para depuración, imprimimos los resultados
  print("Dogs fetched from database: $dogsList");

  return dogsList;
}


  Future<void> deleteAllDogs() async {
    final db = await instance.database;
    await db.delete('dogs');
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
    }
  }
}
