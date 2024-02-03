// ignore_for_file: file_names

import 'package:path/path.dart';
import 'package:randomizer/Database/Models/Items.dart';
import 'package:randomizer/Database/Models/Listas.dart';
import 'package:sqflite/sqflite.dart';

List<Listas> allListas = [];

class RandomizerDB {
  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'randomizer.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE listas (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT NULL)");
        await db.execute(
            "CREATE TABLE items (id INTEGER PRIMARY KEY, listID INTEGER, title TEXT, description TEXT NULL, FOREIGN KEY (listID) REFERENCES listas(id) ON DELETE CASCADE ON UPDATE CASCADE )");
      },
      onConfigure: (db) async {
        return await db.execute('PRAGMA foreign_keys = ON');
      },
      version: 1,
    );
  }

  static Future<int> insertLista(Listas lista) async {
    Database database = await _openDB();

    return database.insert("listas", lista.toMap());
  }

  static Future<int> deleteLista(int id) async {
    Database database = await _openDB();

    return database.delete("listas", where: "id = ?", whereArgs: [id]);
  }

  static Future<int> updateLista(Listas lista) async {
    Database database = await _openDB();

    return database.update("listas", lista.toMap());
  }

  static Future<List<Listas>> readListas() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> listasMap = await database.query("listas");

    allListas = List.generate(
      listasMap.length,
      (index) => Listas(
        id: listasMap[index]['id'],
        title: listasMap[index]['title'],
        description: listasMap[index]['description'],
      ),
    );

    return allListas;
  }

  //Methods to create, read, update and delete items
  static Future<int> insertItem(Items item) async {
    Database database = await _openDB();

    return database.insert("items", item.toMap());
  }

  static Future<List<Items>> readItems(int listID) async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> itemsMap = await database.query(
      "items",
      where: "id = ?",
      whereArgs: [listID],
    );

    return List.generate(
      itemsMap.length,
      (index) => Items(
        id: itemsMap[index]['id'],
        listID: itemsMap[index]['listID'],
        title: itemsMap[index]['title'],
        description: itemsMap[index]['description'],
      ),
    );
  }

  static Future<int> updateItem(Items item) async {
    Database database = await _openDB();

    return database.update("items", item.toMap());
  }

  static Future<int> deleteItem(Items item) async {
    Database database = await _openDB();

    return database.delete("items", where: "id = ?", whereArgs: [item.id]);
  }
}
