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
        home: HomePage(
          title: "Démo widget de contenu",
        ));
  }
}

class HomePage extends StatelessWidget {
  String title;

  HomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: DemoForm(),
    );
  }
}

class DemoForm extends StatefulWidget {
  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  bool isOk = false;
  String radioValue = "";
  var formKey = GlobalKey<FormState>();

  String name = "";
  int age = 0;
  String bouffe = "";

  void updateRadioValue(String? newValue) {
    setState(() {
      radioValue = newValue!;
    });
  }

  String? validateName(value) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return "Le nom est obligatoire !";
    }
    if (value.length <= 2) {
      return "Veuillez saisir au moins 3 caractères !";
    }
    return null;
  }

  String? validateAge(value) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return "L'age est obligatoire !";
    }
    if (int.parse(value) <= 0) {
      return "L'age ne peut être négatif";
    }
    return null;
  }

  String? validateBouffe(value) {
    if (value == null) {
      return "Veuillez choisir un plat !";
    }

    var values = ['fricadelle', 'raclette', 'bdv'];

    if (!values.contains(value)) {
      return "Choix incorrect !";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                if (value != null) {
                  name = value;
                }
              },
              validator: validateName,
              decoration: InputDecoration(
                  label: Text('Name'), hintText: "Veuillez saisir votre nom"),
            ),
            TextFormField(
              onSaved: (value) {
                if (value != null) {
                  age = int.parse(value);
                }
              },
              validator: validateAge,
              decoration: InputDecoration(
                  label: Text('Age'), hintText: "Veuillez saisir votre age"),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField(
                onSaved: (value){
                  if(value != null){
                    bouffe = value;
                  }
                },
                validator: validateBouffe,
                items: [
                  DropdownMenuItem<String>(
                      value: null, child: Text('-Choisir un plat-')),
                  DropdownMenuItem<String>(
                      value: 'raclette', child: Text('Raclette')),
                  DropdownMenuItem<String>(
                      child: Text('Fricadelle'), value: 'fricadelle'),
                  DropdownMenuItem<String>(
                      child: Text('Blanquette de veau'), value: 'bdv'),
                ],
                onChanged: (value) {}),
            Row(
              children: [
                Text('La forme ?'),
                Checkbox(
                    value: isOk,
                    onChanged: (isChecked) {
                      setState(() {
                        isOk = isChecked!;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                    value: 'sucre',
                    groupValue: radioValue,
                    onChanged: updateRadioValue),
                Text("Sucré ?"),
                Radio<String>(
                    value: 'sel',
                    groupValue: radioValue,
                    onChanged: updateRadioValue),
                Text("Salé ?"),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  //déclenche les callbacks de validation -> validator
                  if (formKey.currentState!.validate()) {
                    //déclenche les callbacks de sauvegarde -> onSaved
                    formKey.currentState!.save();
                    print(name);
                    print(age);
                    print(bouffe);

                  }
                },
                child: Text("Valider"))
          ],
        ),
      ),
    );
  }
}
