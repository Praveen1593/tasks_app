import 'package:flutter/material.dart';
import 'package:tasks_app/screens/pushnotification/pushnotify_screen.dart';
import 'package:tasks_app/screens/tabview.dart';
import 'package:tasks_app/screens/youtube_home.dart';

import 'google_map.dart';


class CommonScreen extends StatefulWidget {
  const CommonScreen({Key? key}) : super(key: key);

  @override
  CommonScreenState createState() => CommonScreenState();
}

class CommonScreenState extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,

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
              return
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [


                    ElevatedButton(
                      child: Text('Google Api'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MapSample()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('Youtube Api'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  YoutubeScreen()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('Push Notification'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  PushNotificationScreen()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('Tab Bar'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ParsingJson()));
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