import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_expenses_app/components/app_drawer.dart';
import 'package:personal_expenses_app/components/custom_month_picker.dart';
import 'package:personal_expenses_app/repositories/expenses_repository.dart';
import 'package:personal_expenses_app/stores/expenses/expenses_store.dart';
import 'package:personal_expenses_app/utils/app_routes.dart';
import 'package:personal_expenses_app/views/expenses/components/expense_list_item.dart';

class ExpensesScreen extends StatelessWidget {
  final store = ExpensesStore();
  final expensesRepository = ExpensesRepository();

  @override
  Widget build(BuildContext context) {
    final _availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        56;

    bool _isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
        backgroundColor: Colors.red[400],
      ),
      body: Column(
        children: [
          Container(
            height: _availableHeight * 0.20,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomMonthPicker(),
                Observer(builder: (_) {
                  return Text(store.selectedMonth.toIso8601String());
                }),
                Observer(
                  builder: (_) {
                    return store.isBusy
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: Text(
                              'R\$ ${store.totalValue.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: _availableHeight * 0.75,
            padding: const EdgeInsets.only(bottom: 15),
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
        ],
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
