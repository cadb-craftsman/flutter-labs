import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreader_app/src/domain/models/scan_model.dart';
import 'package:qrreader_app/src/presentation/bloc/scans_bloc.dart';
import 'package:qrreader_app/src/utils/utils.dart';

class DirectionsPage extends StatelessWidget {
  final scanBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    scanBloc.getScans();

    return StreamBuilder<List<ScanModel>>(
      stream: scanBloc.scanStreamControllerWeb,
      builder: (context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No existen Scans'),
          );
        }

        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                child: _buildListTile(context, scans[index]),
                onDismissed: (direction) {
                  scanBloc.deleteScan(scans[index]);
                  //DBProvider.db.deleteScan(scans[index]);
                }));
      },
    );
  }

  Widget _buildListTile(BuildContext context, ScanModel scanModel) {
    return ListTile(
      leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor),
      title: Text(scanModel.valor),
      trailing: Icon(Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor),
      onTap: () {
        if (Platform.isIOS) {
          Future.delayed(Duration(milliseconds: 750), () {
            launchURL(context, scanModel);
          });
        } else {
          launchURL(context, scanModel);
        }
      },
    );
  }
}
