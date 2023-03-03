
import 'package:animace/screen/animation_listview_callback/animated_icon.dart';
import 'package:animace/screen/animation_listview_callback/card_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);



  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}



class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {

  late ValueChanged<bool> onChange;
  bool verticalList = false;

@override
  void initState() {
    super.initState();
    onChange = (value){
      setState(() {
        verticalList = value;
      });
    };
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(


        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomAnimatedIcon(onChange),
      appBar: AppBar(
        leading:
          IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),

      body:CardList(verticalList),
    );
  }
}
