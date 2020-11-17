import 'dart:async';

import 'package:qrreader_app/src/data/repository/local/provider/db_provider.dart';
import 'package:qrreader_app/src/domain/models/scan_model.dart';
import 'package:qrreader_app/src/presentation/bloc/validators.dart';

class ScansBloc with Validators{
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    getScans();
  }

  final _scanStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scanStreamControllerGeo => _scanStreamController.stream.transform(validatorsGeo);
  Stream<List<ScanModel>> get scanStreamControllerWeb => _scanStreamController.stream.transform(validatorsWeb);

  dispose() {
    _scanStreamController?.close();
  }

  getScans() async {
    _scanStreamController.sink.add(await DBProvider.db.getAllScan());
  }

  addScan(ScanModel scanModel) async{
    await DBProvider.db.addRowScan(scanModel);
    getScans();
  }

  deleteScan(ScanModel scanModel) async {
    await DBProvider.db.deleteScan(scanModel);
    getScans();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScan();
    getScans();
  }
}
