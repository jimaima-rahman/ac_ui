import 'package:ac_ui/view/smart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  bool light = true;
  bool ac = true;
  bool tv = false;
  bool sound = false;

  // Color _color = Colors.red.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDABEE4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Text(
          "Hi,Dimest",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/pic.jpeg"),
                      fit: BoxFit.fitWidth)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        color: Colors.transparent,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bolt), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.graphic_eq), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Color(0xffE3D4EB),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
          child: Container(
            height: 700,
            width: 370,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "A total of 4 devices",
                    style: TextStyle(
                        color: Color(
                          0xffA38AA6,
                        ),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Living Room",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                            color: light ? Colors.red : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(10),
                        duration: Duration(milliseconds: 500),
                        height: 200,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.light,
                              color: light ? Colors.white : Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Smart",
                              style: TextStyle(
                                  color: light ? Colors.white54 : Colors.black,
                                  fontSize: 20),
                            ),
                            Text("Spotlight",
                                style: TextStyle(
                                    color:
                                        light ? Colors.white54 : Colors.black,
                                    fontSize: 20)),
                            SizedBox(
                              height: 30,
                            ),
                            Switch(
                              value: light,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  light = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Smart(),
                          ));
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                              color: ac
                                  ? Color.fromRGBO(11, 53, 239, 0.839)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(10),
                          duration: Duration(),
                          height: 200,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.card_travel_outlined,
                                color: ac ? Colors.white : Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Smart",
                                style: TextStyle(
                                    color: ac ? Colors.white54 : Colors.black,
                                    fontSize: 20),
                              ),
                              Text("AC",
                                  style: TextStyle(
                                      color: ac ? Colors.white54 : Colors.black,
                                      fontSize: 20)),
                              SizedBox(
                                height: 30,
                              ),
                              Switch(
                                value: ac,
                                activeColor: Colors.white,
                                onChanged: (bool value) {
                                  setState(() {
                                    ac = value;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                            color: tv
                                ? Color.fromARGB(179, 53, 195, 60)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(10),
                        duration: Duration(milliseconds: 500),
                        height: 200,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.tv,
                              color: tv ? Colors.white : Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Smart",
                              style: TextStyle(
                                  color: tv ? Colors.white54 : Colors.black,
                                  fontSize: 20),
                            ),
                            Text("TV",
                                style: TextStyle(
                                    color: tv ? Colors.white54 : Colors.black,
                                    fontSize: 20)),
                            SizedBox(
                              height: 30,
                            ),
                            Switch(
                              value: tv,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  tv = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AnimatedContainer(
                        decoration: BoxDecoration(
                            color: sound
                                ? Color.fromARGB(179, 209, 232, 79)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(10),
                        duration: Duration(milliseconds: 500),
                        height: 200,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.speaker_group_outlined,
                              color: sound ? Colors.white : Colors.black,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Smart",
                              style: TextStyle(
                                  color: sound ? Colors.white54 : Colors.black,
                                  fontSize: 20),
                            ),
                            Text("Speaker",
                                style: TextStyle(
                                    color:
                                        sound ? Colors.white54 : Colors.black,
                                    fontSize: 20)),
                            SizedBox(
                              height: 30,
                            ),
                            Switch(
                              value: sound,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  sound = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
