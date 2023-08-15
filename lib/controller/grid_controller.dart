import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/grid_model.dart';

class GridNotifier extends StateNotifier<List<GridModel>> {
  GridNotifier() : super([]) {
    state = [
      GridModel(Icon(Icons.alarm), Colors.white),
      GridModel(Icon(Icons.ac_unit_rounded), Colors.white),
      GridModel(Icon(Icons.wb_sunny_outlined), Colors.white),
      GridModel(Icon(Icons.water_drop_outlined), Colors.white),
    ];
  }
}

final GridProvider =
    StateNotifierProvider<GridNotifier, List<GridModel>>((ref) {
  return GridNotifier();
});

class Notifier extends StateNotifier<List<Buttonmodel>> {
  Notifier() : super([]) {
    state = [Buttonmodel(1), Buttonmodel(2), Buttonmodel(3)];
  }
}

final buttonProvider =
    StateNotifierProvider<Notifier, List<Buttonmodel>>((ref) {
  return Notifier();
});

// class TempNotifier extends StateNotifier<List<GaugeModel>> {
//   TempNotifier(): super([]){
// state = 
//   }
  
// }