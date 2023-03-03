import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Rocket2Screen extends StatefulWidget {
  const Rocket2Screen({Key? key}) : super(key: key);

  @override
  State<Rocket2Screen> createState() => _Rocket2ScreenState();
}

class _Rocket2ScreenState extends State<Rocket2Screen>  with TickerProviderStateMixin{

  late Animation<Offset> animation;
  late AnimationController animationController;
  double width = 0;


  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<Offset>(begin: const Offset(0, 0), end:  Offset(width, -2.0))
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 500),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/vesmir_background.jpg"),
                fit: BoxFit.cover)
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [

            Container(
                padding: const EdgeInsets.only(top: 40, left: 30),
                alignment: Alignment.topLeft,
                child: _button("back", 3)),

            SlideTransition(
              position: animation,
              child: Container(
                height: 150,
                width: 100,
                margin:  const EdgeInsets.only(bottom: 50),
                child: Image.asset("assets/images/rocket3.png"),
               )

            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _button("right",4),
                    _button("left",5)
                  ],
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button("Launch",1),
                    _button("drop",2),


                  ],
                ),
              ],
            ),


          ],
        )

    );
  }

  Widget _button(String text, int volba){
    return Container(
        decoration: BoxDecoration(
            borderRadius:  const BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            border: Border.all(
              width: 5,
              color: Colors.blueAccent,
            )
        ) ,
        child: TextButton(onPressed: () {

          switch(volba){
            case 1:
              animationController.forward();
              break;
            case 2:
              animationController.reverse();
              break;
            case 3:
              context.go("/menu");
              break;
            case 4:
              setState(() {
                width = 1;
              });
              break;
            case 5:
             setState(() {
               width = -1;
             });
              break;
            default:
              animationController.forward();
              break;
          }

        }, child: Text(text,
            style: const TextStyle( color: Colors.black,
                fontSize: 25
            )
        ), ));
  }
}