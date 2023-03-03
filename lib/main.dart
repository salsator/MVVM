import 'package:animace/mvvm/view.dart';
import 'package:animace/screen/animation_listview_callback/drawer_screen.dart';
import 'package:animace/menu_screen.dart';
import 'package:animace/screen/drag_image.dart';
import 'package:animace/screen/paints/custom_paint.dart';
import 'package:animace/screen/raketa_screen.dart';
import 'package:animace/screen/rive_animace_screen.dart';
import 'package:animace/screen/rocket_2.0_screen.dart';
import 'package:animace/screen/text_animated.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       MaterialApp.router(
         routerConfig: router(),
         debugShowCheckedModeBanner: false,

           theme: ThemeData(
         brightness: Brightness.dark,
         primaryColor: Colors.white70,
         accentColor: Colors.blueAccent.shade100,
         fontFamily: 'Georgia',
         textTheme: const TextTheme(
           headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
           headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
           bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
         ),
       )
       );

  }
}


GoRouter router() {
  return GoRouter(
    initialLocation: '/menu',
    routes: [
      GoRoute(
          path: '/menu',
          builder: (context, state) =>  const MenuScreen(),
          routes: [
            GoRoute(
              path: 'raketa',
              builder: (context, state) =>  const RaketaScreen(),
            ),
            GoRoute(
              path: 'raketa2',
              builder: (context, state) =>  const Rocket2Screen(),
            ),
            GoRoute(
              path: 'rive',
              builder: (context, state) =>  const RiveAnimationScreen(),
            ),
            GoRoute(
              path: 'textAnimated',
              builder: (context, state) =>  const TextAnimated(),
            ),
            GoRoute(
              path: 'drawer',
              builder: (context, state) =>  const DrawerScreen(),
            ),
            GoRoute(
              path: 'paint',
              builder: (context, state) =>  const CustomPaints(),
            ),
            GoRoute(
              path: 'drag',
              builder: (context, state) =>  const DragImage(),
            ),
            GoRoute(
              path: 'mvvm',
              builder: (context, state) =>  const CatView(),
            ),

          ]),
    ],
  );
}