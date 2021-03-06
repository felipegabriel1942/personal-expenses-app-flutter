import 'dart:convert';
import 'dart:io';

import 'package:personal_expenses_app/models/Expense.dart';
import 'package:personal_expenses_app/utils/app_keys.dart';
import 'package:http/http.dart' as http;
import 'package:personal_expenses_app/utils/app_store.dart';

class ExpensesRepository {
  final _baseUrl = '${AppKeys.BASE_API_URL}/expenses';

  Future<void> saveExpense(Expense newExpense) async {
    Map<String, dynamic> userData = await AppStore.getMap('userData');
    String token = userData['token'];
    String userId = userData['userId'];

    final response = await http.post(
      '$_baseUrl/$userId.json?auth=$token',
      body: json.encode(newExpense.toMap(newExpense)),
    );

    if (response.statusCode >= 400) {
      print(response.statusCode);
    }
  }

  Future<List<Expense>> loadExpenses() async {
    Map<String, dynamic> userData = await AppStore.getMap('userData');
    String token = userData['token'];
    String userId = userData['userId'];

    final response = await http.get('$_baseUrl/$userId.json?auth=$token');
    Map<String, dynamic> data = json.decode(response.body);

    if (data == null) {
      return [];
    }

    List<Expense> expensesList = [];

    try {
      data.forEach((expenseId, expenseData) {
        expensesList.add(
          Expense.fromMap(
            expenseData,
          ),
        );
      });
    } catch (e) {
      print(e);
    }

    return Future.value(expensesList);
  }

  Future<void> deleteExpenses(String id) async {
    Map<String, dynamic> userData = await AppStore.getMap('userData');
    String token = userData['token'];
    String userId = userData['userId'];

    final response =
        await http.delete('$_baseUrl/$userId/$id.json?auth=$token');

    if(response.statusCode >= 400) {
      throw HttpException('Ocorreu um erro na exclusão do produto.');
    }
  }
}
