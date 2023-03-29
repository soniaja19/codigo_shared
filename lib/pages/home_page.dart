import 'package:codigo_shared/pages/widget/my_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "--";
  int age = 0;

  Future save() async {
    SharedPreferences mandarina = await SharedPreferences.getInstance();
    mandarina.setString("name", "Sonia Justininao");
    mandarina.setInt("age", 30); //Set para guardar, get para obtener.
    print("Guardando....");
  }

  Future<void> getData() async {
    SharedPreferences mantequilla = await SharedPreferences.getInstance();
    print(mantequilla.getString("name"));
    name = mantequilla.getString("name") ?? "No disponible";
    age = mantequilla.getInt("age") ?? 0;
    setState(() {});
  }

  Future getName() async {
    SharedPreferences matasquita = await SharedPreferences.getInstance();
    return matasquita.getString("name") ?? "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mi Share Preference",
        ),
      ),
      drawer: MyDrawerWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Nombre completo",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Dirección",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Correo electrónico",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    save();
                  },
                  child: const Text(
                    "Guardar",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: const Text(
                    "Obtener",
                  ),
                ),
                Text(
                  name,
                ),
                FutureBuilder(
                  future: getName(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      return Text(
                          snap.data); // si esto se cumple se imprime el getname
                    }
                    return const CircularProgressIndicator(); // si no cumple se aplica el CircularProgressIndicator
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
