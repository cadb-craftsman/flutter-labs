import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreader_app/src/domain/models/scan_model.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String mapBoxType = 'streets';
  MapController mapController = new MapController();

  @override
  Widget build(BuildContext context) {
    final ScanModel scanModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Coordenadas'),
          actions: [
            IconButton(
                icon: Icon(Icons.my_location),
                onPressed: () {
                  mapController.move(scanModel.getLatLong(), 10.0);
                }),
          ],
        ),
        body: _buildFlutterMap(scanModel),
        floatingActionButton: _buildFloatingButton(context));
  }

  Widget _buildFlutterMap(ScanModel scanModel) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(center: scanModel.getLatLong(), zoom: 10),
      layers: [
        _buildMap(),
        _buildBookMark(scanModel),
      ],
    );
  }

  TileLayerOptions _buildMap() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/' +
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1Ijoid29vd3JhbGUiLCJhIjoiY2toam5tMmhsMTMyNDJ6cDl6bHFnbXh5NiJ9.FutWics6KCJX9_uijnf37g',
          'id': 'mapbox.$mapBoxType' //streets, dark, light, outdoors, satellite
        });
  }

  MarkerLayerOptions _buildBookMark(ScanModel scanModel) {
    return MarkerLayerOptions(markers: [_buildMark(scanModel)]);
  }

  Marker _buildMark(ScanModel scanModel) {
    return Marker(
        width: 100.00,
        height: 100.00,
        point: scanModel.getLatLong(),
        builder: (context) {
          return Container(
              child: Icon(
            Icons.location_on,
            size: 70.0,
            color: Theme.of(context).primaryColor,
          ));
        });
  }

  FloatingActionButton _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        if (mapBoxType == 'streets') {
          mapBoxType = 'dark';
        } else if (mapBoxType == 'dark') {
          mapBoxType = 'light';
        } else if (mapBoxType == 'light') {
          mapBoxType = 'outdoors';
        } else if (mapBoxType == 'outdoors') {
          mapBoxType = 'satellite';
        } else if (mapBoxType == 'satellite') {
          mapBoxType = 'streets';
        }
        setState(() {
          print('mapBoxType: $mapBoxType');
        });
      },
    );
  }
}
