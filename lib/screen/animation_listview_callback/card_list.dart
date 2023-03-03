import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
final bool verticalList;
  const CardList(this.verticalList,
      {Key? key}) : super(key: key);



  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  int _index = 0;




  List imgList = [
    Image.asset('assets/images/coffee/coffee1.jpg'),
    Image.asset('assets/images/coffee/coffee2.jpeg'),
    Image.asset("assets/images/coffee/coffee3.jpeg"),
    AspectRatio(aspectRatio: 1.4,
        child: Image.asset("assets/images/coffee/coffee4.jpg",
          fit: BoxFit.fitWidth,
        ),
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding:  const EdgeInsets.only(top: 20,left: 10, right: 10),
        child: AnimatedContainer(
          alignment: Alignment.topCenter,
            width:  widget.verticalList? 300 :500,
            height:  widget.verticalList? 450 : 300,


            duration: const Duration(milliseconds: 500),
            child: PageView.builder(

              scrollDirection: widget.verticalList? Axis.vertical: Axis.horizontal,
              itemCount: imgList.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  alignment: Alignment.center,
                  scale: i == _index ? 1 : 0.9,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                            imgList[i],

                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Text(
                                  "Card ${i + 1}",
                                  style: const TextStyle(fontSize: 32),
                                ),
                              ),
                            ),

                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
