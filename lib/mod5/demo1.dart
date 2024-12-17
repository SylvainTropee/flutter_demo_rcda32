import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo Layout',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent)),
        home: AppHomePage());
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenue sur cette sublime application !"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.indigo.shade300,
          child: Column(
            children: [
              Text('Colonne 1  - Ligne 1',
                  style:
                      TextStyle(color: Colors.pinkAccent.shade400, fontSize: 36)),
              SizedBox(height: 2500),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text('Colonne 1 - Ligne 2'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Colonne 1 - Ligne 3"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Colonne 1 - Ligne 3bis"),
                  ),
                ],
              ),
              FlexMachin()
            ],
          ),
        ),
      ),
    );
  }
}

class FlexMachin extends StatelessWidget {
  const FlexMachin({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Text("Texte du flex !"),
        Text("Texte du flex 2!")
      ],
    );
  }
}
