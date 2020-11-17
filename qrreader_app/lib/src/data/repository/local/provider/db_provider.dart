import 'dart:io';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrreader_app/src/domain/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDataBase();
    return _database;
  }

  initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    final path = join(directory.path, 'ScansDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE scans('
          'id  INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT)');
    });
  }

  addScan(ScanModel scanModel) async {
    final db = await database;
    final result = await db.rawInsert("INSERT INTO scans (id, tipo, valor) "
        "VALUES(${scanModel.id}, '${scanModel.tipo}', '${scanModel.valor}')");

    return result;
  }

  addRowScan(ScanModel scanModel) async {
    final db = await database;
    final result = db.insert('scans', scanModel.toJson());
    return result;
  }

  Future<ScanModel> getRowScan(int id) async {
    final db = await database;
    final result = await db.query('scans', where: 'id=?', whereArgs: [id]);

    return result.isNotEmpty ? ScanModel.fromJson(result.first) : null;
  }

  Future<List<ScanModel>> getAllScan() async {
    final db = await database;
    final result = await db.query('scans');
    return result.isNotEmpty
        ? result.map((c) => ScanModel.fromJson(c)).toList()
        : [];
  }

  Future<List<ScanModel>> getScanByType(String type) async {
    final db = await database;
    final result = await db.rawQuery("SELECT * FROM scans WHERE tipo:'$type'");

    return result.isNotEmpty
        ? result.map((c) => ScanModel.fromJson(c)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel scanModel) async {
    final db = await database;
    final result = db.update('scans', scanModel.toJson(),
        where: 'id=?', whereArgs: [scanModel.id]);
    return result;
  }

  Future<int> deleteScan(ScanModel scanModel) async {
    final db = await database;
    final result = db.delete('scans', where: 'id=?', whereArgs: [scanModel.id]);
    return result;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final result = db.rawDelete('DELETE FROM scans');
    return result;
  }
}
