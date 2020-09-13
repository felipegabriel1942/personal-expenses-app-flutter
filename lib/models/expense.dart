class Expense {
  String id;
  String description;
  double value;
  DateTime date;
  String categorie;
  String observation;

  Expense({
    this.id,
    this.description,
    this.value,
    this.date,
    this.categorie,
    this.observation,
  });

  Expense.fromMap(Map<String, dynamic> map) {
    this.description = map['description'];
    this.value = map['value'];
    this.date = DateTime.parse(map['date']);
    this.categorie = map['categorie'];
    this.observation = map['observation'];
  }

  Map toMap(Expense expense) {
    Map<String, dynamic> map = {
      'description': expense.description,
      'value': expense.value,
      'date': expense.date.toIso8601String(),
      'categorie': expense.categorie,
      'observation': expense.observation
    };

    return map;
  }
}
