import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';





class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  DropDownScreenState createState() => DropDownScreenState();
}

class DropDownScreenState extends State<DropDownScreen> {
  List categoryItemlist = [];

  Future getAllCategory() async {
    var baseUrl = "https://gssskhokhar.com/api/classes/";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemlist = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  var dropdownvalue;

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
        appBar: AppBar(
          title: const Text("DropDown List"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
              //  iconDisabledColor: Colors.black,
                iconEnabledColor: Colors.orange,
                dropdownColor: Colors.orange,
                icon: Icon(Icons.arrow_drop_down),

                hint: Text('chooseNumber'),
                items: categoryItemlist.map((item) {
                  return DropdownMenuItem(
                    value: item['ClassCode'].toString(),
                    child: Text(item['ClassName'].toString()),
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    dropdownvalue = newVal;
                  });
                },
                value: dropdownvalue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}