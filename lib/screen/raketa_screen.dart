import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RaketaScreen extends StatefulWidget {
  const RaketaScreen({Key? key}) : super(key: key);


  @override
  State<RaketaScreen> createState() => _RaketaScreenState();
}

class _RaketaScreenState extends State<RaketaScreen> with TickerProviderStateMixin {

  late Animation<Offset> animation;
  late AnimationController animationController;
  double bottomMargin = 60;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -1.2))
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

            AnimatedContainer(duration: const Duration(milliseconds: 1000),
              height: 150,
              width: 100,
              margin:  EdgeInsets.only(bottom: bottomMargin),
              child: Image.asset("assets/images/rocket3.png"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _button("Launch",1),
                _button("drop",2)


              ],
            ),


          ],
        )

    );
  }
  void _flyRocket() {
    setState(() {
      bottomMargin = 500;
    });
  }
  void _dropRocket()
  {
    setState(() {
      bottomMargin = 60;
    });
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
              _flyRocket();
                  break;
            case 2:
              _dropRocket();
              break;
            case 3:
              context.go("/menu");
              break;
            default:
              _flyRocket();
              break;
          }

        }, child: Text(text,
          style: const TextStyle( color: Colors.black,
            fontSize: 25
            )
    ), ));
  }
}

