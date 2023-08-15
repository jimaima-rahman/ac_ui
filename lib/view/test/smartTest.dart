import 'dart:ui';

import 'package:ac_ui/controller/grid_controller.dart';
import 'package:ac_ui/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class testfinal extends ConsumerStatefulWidget {
  const testfinal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _testfinalState();
}

class _testfinalState extends ConsumerState<testfinal> {
  bool power = false;
  double temp = 24;
  int speedIndex = 0;
  int currentSmart = 4;
  Color rangePointerColor = Color.fromARGB(255, 65, 15, 164);
  void updateRangePointerColor() {
    if (temp < 20) {
      rangePointerColor = Colors.teal;
    } else if (temp > 26) {
      rangePointerColor = Color.fromARGB(209, 234, 36, 21);
    } else {
      rangePointerColor = Color.fromARGB(255, 65, 15, 164);
    }
  }

  LinearGradient linear = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.1,
        0.5,
        0.8,
      ],
      colors: [
        Color.fromARGB(255, 175, 175, 233),
        Color.fromRGBO(100, 71, 187, 1),
        Color.fromARGB(255, 30, 54, 233),
      ]);
  void updateLinearGradient() {
    if (temp < 20) {
      linear = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.5,
            0.8,
          ],
          colors: [
            Color.fromARGB(255, 184, 246, 222),
            Color.fromRGBO(120, 203, 186, 1),
            Color.fromARGB(255, 18, 180, 158),
          ]);
      ;
    } else if (temp > 26) {
      linear = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.5,
            0.8,
          ],
          colors: [
            Color.fromARGB(255, 242, 207, 211),
            Color.fromRGBO(248, 61, 61, 0.82),
            Color.fromARGB(255, 232, 10, 58),
          ]);
    } else {
      linear = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.5,
            0.8,
          ],
          colors: [
            Color.fromARGB(255, 180, 180, 219),
            Color.fromRGBO(148, 118, 236, 1),
            Color.fromARGB(255, 176, 48, 236),
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(gradient: linear),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            titleSpacing: 60,
            title: Text(
              "Smart AC",
              style: TextStyle(color: Colors.black),
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
                                        : Colors.white38,
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
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(30, 0, 0, 0),
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
                                              backgroundColor:
                                                  speedIndex == index
                                                      ? Colors.white
                                                      : Colors.transparent,
                                              shape: CircleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      style: BorderStyle.solid,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              195,
                                                              192,
                                                              192)))),
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
                      color: Color.fromARGB(30, 0, 0, 0),
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
                              // ? Colors.white30
                              //               : Colors.white,
                              RichText(
                                text: TextSpan(
                                    text: 'OFF',
                                    style: TextStyle(
                                      color:
                                          power ? Colors.white30 : Colors.white,
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
                  color: Color.fromARGB(30, 0, 0, 0),
                  // Color.fromARGB(43, 0, 0, 0)),
                  // Color.fromARGB(69, 116, 50, 222),
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
                          Text("16°C",
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
                              min: 16,
                              max: 30,
                              value: temp,
                              onChanged: (currenttemp) => setState(
                                () {
                                  temp = currenttemp;
                                  updateRangePointerColor();
                                  updateLinearGradient();
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
    );
  }
}
