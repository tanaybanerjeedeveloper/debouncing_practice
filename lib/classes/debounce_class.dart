import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int milliSeconds;
  VoidCallback? action;
  Timer? timer;

  Debounce({this.milliSeconds = 500});

  void run(VoidCallback action) {
    if (timer?.isActive ?? false) timer?.cancel();
    timer = Timer(Duration(milliseconds: milliSeconds), action);
  }

  void dispose() => timer?.cancel();
}
