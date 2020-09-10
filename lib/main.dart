import 'package:flutter/material.dart';
import 'package:personal_expenses_app/utils/app_routes.dart';
import 'package:personal_expenses_app/views/cadastro/cadastro_screen.dart';
import 'package:personal_expenses_app/views/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.LOGIN:(ctx) => LoginScreen(),
        AppRoutes.CADASTRO: (ctx) => CadastroScreen()
      },
    );
  }
}

