
import 'package:animace/mvvm/cat_list_view_model.dart';
import 'package:animace/mvvm/list_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatView extends StatefulWidget {

  const CatView({Key? key}) : super(key: key);

  @override
  State<CatView> createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {

  @override
  Widget build(BuildContext context) {

    final vm = CatFactListViewModel();
      //vm.fetchCatFacts();



    return ChangeNotifierProvider(
      create: (context) => CatFactListViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kočičí fakta"),
        ),
        body: FutureBuilder(
            future: vm.fetchCatFacts() ,
            builder: (BuildContext, snapshot){

             return ListBulder(catFacts: vm.catFacts);

        }),

      )
    );
  }
}
