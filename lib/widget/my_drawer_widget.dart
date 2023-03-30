import 'package:codigo_shared/pages/profile_page.dart';
import 'package:codigo_shared/utils/sp_global.dart';
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
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/foto2.jpg"),
                  backgroundColor: Colors.pink,
                  radius: 40,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  SPGlobal().name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  "sonia.ju.ay@gmail.com",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            //para llamar una pagina
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            leading: const Icon(
              Icons.person,
            ),
            title: const Text(
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
