// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpensesStore on _ExpensesStoreBase, Store {
  final _$expensesListAtom = Atom(name: '_ExpensesStoreBase.expensesList');

  @override
  List<Expense> get expensesList {
    _$expensesListAtom.reportRead();
    return super.expensesList;
  }

  @override
  set expensesList(List<Expense> value) {
    _$expensesListAtom.reportWrite(value, super.expensesList, () {
      super.expensesList = value;
    });
  }

  final _$totalValueAtom = Atom(name: '_ExpensesStoreBase.totalValue');

  @override
  double get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(double value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  final _$isBusyAtom = Atom(name: '_ExpensesStoreBase.isBusy');

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  final _$selectedMonthAtom = Atom(name: '_ExpensesStoreBase.selectedMonth');

  @override
  DateTime get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(DateTime value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  @override
  String toString() {
    return '''
expensesList: ${expensesList},
totalValue: ${totalValue},
isBusy: ${isBusy},
selectedMonth: ${selectedMonth}
    ''';
  }
}
