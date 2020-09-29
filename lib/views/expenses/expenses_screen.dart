import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_expenses_app/components/app_drawer.dart';
import 'package:personal_expenses_app/components/custom_month_picker.dart';
import 'package:personal_expenses_app/repositories/expenses_repository.dart';
import 'package:personal_expenses_app/stores/expenses/expenses_store.dart';
import 'package:personal_expenses_app/utils/app_format_utils.dart';
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
            MonthSelector(
              availableHeight: _availableHeight,
              store: store,
            ),
            TotalExpenseInformative(
              availableHeight: _availableHeight,
              store: store,
            ),
            ExpensesList(
              availableHeight: _availableHeight,
              store: store,
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

class MonthSelector extends StatelessWidget {
  const MonthSelector({
    Key key,
    @required double availableHeight,
    @required this.store,
  })  : _availableHeight = availableHeight,
        super(key: key);

  final double _availableHeight;
  final ExpensesStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      height: _availableHeight * 0.08,
      child: Observer(builder: (_) {
        return CustomMonthPicker(
          onDecrease: store.isBusy ? null : store.decreaseMonth,
          onIncrease: store.isBusy ? null : store.increaseMonth,
          selectedMonth: store.selectedMonth,
        );
      }),
    );
  }
}

class TotalExpenseInformative extends StatelessWidget {
  const TotalExpenseInformative({
    Key key,
    @required double availableHeight,
    @required this.store,
  })  : _availableHeight = availableHeight,
        super(key: key);

  final double _availableHeight;
  final ExpensesStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _availableHeight * 0.14,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Observer(
                builder: (_) {
                  return store.isBusy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          AppFormatUtils.toCurrencyString(
                            value: store.totalValue,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key key,
    @required double availableHeight,
    @required this.store,
  })  : _availableHeight = availableHeight,
        super(key: key);

  final double _availableHeight;
  final ExpensesStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          height: _availableHeight * 0.78,
          padding: const EdgeInsets.only(
            bottom: 45,
            top: 10,
          ),
          child: store.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : store.expensesList.length == 0
                  ? EmptyListImage()
                  : ListView.builder(
                      itemCount: store.expensesList.length,
                      itemBuilder: (_, index) => Column(
                        children: [
                          ExpenseListItem(
                            expense: store.expensesList[index],
                          ),
                          Divider(),
                        ],
                      ),
                    ),
        );
      },
    );
  }
}

class EmptyListImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nenhuma despesa encontrada!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[500],
          ),
        ),
        Image.asset('assets/images/empty-list.png')
      ],
    );
  }
}
