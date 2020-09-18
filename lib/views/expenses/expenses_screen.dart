import 'package:flutter/material.dart';
import 'package:personal_expenses_app/components/app_drawer.dart';
import 'package:personal_expenses_app/repositories/expenses_repository.dart';
import 'package:personal_expenses_app/stores/expenses/expenses_store.dart';
import 'package:personal_expenses_app/utils/app_routes.dart';
import 'package:personal_expenses_app/views/expenses/components/expense_list_item.dart';

class ExpensesScreen extends StatelessWidget {
  final store = ExpensesStore();
  final expensesRepository = ExpensesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        child: FutureBuilder(
          future: store.loadExpenses(),
          builder: (context, snapshot) {
            if (store.isBusy) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: store.expensesList.length,
                itemBuilder: (context, index) {
                  return ExpenseListItem(
                    expense: store.expensesList[index],
                  );
                },
              );
            }
          },
        ),
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
        },
      ),
    );
  }
}
