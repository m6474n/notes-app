import 'dart:io';

import 'package:notes_app/notesModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteDatabase {
  static late Database _db;

//  initialize database

  static Future initializeDatabase() async {
    Directory applicationDirectory = await getApplicationCacheDirectory();

    String databasePath = "${applicationDirectory.path}notes.db";
    _db = await openDatabase(databasePath, version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, description TEXT, time INTEGER)');
    });
  }

  // Get Data from Database

static Future<List<NotesModel>> getDataFromDatabase()async {
  final result =   await _db.query("Notes");
  List<NotesModel> notesModel = result.map((e) => NotesModel.fromJson(e)).toList();
  return notesModel;
}

    // Insert Data

  static Future insertData(NotesModel model)async{
final result = await  _db.insert("Notes", model.toJson());
  print(result);
  }

}
