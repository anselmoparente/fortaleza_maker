import 'dart:convert';

import 'package:bluetooth_classic/bluetooth_classic.dart';
import 'package:bluetooth_classic/models/device.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

class Controller extends ChangeNotifier {
  final bluetoothClassic = BluetoothClassic();

  final List<String> _p = ['0', '0', '0', '0'];
  List<String> get p => _p;

  final List<String> _i = ['0', '0', '0', '0'];
  List<String> get i => _i;

  final List<String> _d = ['0', '0', '0', '0'];
  List<String> get d => _d;

  double _velocity = 0.0;
  double get velocity => _velocity;

  void changeValueP({required int value, required int position}) async {
    _p[position] = value.toString();
    notifyListeners();

    // if (await bluetoothManager.isConnected) {
    //   writeData();
    // }
  }

  void changeValueI({required int value, required int position}) async {
    _i[position] = value.toString();
    notifyListeners();

    // if (await bluetoothManager.isConnected) {
    //   writeData();
    // }
  }

  void changeValueD({required int value, required int position}) async {
    _d[position] = value.toString();
    notifyListeners();

    // if (await bluetoothManager.isConnected) {
    //   writeData();
    // }
  }

  void changeVelocity(double value) async {
    _velocity = value;

    // if (await bluetoothManager.isConnected) {
    //   writeData();
    // }
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

  List<Device> devices = [];
  bool isConnected = false;

  Future<void> searchDevices() async {
    // devices.clear();
    // bluetoothClassic.startScan();
    // bluetoothClassic.onDeviceDiscovered().listen((event) {
    //   if (!devices.contains(event)) {
    //     devices.add(event);
    //   }
    // });
    // await Future.delayed(const Duration(seconds: 5));
    // bluetoothClassic.stopScan();

    devices.clear();
    devices = await bluetoothClassic.getPairedDevices();
  }

  void writeData() async {
    late String message;

    List<String> auxP = [];
    for (String item in p) {
      auxP.add(item);
    }
    auxP.insert(2, '.');

    List<String> auxI = [];
    for (String item in i) {
      auxI.add(item);
    }
    auxI.insert(2, '.');

    List<String> auxD = [];
    for (String item in d) {
      auxD.add(item);
    }
    auxD.insert(2, '.');

    message =
        '${double.parse(auxP.join())}/${double.parse(auxI.join())}/${double.parse(auxD.join())}/$_velocity';

    List<int> bytes = utf8.encode(message).toList();
    // await bluetoothManager.writeData(bytes);
  }

  bool connectToDevice(Device device) {
    // bluetoothManager.connect(device);
    return true;
  }

  void disconnectToDevice() {
    // bluetoothManager.disconnect();
  }
}
