
import 'package:animace/mvvm/cat_list_view_model.dart';
import 'package:flutter/material.dart';

class ListBulder extends StatefulWidget {
  const ListBulder({Key? key, required this.catFacts}) : super(key: key);

  final List<CatViewModel> catFacts;

  @override
  State<ListBulder> createState() => _ListBulderState();
}

class _ListBulderState extends State<ListBulder> {
  int _index = 0;



  @override
  Widget build(BuildContext context) {

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width-10,

            child: PageView.builder(
                scrollDirection: Axis.vertical,
              itemCount: widget.catFacts.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _index = index),

              itemBuilder: (_, i) {

                final catFact = widget.catFacts[i];

                return Transform.scale(
                  alignment: Alignment.center,
                  scale: i == _index ? 1 : 0.9,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:10),
                            child: Text(
                              "fakt  ${i+1}",
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              " ${catFact.text}",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.topRight,
                            child: Text(
                              "délka: ${catFact.length}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
  }
}
