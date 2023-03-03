import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    Widget _widget(String cesta, String nazev, IconData icon){
      return Container(
        margin: const EdgeInsets.only(top: 20,bottom: 10,left: 30, right: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: TextButton(
          onPressed: () {
            context.go(cesta);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(nazev,style: Theme.of(context).textTheme.bodyMedium,),
                ),
                Icon(color: Colors.lightBlueAccent.shade100,icon),
              ],
            ),
          ),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text("Animace a hry"),
      ),

      body: Center(
        child: ListView(

            children: [


              _widget("/menu/mvvm", "MVVM", Icons.architecture),
              _widget("/menu/drag", "Drag image", Icons.drafts),
              _widget("/menu/paint", "Custom Paint", Icons.format_paint),
              _widget("/menu/drawer", "Drawer Animace", Icons.menu),
              _widget("/menu/textAnimated", "Animace textu // dodělat", Icons.rotate_90_degrees_ccw),
              _widget("/menu/rive", "Rive animace", Icons.animation),
              _widget("/menu/raketa2", "Rocket 2.0", Icons.rocket),
              _widget("/menu/raketa", "Rocket", Icons.rocket),
            ],

        ),
      ),
    );
  }
}


