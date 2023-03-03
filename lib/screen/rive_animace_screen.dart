import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class RiveAnimationScreen extends StatefulWidget {
  const RiveAnimationScreen({Key? key}) : super(key: key);

  @override
  State<RiveAnimationScreen> createState() => _RiveAnimationScreenState();
}

class _RiveAnimationScreenState extends State<RiveAnimationScreen> {
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle',autoplay: true);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: RiveAnimation.asset(
          "assets/animations/background.riv",
          /*controllers: [
            _controller
          ],*/
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          context.pop();
        },
        child: const Icon(
          Icons.arrow_back_rounded
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),*/
    );
  }
}


