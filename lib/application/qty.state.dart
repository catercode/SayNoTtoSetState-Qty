import 'dart:developer';

import 'package:flutter/material.dart';

class QtyProvider extends ChangeNotifier {
  double _totalprice = 0;
  double get totalprice => _totalprice;

  int _totalQty = 0;
  int get totalQty => _totalQty;

  void increment({required int value, required double price}) {
    _totalQty = _totalQty + value;
    _totalprice = _totalQty * price;

    notifyListeners();
  }

  void decrement({required int value, required double price}) {
    if (_totalQty != 0) {
      _totalQty = _totalQty - value;
      _totalprice = _totalQty * price;
    }

    notifyListeners();
  }
}
