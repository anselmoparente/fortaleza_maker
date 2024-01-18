import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:permission_handler/permission_handler.dart';

class Controller extends ChangeNotifier {
  final BluetoothManager _bluetoothManager = BluetoothManager.instance;

  final List<String> _p = ['0', '0', '0', '0'];
  List<String> get p => _p;

  final List<String> _i = ['0', '0', '0', '0'];
  List<String> get i => _i;

  final List<String> _d = ['0', '0', '0', '0'];
  List<String> get d => _d;

  double _velocity = 0.0;
  double get velocity => _velocity;

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

  void changeVelocity(double value) {
    _velocity = value;
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

  bool bluetoothStatus = false;
  List<BluetoothDevice> devices = [];

  void checkBluetooth() {
    print('state: ${_bluetoothManager.state}');
  }

  Future<void> searchDevices() async {
    _bluetoothManager.startScan(timeout: const Duration(seconds: 5));
    _bluetoothManager.scanResults.listen((event) {
      for (int i = 0; i < event.length; i++) {
        bool exists = false;

        for (BluetoothDevice device in devices) {
          if (event[i].address == device.address) exists = true;
        }

        if (exists == false) {
          devices.add(event[i]);
        }
      }
    });
  }

  void connectToDevice(BluetoothDevice device) {
    var connect = _bluetoothManager.connect(device);
  }
}
