import 'dart:convert';


import 'package:flutter/material.dart';

import 'customtab.dart';

class ParsingJson extends StatefulWidget {


  @override
  _ParsingJsonState createState() => _ParsingJsonState();
}

class _ParsingJsonState extends State<ParsingJson> {
  late Future<String> jsonString;
  late List _cards;
  late Map _data;
  int _initPosition = 1;

  @override
  void initState() {
    super.initState();
    jsonString = DefaultAssetBundle.of(context)
        .loadString("assets/products.json");
    // .then((d) {
    // _cards = json.decode(d);
    // setState(() => _data = _cards[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.kindacode.com/wp-content/uploads/2021/01/blue.jpg',
            ),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Tab View"),
          ),
          body: SafeArea(
              child: FutureBuilder(
                  future: jsonString,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Decode the JSON
                      Map newData = json.decode(snapshot.data.toString())[0];
                      List<dynamic> data = newData.entries.toList()[0].value;
                      return CustomTabView(
                        initPosition: _initPosition,
                        itemCount: data.length,
                        tabBuilder: (context, i) =>
                            Tab(text: "${data[i]['title']}",),
                        pageBuilder: (context, index){
                          var name = data[index]['title'];
                          List<dynamic> itemData = data[index][name];
                          return ListView.builder(
                            itemCount: itemData.length,
                            itemBuilder: (context,int i){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text("${itemData[i]['name']}",style: TextStyle(color: Colors.white),),
                                    SizedBox(width: 10,),
                                    Text("${itemData[i]['price']}",style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        onPositionChange: (index) {
                          // print('current position: $index');
                          // _initPosition = index;
                        },
                        onScroll: (position) => print('$position'), stub: widget,
                      );
                    }
                    return CircularProgressIndicator();
                  }
              )
          )
      ),
    );
  }
}