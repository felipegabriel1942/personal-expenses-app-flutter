import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/expense.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;

  ExpenseListItem({this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.red[200],
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                'R\$ ${expense.value.toStringAsFixed(0)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red,),
          onPressed: () {},),
        title: Text(expense.description),
        subtitle: Text(
          '${expense.categorie} | ${DateFormat('dd/MM/yyyy hh:mm').format(expense.date)}',
        ),
      ),
    );
  }
}
