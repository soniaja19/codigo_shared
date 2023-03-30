import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  //se coloca static para utilizar como clase
  // static int age = 20;

  // static void getAge() {
  //   print("Hola");
  // }

  static final SPGlobal _intance = SPGlobal.mandarina();

  SPGlobal.mandarina();

  factory SPGlobal() {
    return SPGlobal._intance;
  }

//le hemos indicado que luego le vamos asignar un valor
  late SharedPreferences prefs;

//Cuando yo quiera asignarle algo tenemos que ejecutar este metodo
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Con esto guardamos el Shared preference
  set name(String value) {
    prefs.setString("name", value);
  }

  // Con esto obtenemos el Shared preference
  String get name {
    return prefs.getString("name") ?? "--";
  }
}
