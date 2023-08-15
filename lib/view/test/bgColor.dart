import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(ColorChangeApp());
}

class ColorChangeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Change App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorChangePage(),
    );
  }
}

class ColorChangePage extends StatefulWidget {
  @override
  _ColorChangePageState createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Color _containerColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _changeColor(double value) {
    setState(() {
      _containerColor = Color.lerp(Colors.blue, Colors.green, value)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            color: _containerColor,
          ),
          SizedBox(height: 20),
          Slider(
            value: _controller!.value,
            onChanged: (double value) {
              _controller!.value = value;
              _changeColor(value);
            },
          ),
          SizedBox(height: 20),
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 1,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  thicknessUnit: GaugeSizeUnit.factor,
                  color: _containerColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
