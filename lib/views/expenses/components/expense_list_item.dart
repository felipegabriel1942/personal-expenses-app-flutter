import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/expense.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;

  ExpenseListItem({this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),
      elevation: 4,
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.red[400],
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              // child: CurrencyText(
              //   value: expense.value,
              //   color: Colors.white,
              // ),
              child: Icon(
                Icons.fastfood,
                color: Colors.white,
              ),
            ),
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        // title: Text('R\$ ${expense.value} (${expense.description})'),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('R\$ ${expense.value}'),
            Text('${expense.description}', style: TextStyle(color: Colors.black54),)
          ],
        ),
        subtitle: Text(
          '${DateFormat('dd/MM/yyyy').format(expense.date)}',
        ),
      ),
    );
  }
}
