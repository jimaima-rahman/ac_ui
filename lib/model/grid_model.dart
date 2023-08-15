import 'dart:ffi';

import 'package:flutter/material.dart';

class GridModel {
  Icon icons;
  Color color;
  GridModel(this.icons, this.color);
}

class Buttonmodel {
  int numbers;
  Buttonmodel(this.numbers);
}

class GaugeModel {
  Double temp;
  GaugeModel(this.temp);
}
