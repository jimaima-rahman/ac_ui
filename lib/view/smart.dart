import 'package:ac_ui/controller/grid_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Smart extends ConsumerStatefulWidget {
  const Smart({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SmartState();
}

class _SmartState extends ConsumerState<Smart> {
  bool power = false;
  double _value = 0.0;
  int speedIndex = 0;
  int currentSmart = 4;
  final Color firstColor = Colors.teal;
  final Color middleColor = Colors.deepPurple;
  final Color endColor = Colors.red;
  Color? changeColor(Color start, Color end, double ratio) {
    return Color.lerp(start, end, ratio);
  }

  @override
  Widget build(BuildContext context) {
    Color? currentColor = changeColor(
        _value <= 1 ? firstColor : middleColor,
        _value <= 1 ? middleColor : endColor,
        _value <= 1 ? _value : _value - 1);
    return Container(
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.1,
              0.5,
              0.8,
            ],
                colors: [
              currentColor!.withOpacity(0.2),
              currentColor.withOpacity(0.6),
              currentColor.withOpacity(0.9),
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleSpacing: 60,
              title: Text(
                "Smart AC",
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) => Row(children: [
                              GestureDetector(
                                onTap: () {
                                  return setState(() {
                                    currentSmart = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: currentSmart == index
                                          ? Colors.white
                                          : currentColor.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ref.watch(GridProvider)[index].icons,
                                ),
                              ),
                            ])),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 288,
                      height: 288,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(),
                        ],
                        color: Colors.white,
                      ),
                    ),
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
                              color: Color.fromARGB(9, 155, 39, 176),
                              thickness: 30,
                              thicknessUnit: GaugeSizeUnit.logicalPixel),
                          annotations: [
                            GaugeAnnotation(
                              widget: RichText(
                                text: TextSpan(
                                    text:
                                        "${(((_value / 2) + 1) * 15).toInt()}",
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
                              value: (((_value / 2) + 1) * 15),
                              width: 30,
                              color: currentColor,
                              enableAnimation: true,
                              enableDragging: true,
                            ),
                            MarkerPointer(
                              value: (((_value / 2) + 1) * 15) - 0.3,
                              markerOffset: 30,
                              markerWidth: 10,
                              markerHeight: 10,
                              color: currentColor,
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
                            minimum: 0,
                            maximum: 1,
                            radiusFactor: 1,
                            axisLineStyle: AxisLineStyle(
                                color: Color.fromARGB(9, 155, 39, 176),
                                thickness: 0.2,
                                thicknessUnit: GaugeSizeUnit.factor))
                      ],
                      enableLoadingAnimation: true,
                      animationDuration: 1000,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                        color: currentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              'Speed',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: speedIndex == index
                                                ? Colors.white
                                                : Colors.transparent,
                                            shape: CircleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    style: BorderStyle.solid,
                                                    color: const Color.fromARGB(
                                                        255, 195, 192, 192)))),
                                        onPressed: () {
                                          setState(() {
                                            speedIndex = index;
                                          });
                                        },
                                        child: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                            color: speedIndex == index
                                                ? Color.fromARGB(
                                                    108, 109, 117, 230)
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                        color: currentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Power',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: 'OFF',
                                      style: TextStyle(
                                        color: power
                                            ? Colors.white30
                                            : Colors.white,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '/',
                                            style: TextStyle(
                                                color: Colors.white30,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: 'ON',
                                            style: TextStyle(
                                              color: power
                                                  ? Colors.white
                                                  : Colors.white30,
                                            ))
                                      ]),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Switch(
                                    value: power,
                                    activeColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        power = value;
                                      });
                                    })
                              ],
                            ),
                          ]),
                    )
                  ],
                ),
                Container(
                  width: 370,
                  height: 90,
                  decoration: BoxDecoration(
                    color: currentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Temp',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("15°C",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 280,
                              child: Slider(
                                onChangeStart: (value) {},
                                inactiveColor: Colors.white30,
                                activeColor: Colors.white,
                                min: 0,
                                max: 2,
                                value: _value,
                                onChanged: (currenttemp) => setState(
                                  () {
                                    _value = currenttemp;
                                  },
                                ),
                              ),
                            ),
                            Text('30°C',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]),
            )),
      ),
    );
  }
}
