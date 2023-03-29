import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/my_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "--";
  int age = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
//_ significa que la variable es privada, para queesta clase tenga acceso a ello, utilizado genericamente

  Future save() async {
    SharedPreferences mandarina = await SharedPreferences.getInstance();

    //guardar la información que se escribe en el liststyle
    mandarina.setString("name", _nameController.text);
    mandarina.setString("adress", _adressController.text);
    mandarina.setString("email", _emailController.text);
    // mandarina.setInt("age", 30); //Set para guardar, get para obtener.
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
                TextField(
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(
                  //     RegExp("[0-9]"),//aqui podemos colocar caracteres no imprimibles
                  //   ),
                  // ],
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Nombre completo",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _adressController,
                  decoration: const InputDecoration(
                    hintText: "Dirección",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
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
                // ElevatedButton(
                //   onPressed: () {
                //     getData();
                //   },
                //   child: const Text(
                //     "Obtener",
                //   ),
                // ),
                // Text(
                //   name,
                // ),
                // FutureBuilder(
                //   future: getName(),
                //   builder: (BuildContext context, AsyncSnapshot snap) {
                //     if (snap.hasData) {
                //       return Text(
                //           snap.data); // si esto se cumple se imprime el getname
                //     }
                //     return const CircularProgressIndicator(); // si no cumple se aplica el CircularProgressIndicator
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
