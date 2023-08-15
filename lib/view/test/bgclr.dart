import 'package:flutter/material.dart';

class LinearGradientContainer extends StatefulWidget {
  const LinearGradientContainer({super.key});

  @override
  State<LinearGradientContainer> createState() =>
      _LinearGradientContainerState();
}

class _LinearGradientContainerState extends State<LinearGradientContainer> {
  double _value = 0.0;
  final Color _startColor = Colors.teal;
  final Color _middleColor = Colors.deepPurple;
  final Color _endColor = Colors.red;

  void _onSliderChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  Color? _changeColors(Color start, Color end, double ratio) {
    return Color.lerp(start, end, ratio);
  }

  @override
  Widget build(BuildContext context) {
    Color? currenColor = _changeColors(
        _value <= 1 ? _startColor : _middleColor,
        _value <= 1 ? _middleColor : _endColor,
        _value <= 1 ? _value : _value - 1);

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(24),
        color: currenColor,
        child: Row(
          children: [
            Text("${_value.toInt() + 16}"),
            Expanded(
              child: Slider(
                activeColor: Color.fromARGB(255, 57, 30, 104),
                inactiveColor: Colors.black12,
                min: 0,
                max: 2,
                value: _value,
                onChanged: _onSliderChanged,
              ),
            ),
            const Text("30"),
          ],
        ),
      ),
    );
  }
}
