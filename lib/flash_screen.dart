import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/screens/initial_screen.dart';

import 'baseUtils/colors.dart';
import 'baseUtils/constants.dart';



class FlashScreen extends StatefulWidget {


  @override
  State<FlashScreen> createState() => FlashScreenState();
}

class FlashScreenState extends State<FlashScreen> {
  int widgetId = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:10),(){
      print("After 3 seconds");
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   InitialScreen()));
    });
    super.initState();
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
        body: Align(
          alignment: Alignment.center,
          child: Container(
            width: getDeviceWidthByPercentage(40, context) ,
            height: getDeviceHeightByPercentage(30, context) ,

            child: AnimatedSplashScreen(
              splashTransition: SplashTransition.fadeTransition,

              splash:Image.asset('assets/images/logo.png'),
              nextScreen: InitialScreen(),
            ),
          ),
        ),
      ),
    );
  }
}