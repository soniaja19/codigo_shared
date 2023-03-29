import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      // width: 100,
      // elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/1887624/pexels-photo-1887624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/foto2.jpg"),
                  backgroundColor: Colors.pink,
                  radius: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Sonia Justiniano Ayte",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "sonia.ju.ay@gmail.com",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text(
              "Mi perfil",
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              "Configuración",
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.price_change,
            ),
            title: Text(
              "Mis ventas",
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.pie_chart,
            ),
            title: Text(
              "Reportes",
            ),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text(
              "Cerrar Sesión",
            ),
          ),
        ],
      ),
    ); //para colorcar una barrita al costado, menú lateral
  }
}
