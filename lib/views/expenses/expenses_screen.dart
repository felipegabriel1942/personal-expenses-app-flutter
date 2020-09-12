import 'package:flutter/material.dart';
import 'package:personal_expenses_app/components/app_drawer.dart';
import 'package:personal_expenses_app/utils/app_routes.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
        backgroundColor: Colors.red[400],
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.amber[600],
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.EXPENSES_FORM);
          }),
    );
  }
}
