import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrreader_app/src/pages/directions_page.dart';
import 'package:qrreader_app/src/pages/maps_page.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  int indexPage = 0;

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
      onPressed: _scanQR,
      backgroundColor: Theme
          .of(context)
          .primaryColor,
    );
  }

  _scanQR() async {
    print('Scan QR');
    dynamic result = '';
    try {
      result = await BarcodeScanner.scan();

      print(result.type); // The result type (barcode, cancelled, failed)
      print(result.rawContent); // The barcode content
      print(result.format); // The barcode format (as enum)
      print(result.formatNote);
    }catch(e){
      result = e.toString();
    }
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Center(
        child: Text('QR Scanner'),
      ),
      actions: [
        IconButton(icon: Icon(Icons.delete_forever), onPressed: () {}),
      ],
    );
  }
}
