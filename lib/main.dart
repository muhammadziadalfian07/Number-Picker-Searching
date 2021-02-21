import 'package:flutter/material.dart';
import 'package:number_picker_example/page_number_picker.dart';
import 'package:number_picker_example/serach_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("Page Number Picker"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageNumberPicker()));
              },
            ),
            RaisedButton(
              child: Text("Page Search"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchListPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
