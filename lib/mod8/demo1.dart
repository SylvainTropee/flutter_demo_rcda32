import 'package:flutter/material.dart';
import 'package:flutter_demo_rcda32/mod8/page-1.dart';
import 'package:flutter_demo_rcda32/mod8/page-2.dart';


void main(){
  runApp(DemoRouting());
}

class DemoRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/page-1": (context) => PageOne(),
        "/page-2": (context) => PageTwo(),
      },
      initialRoute: '/page-1',
    );
  }
}
