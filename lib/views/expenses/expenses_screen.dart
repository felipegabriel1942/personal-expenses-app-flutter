import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_expenses_app/components/app_drawer.dart';
import 'package:personal_expenses_app/components/currency_text.dart';
import 'package:personal_expenses_app/components/custom_month_picker.dart';
import 'package:personal_expenses_app/repositories/expenses_repository.dart';
import 'package:personal_expenses_app/stores/expenses/expenses_store.dart';
import 'package:personal_expenses_app/utils/app_routes.dart';
import 'package:personal_expenses_app/views/expenses/components/expense_list_item.dart';

class ExpensesScreen extends StatefulWidget {
  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final store = ExpensesStore();

  final expensesRepository = ExpensesRepository();

  @override
  void initState() {
    super.initState();
    store.loadExpenses();
  }

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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.red[400]),
              height: _availableHeight * 0.08,
              child: Observer(builder: (_) {
                return CustomMonthPicker(
                  onDecrease: store.isBusy ? null : store.decreaseMonth,
                  onIncrease: store.isBusy ? null : store.increaseMonth,
                  selectedMonth: store.selectedMonth,
                );
              }),
            ),
            Container(
              height: _availableHeight * 0.14,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
              child: Card(
                  elevation: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Total',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Observer(
                          builder: (_) {
                            return store.isBusy
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CurrencyText(
                                    value: store.totalValue,
                                    fontSize: 15,
                                  );
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Observer(
              builder: (_) {
                return Container(
                  height: _availableHeight * 0.68,
                  decoration: BoxDecoration(color: Colors.white),
                  child: store.isBusy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: store.expensesList.length,
                          itemBuilder: (_, index) {
                            return ExpenseListItem(
                              expense: store.expensesList[index],
                            );
                          },
                        ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: _availableHeight * 0.13,
            )
          ],
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
