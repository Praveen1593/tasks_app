import 'package:flutter/cupertino.dart';


getDeviceWidthByPercentage( val, context ){
  return MediaQuery.of(context).size.width *(val/100);
}
getDeviceHeightByPercentage( val, context ){
  return MediaQuery.of(context).size.height *(val/100);
}
class Constants {
  //
  static const String API_KEY = 'AIzaSyDDkzzuaIF3cYThVhddPhWWZcYcRiIfwiE';
}