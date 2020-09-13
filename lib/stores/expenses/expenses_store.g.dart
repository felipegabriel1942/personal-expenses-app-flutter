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

  @override
  String toString() {
    return '''
expensesList: ${expensesList},
isBusy: ${isBusy}
    ''';
  }
}
