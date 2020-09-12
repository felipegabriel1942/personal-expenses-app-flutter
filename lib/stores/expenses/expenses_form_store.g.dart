// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpensesFormStore on _ExpensesFormStoreBase, Store {
  Computed<bool> _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_ExpensesFormStoreBase.descriptionValid'))
      .value;
  Computed<String> _$descriptionFieldErrorComputed;

  @override
  String get descriptionFieldError => (_$descriptionFieldErrorComputed ??=
          Computed<String>(() => super.descriptionFieldError,
              name: '_ExpensesFormStoreBase.descriptionFieldError'))
      .value;
  Computed<bool> _$expenseValueValidComputed;

  @override
  bool get expenseValueValid => (_$expenseValueValidComputed ??= Computed<bool>(
          () => super.expenseValueValid,
          name: '_ExpensesFormStoreBase.expenseValueValid'))
      .value;
  Computed<String> _$expenseValueFieldErrorComputed;

  @override
  String get expenseValueFieldError => (_$expenseValueFieldErrorComputed ??=
          Computed<String>(() => super.expenseValueFieldError,
              name: '_ExpensesFormStoreBase.expenseValueFieldError'))
      .value;
  Computed<bool> _$dateValidComputed;

  @override
  bool get dateValid =>
      (_$dateValidComputed ??= Computed<bool>(() => super.dateValid,
              name: '_ExpensesFormStoreBase.dateValid'))
          .value;
  Computed<String> _$dateFieldErrorComputed;

  @override
  String get dateFieldError =>
      (_$dateFieldErrorComputed ??= Computed<String>(() => super.dateFieldError,
              name: '_ExpensesFormStoreBase.dateFieldError'))
          .value;

  final _$descriptionAtom = Atom(name: '_ExpensesFormStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$expenseValueAtom = Atom(name: '_ExpensesFormStoreBase.expenseValue');

  @override
  String get expenseValue {
    _$expenseValueAtom.reportRead();
    return super.expenseValue;
  }

  @override
  set expenseValue(String value) {
    _$expenseValueAtom.reportWrite(value, super.expenseValue, () {
      super.expenseValue = value;
    });
  }

  final _$dateAtom = Atom(name: '_ExpensesFormStoreBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$categorieAtom = Atom(name: '_ExpensesFormStoreBase.categorie');

  @override
  String get categorie {
    _$categorieAtom.reportRead();
    return super.categorie;
  }

  @override
  set categorie(String value) {
    _$categorieAtom.reportWrite(value, super.categorie, () {
      super.categorie = value;
    });
  }

  final _$observationAtom = Atom(name: '_ExpensesFormStoreBase.observation');

  @override
  String get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(String value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
    });
  }

  final _$_ExpensesFormStoreBaseActionController =
      ActionController(name: '_ExpensesFormStoreBase');

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_ExpensesFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpenseValue(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.setExpenseValue');
    try {
      return super.setExpenseValue(value);
    } finally {
      _$_ExpensesFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_ExpensesFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategorie(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.setCategorie');
    try {
      return super.setCategorie(value);
    } finally {
      _$_ExpensesFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservation(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.setObservation');
    try {
      return super.setObservation(value);
    } finally {
      _$_ExpensesFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
expenseValue: ${expenseValue},
date: ${date},
categorie: ${categorie},
observation: ${observation},
descriptionValid: ${descriptionValid},
descriptionFieldError: ${descriptionFieldError},
expenseValueValid: ${expenseValueValid},
expenseValueFieldError: ${expenseValueFieldError},
dateValid: ${dateValid},
dateFieldError: ${dateFieldError}
    ''';
  }
}
