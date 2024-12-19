import 'package:flutter/material.dart';
import 'package:flutter_demo_rcda32/base.dart';

class PageTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //récupération des paramètres
    int num = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: Text("Page 2")),
      body: Column(
        children: [
          Text('PAGE 2', style: TextStyle(fontSize: 32)),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Back $num'))
        ],
      ),
    );
  }
}
