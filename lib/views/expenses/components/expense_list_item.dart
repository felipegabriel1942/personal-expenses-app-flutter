import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/expense.dart';
import 'package:personal_expenses_app/utils/app_format_utils.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;

  ExpenseListItem({this.expense});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.red[400],
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(
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
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('R\$ ${AppFormatUtils.toCurrencyString(
            value: expense.value,
          )}'),
          Text(
            '${expense.description}',
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
      subtitle: Text(
        '${DateFormat('dd/MM/yyyy').format(expense.date)}',
      ),
    );
  }
}
