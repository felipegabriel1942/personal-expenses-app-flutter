import 'package:mobx/mobx.dart';
import 'package:personal_expenses_app/models/expense.dart';
import 'package:personal_expenses_app/repositories/expenses_repository.dart';
part 'expenses_store.g.dart';

class ExpensesStore = _ExpensesStoreBase with _$ExpensesStore;

abstract class _ExpensesStoreBase with Store {
  @observable
  List<Expense> expensesList = [];

  @observable
  double totalValue = 0;

  @observable
  bool isBusy = false;

  @observable
  DateTime selectedMonth = DateTime.now();

  Future<void> loadExpenses() async {
    try {
      isBusy = true;

      await ExpensesRepository().loadExpenses().then((value) {
        value.forEach((element) {
          final expense = Expense(
            description: element.description,
            date: element.date,
            value: element.value,
            categorie: element.categorie,
            observation: element.observation);

          totalValue += expense.value;
          expensesList.add(expense);
        });
      });
      return expensesList;
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }
}
