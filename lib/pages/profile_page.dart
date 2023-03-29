import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String adress = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    //Obtener los datos del Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name") ?? "No disponible";
    adress = prefs.getString("adress") ?? "No disponible";
    email = prefs.getString("email") ?? "No disponible";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mi Perfil",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Nombre completo",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              adress,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Dirección",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              email,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Correo electrónico",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
