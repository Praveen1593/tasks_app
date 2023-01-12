import 'package:flutter/material.dart';
import 'package:tasks_app/screens/youtube_home.dart';

import '../google_map.dart';
import 'alertdialog.dart';
import 'dropdown.dart';
import 'expandedsheet.dart';
import 'modalbottomsheet.dart';



class OthertasksScreen extends StatefulWidget {
  const OthertasksScreen({Key? key}) : super(key: key);

  @override
  OthertasksScreenState createState() => OthertasksScreenState();
}

class OthertasksScreenState extends State<OthertasksScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Modal Bottom Sheet Demo',
      home: Container(
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
            title: const Text('Common Tasks'),
            backgroundColor: Colors.indigo,
          ),
          body: Builder(
            builder: (context) {
              return Padding(

                padding: const EdgeInsets.only(left: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('DropDown'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  DropDownScreen()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('ShowBottomModelSheet'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  BottomsheetScreen()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('ExpandedModelSheet'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ExpandedSheetScreen()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('AlertDialog'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  AlertPage()));
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}