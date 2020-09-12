import 'package:mobx/mobx.dart';
part 'expenses_form_store.g.dart';

class ExpensesFormStore = _ExpensesFormStoreBase with _$ExpensesFormStore;

abstract class _ExpensesFormStoreBase with Store {
  
  @observable
  String description;

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description != null && description.isNotEmpty;

  @computed
  String get descriptionFieldError {
    return description == null || descriptionValid ? null : 'Campo obrigatório';
  }

  @observable
  String expenseValue;

  @action
  void setExpenseValue(String value) => expenseValue = value;

  @computed
  bool get expenseValueValid => expenseValue != null && expenseValue.isNotEmpty;

  @computed
  String get expenseValueFieldError {
    return expenseValue == null || expenseValueValid ? null : 'Campo obrigatório';
  }

  @observable
  DateTime date = DateTime.now();
  
  @action
  void setDate(DateTime value) => date = value;

  @computed
  bool get dateValid => date != null;

  @computed
  String get dateFieldError {
    return dateValid ? null : 'Campo obrigatório';
  }

  @observable
  String categorie;

  @action
  void setCategorie(String value) => categorie = value;

  @observable
  String observation;

  @action
  void setObservation(String value) => observation = value;

}