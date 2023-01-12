import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';


class ExpandedSheetScreen extends StatefulWidget {
  const ExpandedSheetScreen({Key? key}) : super(key: key);

  @override
  ExpandedSheetScreenState createState() => ExpandedSheetScreenState();
}

class ExpandedSheetScreenState extends State<ExpandedSheetScreen> {
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();
  int _contentAmount = 0;
  ExpansionStatus _expansionStatus = ExpansionStatus.contracted;
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
          title: Text('Expandable Bottom Sheet'),
          centerTitle: true,
        ),
        body: ExpandableBottomSheet(
          key: key,
          // optional
          // This will enable tap to toggle option on header.
          enableToggle: true,
          //required
          //This is the widget which will be overlapped by the bottom sheet.
          background: Container(
            color: Colors.deepPurpleAccent,
            child: Center(
              child: Text(
                'Background-'+ _expansionStatus.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          //required
          //This is the content of the bottom sheet which will be extendable by dragging
          expandableContent: Container(
            height: 500,
            color: Colors.green,
            child: Center(
              child: Text(
                'Content',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          //optional
          //This widget is sticking above the content and will never be contracted.
          persistentHeader: Container(
            color: Colors.blue,
            height: 40,
            child: Center(
              child: Text(
                'Header',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          //optional
          //This is a widget aligned to the bottom of the screen and stays there.
          persistentFooter: Container(
            color: Colors.red,
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      key.currentState!.expand();
                    }),
                IconButton(
                  icon: Icon(
                    Icons.cloud,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _expansionStatus =
                        key.currentState!.expansionStatus;
                  },
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      key.currentState!.contract();
                    }),
              ],
            ),
          ),
          //optional
          //The content extend will be at least this height.
          persistentContentHeight: 220,
          //optional

          onIsContractedCallback: () => print('contracted'),
          onIsExtendedCallback: () => print('expanded'),

          //optional; default: Duration(milliseconds: 250)
          //The durations of the animations.
          animationDurationExtend: Duration(milliseconds: 500),
          animationDurationContract: Duration(milliseconds: 250),

          //optional; default: Curves.ease
          //The curves of the animations.
          animationCurveExpand: Curves.bounceOut,
          animationCurveContract: Curves.ease,
        ),
      ),
    );
  }
}