import 'package:animace/mvvm/cat_fact.dart';
import 'package:animace/mvvm/web_service.dart';
import 'package:flutter/material.dart';

class CatFactListViewModel extends ChangeNotifier {

  List<CatViewModel> catFacts = <CatViewModel>[];

  Future<void> fetchCatFacts() async {

    final results =  await WebService().fetchCatFact();
    catFacts = results.map((item) => CatViewModel(catFact: item)).toList();

    notifyListeners();

  }

}

class CatViewModel {

  final CatFact catFact;

  CatViewModel({required this.catFact});

  String get text {
    return catFact.text;
  }

  int get length {
    return catFact.length;
  }

}