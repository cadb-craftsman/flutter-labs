import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

import 'package:qrreader_app/src/domain/models/scan_model.dart';
import 'package:qrreader_app/src/presentation/bloc/scans_bloc.dart';
import 'package:qrreader_app/src/presentation/pages/maps_page.dart';
import 'package:qrreader_app/src/presentation/pages/directions_page.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  int indexPage = 0;

  final scanBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _callPage(indexPage),
      bottomNavigationBar: _buildBottonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _callPage(int indexPage) {
    switch (indexPage) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionsPage();
      default:
        return MapsPage();
    }
  }

  Widget _buildBottonNavigationBar() {
    return BottomNavigationBar(
      currentIndex: indexPage,
      onTap: (index) {
        setState(() {
          indexPage = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), label: 'Directions'),
      ],
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: () {
        _scanQR(context);
        setState(() {});
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  _scanQR(BuildContext context) async {
    String scanValue;

    try {
      scanValue = await BarcodeScanner.scan().toString();
    } catch (e) {
      scanValue = e.toString();
    }

    if (scanValue != null) {
      scanBloc.addScan(new ScanModel(valor: scanValue.toString()));
      //DBProvider.db.addRowScan(new ScanModel(valor: result));
    }

    /*
    String scanValue1 = 'https://fernando-herrera.com/';
    String scanValue2 = 'geo:40.724233047051705,-74.00731459101564';
    scanBloc.addScan(new ScanModel(valor: scanValue1));
    scanBloc.addScan(new ScanModel(valor: scanValue2));
    */
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Center(
        child: Text('QR Scanner'),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scanBloc.deleteAll();
            }),
      ],
    );
  }
}
