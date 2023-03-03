class CatFact{

  final String text;
  final int length;

  CatFact({required this.text, required this.length});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
        text: json["fact"],
        length: json["length"]
    );
  }

}