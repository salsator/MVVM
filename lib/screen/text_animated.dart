
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextAnimated extends StatefulWidget {
  const TextAnimated({Key? key}) : super(key: key);

  @override
  State<TextAnimated> createState() => _TextAnimatedState();
}

class _TextAnimatedState extends State<TextAnimated> with TickerProviderStateMixin {


  late final AnimationController _controller = AnimationController(vsync: this,
  duration: const Duration(seconds: 10) )..repeat();


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          context.pop();
        },
        child: const Icon(
            Icons.arrow_back_rounded
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            child: const FlutterLogo(
              size: 100,),
            builder: (BuildContext context, Widget? child)
            {
              return Transform.rotate(
                  angle: _controller.value * 2.0* math.pi,
                child: child
              );
            }
        ),
      ),
    );
  }

}
