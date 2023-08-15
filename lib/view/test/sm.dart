import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGaugePage extends StatefulWidget {
  @override
  _RadialGaugePageState createState() => _RadialGaugePageState();
}

class _RadialGaugePageState extends State<RadialGaugePage> {
  double sliderValue = 50.0;
  Color rangePointerColor = Colors.green;
  double temp = 24;

  void updateRangePointerColor() {
    if (temp < 22) {
      rangePointerColor = Colors.teal;
    } else if (temp < 30) {
      rangePointerColor = Colors.purple;
    } else {
      rangePointerColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radial Gauge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfRadialGauge(
              axes: [
                RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  startAngle: 180,
                  endAngle: 360,
                  minimum: 16,
                  maximum: 30,
                  radiusFactor: 1,
                  axisLineStyle: AxisLineStyle(
                      color: Color.fromARGB(21, 155, 39, 176),
                      thickness: 0.2,
                      thicknessUnit: GaugeSizeUnit.factor),
                  annotations: [
                    GaugeAnnotation(
                      widget: RichText(
                        text: TextSpan(
                            text: "${temp.toInt()}",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [TextSpan(text: '°C')]),
                      ),
                    )
                  ],
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: temp,
                      width: 30,
                      color: rangePointerColor,
                      enableAnimation: true,
                      enableDragging: true,
                    ),
                    MarkerPointer(
                      value: temp - 0.3,
                      markerOffset: 30,
                      markerWidth: 10,
                      markerHeight: 10,
                      color: rangePointerColor,
                      markerType: MarkerType.circle,
                    ),
                  ],
                  ranges: [
                    GaugeRange(
                      startValue: 16,
                      endValue: 70,
                      color: Colors.transparent,
                    )
                  ],
                ),
                RadialAxis(
                    showLabels: false,
                    showTicks: false,
                    startAngle: 360,
                    endAngle: 180,
                    minimum: 16,
                    maximum: 30,
                    radiusFactor: 1,
                    axisLineStyle: AxisLineStyle(
                        color: Color.fromARGB(9, 155, 39, 176),
                        thickness: 0.2,
                        thicknessUnit: GaugeSizeUnit.factor))
              ],
              enableLoadingAnimation: true,
              animationDuration: 1000,
            ),
            // FlutterGauge(
            //   handSize: 30,
            //   index: sliderValue,
            //   fontFamily: "Times",
            //   end: 100,
            //   number: Number.endAndCenterAndStart,
            //   hand: Hand.short,
            //   handColor: rangePointerColor,
            //   isCircle: true,
            //   counterStyle: TextStyle(fontSize: 20),
            //   counterAlign: CounterAlign.center,
            // ),
            SizedBox(height: 20),

            Slider(
              onChangeStart: (value) {},
              inactiveColor: const Color.fromARGB(77, 214, 36, 36),
              activeColor: Colors.black,
              min: 16,
              max: 30,
              value: temp,
              onChanged: (currenttemp) => setState(
                () {
                  temp = currenttemp;
                  updateRangePointerColor();
                },
              ),
            ),

            // Slider(
            //   value: sliderValue,
            //   min: 0,
            //   max: 100,
            //   onChanged: (value) {
            //     setState(() {
            //       sliderValue = value;
            //       updateRangePointerColor();
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
