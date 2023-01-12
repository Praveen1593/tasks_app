import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tasks_app/screens/payment_screen.dart';
import 'package:tasks_app/screens/youtube_home.dart';
import '../../baseUtils/constants.dart';
import '../baseUtils/colors.dart';
import 'common.dart';
import 'google_map.dart';
import 'home_screen.dart';
import 'othertasks/othertasks_screen.dart';






class InitialScreen extends StatefulWidget {


  @override
  State<InitialScreen> createState() => InitialScreenState();
}

class InitialScreenState extends State<InitialScreen> {
  int currentTabIndex = 0;
  List<BottomNavigationBarItem> bottomDoctorList = [];

  List<BottomModel> bottomItemList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bottomItemList.clear();
    bottomItemList.add(BottomModel(name:"Camera", icon:Icons.camera_alt));
    bottomItemList.add(BottomModel(name:"Map & Youtube", icon:Icons.map));
    bottomItemList.add(BottomModel(name:"Tasks", icon: Icons.task_alt));
    bottomItemList.add(BottomModel(name:"Payment", icon:Icons.payment));





  }
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
      print(currentTabIndex.toString() + "   -- Outside");
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.indigo
    ));
    return WillPopScope(
      onWillPop: (){
        if(currentTabIndex != 0){
          setState(() {
            currentTabIndex = 0;
          });
          return Future<bool>.value(false);
        }
        return Future<bool>.value(true);
      },

      child:Scaffold(
        resizeToAvoidBottomInset:false,
        body: Container(
          color: Colors.white,
          height: getDeviceHeightByPercentage(100, context),
          width: getDeviceWidthByPercentage(100, context),
          child: Column(
            children: [
              Container(
                height: getDeviceHeightByPercentage(91.3, context),
                padding: EdgeInsets.only(top: MediaQuery. of(context). viewPadding.top),
                child: Container(
                  //height: getDeviceHeightByPercentage(, context),
                  //padding: EdgeInsets.only(top: MediaQuery. of(context). viewPadding.top),
                  child: currentTabIndex == 1? CommonScreen():
                  currentTabIndex == 2?OthertasksScreen():
                  currentTabIndex == 3? PaymentPage():
                  HomePage(),
                ),
              ),
              Container(
                height: getDeviceHeightByPercentage(8.7, context),
                width: getDeviceWidthByPercentage(100, context),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                  )],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buildBottomBar(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildBottomBar(){
    List<Widget> listOfWidget = [];
    for( int index = 0 ; index < bottomItemList.length ; index++){
      listOfWidget.add(
          InkWell(
            onTap: (){
              setState(() {
                currentTabIndex = index;
                print(currentTabIndex.toString() + "   -- Outside");
              });
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              width: getDeviceWidthByPercentage(25, context),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //buildText('${cardCtr!.cardCount.value}', fontColor: Colors.white),
                        Icon(bottomItemList[index].icon,color: currentTabIndex== index?soulRed:Colors.white, size: index == currentTabIndex? 20:19,),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text('${bottomItemList[index].name}', style:TextStyle(fontSize:11, color: index == currentTabIndex?soulRed:Colors.white,), overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                  ),
                  index == currentTabIndex?Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: SizedBox(
                      width: getDeviceWidthByPercentage(15, context),
                      child: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                    ),
                  ):Container()
                ],
              ),
            ),
          )
      );
    }
    return listOfWidget;
  }

  BottomNavigationBarItem buildBottomItem(title, {icon, required bool menu, image}) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.indigo,
      icon: Column(
        children: <Widget>[
          icon != null ?SizedBox(
              width: 30,
              height: 30,
              child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(icon,
                      color: Colors.white, size: 15)
              )
          ):Image.asset('$image'),

        ],
      ),
      activeIcon: Column(
        children: <Widget>[
          icon != null ?SizedBox(
            width: 30,
            height: 30,
            child: Padding(
                padding: EdgeInsets.all(2),
                child: Icon(icon, color: Colors.red, size: 20)
            ),
          ):Image.asset('assets/images/procurement_icon_blue.png'),
        ],
      ),
      label: '$title',
    );
  }
}

class BottomModel{
  BottomModel( {this.name,this.icon, this.image});
  var name;
  var icon;
  var image;

  factory BottomModel.fromJson(Map<String, dynamic> json) => BottomModel(
    name: json["name"] == null ? null : json["name"],
    icon: json["icon"] == null ? null : json["icon"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "icon": icon == null ? null : icon,
    "image": image == null ? null : image,
  };
}