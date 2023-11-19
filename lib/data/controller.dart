import 'dart:developer';

import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
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
}
