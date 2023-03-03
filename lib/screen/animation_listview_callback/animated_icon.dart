
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAnimatedIcon extends StatefulWidget {
  final ValueChanged<bool> onChange;
   const CustomAnimatedIcon(this.onChange,{Key? key}) : super(key: key);

  @override
  State<CustomAnimatedIcon> createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
      
      
     Container(
       margin: const EdgeInsets.all(20),
       child: AnimatedRotation(
         curve: Curves.easeOutExpo,
         turns: turns,
         duration: const Duration(seconds: 1),
         child: GestureDetector(
           onTap: () {
             if (isClicked) {
               setState(() {
                 turns -= 1 / 4;
                 _controller.reverse();
                 isClicked = !isClicked;
                  widget.onChange(false);
               });
             } else {
               setState(() {
                 turns += 1 / 4;
                 _controller.forward();
                 isClicked = !isClicked;
                 widget.onChange(true);
               });
             }

           },
           child: AnimatedContainer(
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15.0),
                 color: Colors.black26,
                 boxShadow: [
                   BoxShadow(
                       blurRadius: 30,
                       offset: isClicked ? const Offset(20, -20) : const Offset(20, 20),
                       color: Colors.black),
                   BoxShadow(
                       blurRadius: 30,
                       offset: isClicked ? const Offset(-20, 20) : const Offset(-20, -20),
                       color: Colors.white10)
                 ]),
             duration: const Duration(seconds: 1),
             curve: Curves.easeOutExpo,
             child: SizedBox(
               height: 80,
               width: 80,
               child: Center(
                 child: AnimatedIcon(
                   icon: AnimatedIcons.list_view,
                   progress: _controller,
                   color: Colors.white,
                 ),
               ),
             ),
           ),
         ),
       ),
     );
  }
}
