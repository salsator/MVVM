import 'dart:convert';
import 'package:animace/mvvm/cat_fact.dart';
import 'package:http/http.dart' as http;


class WebService{

  Future<List<CatFact>> fetchCatFact() async {

    var headers = {
      'accept': 'application/json',
      'X-CSRF-TOKEN': 's0ConGX7P5yNmvSTGoRYlERaO17ai6Xx220MMEFl',
    };

    var url = Uri.parse('https://catfact.ninja/facts?limit=100');
    var response = await http.get(url, headers: headers);


    if(response.statusCode == 200) {
      print("podařilo se načíst data");
      final body = jsonDecode(response.body);
      print(response.body);

      final Iterable json = body["data"];

      return json.map((catFact) => CatFact.fromJson(catFact)).toList();

    } else {
      print("nepodařilo se načíst data");
      throw Exception("Unable to perform request!");
    }

  }

}