import 'dart:async';

import 'package:qrreader_app/src/domain/models/scan_model.dart';

class Validators {
  final validatorsGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sinks) {
    final scansModels = scans.where((element) => element.tipo == 'geo').toList();
    sinks.add(scansModels);
  });

  final validatorsWeb =
  StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
      handleData: (scans, sinks) {
        final scansModels = scans.where((element) => element.tipo == 'http').toList();
        sinks.add(scansModels);
      });
}
