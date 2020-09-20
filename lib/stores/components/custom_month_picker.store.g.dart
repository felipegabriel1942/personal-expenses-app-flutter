// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_month_picker.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomMonthPickerStore on _CustomMonthPickerStoreBase, Store {
  final _$selectedMonthAtom =
      Atom(name: '_CustomMonthPickerStoreBase.selectedMonth');

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

  final _$_CustomMonthPickerStoreBaseActionController =
      ActionController(name: '_CustomMonthPickerStoreBase');

  @override
  void setSelectedMonth(DateTime value) {
    final _$actionInfo = _$_CustomMonthPickerStoreBaseActionController
        .startAction(name: '_CustomMonthPickerStoreBase.setSelectedMonth');
    try {
      return super.setSelectedMonth(value);
    } finally {
      _$_CustomMonthPickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMonth: ${selectedMonth}
    ''';
  }
}
