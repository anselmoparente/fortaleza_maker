import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

class Controller extends ChangeNotifier {
  final flutterReactiveBle = FlutterReactiveBle();

  List<String> _p = ['0', '0', '0', '0'];
  List<String> get p => _p;

  List<String> _i = ['0', '0', '0', '0'];
  List<String> get i => _i;

  List<String> _d = ['0', '0', '0', '0'];
  List<String> get d => _d;

  void changeValueP({required int value, required int position}) {
    if (position >= 0 && position < _p.length) {
      _p[position] = value.toString();
      log("Lista após a atualização: $p");
    } else {
      log("Índice fora dos limites da lista.");
    }
    notifyListeners();
  }

  void changeValueI({required int value, required int position}) {
    _i[position] = value.toString();
    notifyListeners();
  }

  void changeValueD({required int value, required int position}) {
    _d[position] = value.toString();
    notifyListeners();
  }

  Future<void> checkPermissions() async {
    final statusLocation = await Permission.location.status;
    final statusScan = await Permission.bluetoothScan.status;
    final statusConnect = await Permission.bluetoothConnect.status;

    if (!statusLocation.isGranted) {
      await Permission.location.request();
    }
    if (!statusScan.isGranted) {
      await Permission.bluetoothScan.request();
    }
    if (!statusConnect.isGranted) {
      await Permission.bluetoothConnect.request();
    }
  }

  void searchDevices() async {
    flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).listen((device) {
      log(device.name);
    }, onError: (e) {
      log(e.toString());
    });
  }
}
