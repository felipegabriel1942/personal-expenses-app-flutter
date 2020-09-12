// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpensesFormStore on _ExpensesFormStoreBase, Store {
  Computed<bool> _$isDescriptionValidComputed;

  @override
  bool get isDescriptionValid => (_$isDescriptionValidComputed ??=
          Computed<bool>(() => super.isDescriptionValid,
              name: '_ExpensesFormStoreBase.isDescriptionValid'))
      .value;
  Computed<bool> _$isExpenseValueValidComputed;

  @override
  bool get isExpenseValueValid => (_$isExpenseValueValidComputed ??=
          Computed<bool>(() => super.isExpenseValueValid,
              name: '_ExpensesFormStoreBase.isExpenseValueValid'))
      .value;
  Computed<bool> _$isDateValidComputed;

  @override
  bool get isDateValid =>
      (_$isDateValidComputed ??= Computed<bool>(() => super.isDateValid,
              name: '_ExpensesFormStoreBase.isDateValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ExpensesFormStoreBase.isFormValid'))
          .value;

  final _$autovalidateAtom = Atom(name: '_ExpensesFormStoreBase.autovalidate');

  @override
  bool get autovalidate {
    _$autovalidateAtom.reportRead();
    return super.autovalidate;
  }

  @override
  set autovalidate(bool value) {
    _$autovalidateAtom.reportWrite(value, super.autovalidate, () {
      super.autovalidate = value;
    });
  }

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
  String descriptionValidation(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.descriptionValidation');
    try {
      return super.descriptionValidation(value);
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
  String expenseValueValidation(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.expenseValueValidation');
    try {
      return super.expenseValueValidation(value);
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
  String dateValidation(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.dateValidation');
    try {
      return super.dateValidation(value);
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
  String categorieValidation(String value) {
    final _$actionInfo = _$_ExpensesFormStoreBaseActionController.startAction(
        name: '_ExpensesFormStoreBase.categorieValidation');
    try {
      return super.categorieValidation(value);
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
autovalidate: ${autovalidate},
description: ${description},
expenseValue: ${expenseValue},
date: ${date},
categorie: ${categorie},
observation: ${observation},
isDescriptionValid: ${isDescriptionValid},
isExpenseValueValid: ${isExpenseValueValid},
isDateValid: ${isDateValid},
isFormValid: ${isFormValid}
    ''';
  }
}
