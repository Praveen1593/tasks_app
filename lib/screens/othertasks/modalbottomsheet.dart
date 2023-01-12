import 'package:flutter/material.dart';


class BottomsheetScreen extends StatefulWidget {
  const BottomsheetScreen({Key? key}) : super(key: key);

  @override
  BottomsheetScreenState createState() => BottomsheetScreenState();
}

class BottomsheetScreenState extends State<BottomsheetScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            title: const Text('Creating a Modal Bottom Sheet'),
            backgroundColor: Colors.black38,
          ),
          body: Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  child: Text('Show Modal Bottom Sheet'),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.share),
                              title: Text('Share'),
                            ),
                            ListTile(
                              leading: Icon(Icons.copy),
                              title: Text('Copy Link'),
                            ),
                            ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}