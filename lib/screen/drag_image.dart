import 'package:flutter/material.dart';

class DragImage extends StatefulWidget {
  const DragImage({Key? key}) : super(key: key);

  @override
  State<DragImage> createState() => _DragImageState();
}

class _DragImageState extends State<DragImage> {



  List accept = [
  false,
    false,
  false,
 false,
 false,
  false,
  ];

  List barvy = [
    Colors.red,
    Colors.brown,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
    Colors.green,
  ];

  List ovoce = [
    Image.asset("assets/images/fruit/apple.png"),
    Image.asset("assets/images/fruit/coconut.png"),
    Image.asset("assets/images/fruit/grapes.png"),
    Image.asset("assets/images/fruit/lemon.png"),
    Image.asset("assets/images/fruit/orange.png"),
    Image.asset("assets/images/fruit/watermelon.png"),
  ];

  List<Widget> draggables = [];
  List<Widget> targets = [];

  @override
  void initState() {
    super.initState();
    getDragable();
    getTarget();
    targets.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: draggables),
            Column(children: targets),
          ],
        ),
      ),
    );
  }

  void getTarget() {
    for (int i = 0; i < ovoce.length; i++) {
      targets.add(
        DragTarget(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Center(
                child: accept[i]
                    ? Container(
                        height: 100,
                        width: 100,
                        color: Colors.green,
                        child: const Center(
                          child: Text(
                            "Správně",
                          ),
                        ),
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        color: barvy[i],
                      ));
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (dynamic data) {
            setState(() {
              if (data == barvy[i]) {
                accept[i] = true;
              } else {
                accept[i] = false;
              }
            });
          },
        ),
      );
    }
  }

  void getDragable() {
    for (int i = 0; i < ovoce.length; i++) {
      draggables.add(Draggable(
        data: barvy[i],
        childWhenDragging: Container(
          height: 100,
          width: 100,
        ),
        feedback: Container(height: 100, width: 100, child: ovoce[i]),
        child: accept[i]
            ? Container()
            : Container(
          height: 100,
          width: 100,
          child: ovoce[i],
        )
      ));
    }
  }
}
