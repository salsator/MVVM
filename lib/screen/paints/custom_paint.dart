import 'package:animace/screen/paints/demo_painter.dart';
import 'package:flutter/material.dart';

class CustomPaints extends StatefulWidget {
  const CustomPaints({Key? key}) : super(key: key);

  @override
  State<CustomPaints> createState() => _CustomPaintsState();
}

class _CustomPaintsState extends State<CustomPaints> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: CustomPaint(
          painter: DemoPainter(),
          child: const Text("ahoj",style: TextStyle(color: Colors.black,backgroundColor: Colors.white ),textScaleFactor: 2,),
        ),
      )
    );
  }
}
