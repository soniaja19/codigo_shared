import 'package:codigo_shared/pages/home_page.dart';
import 'package:codigo_shared/utils/sp_global.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //Este se coloca cuando se aplica Shared Preferencia Global, de la mejor forma
  SPGlobal spGlobal = SPGlobal();

  spGlobal.initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
