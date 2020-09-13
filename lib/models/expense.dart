class Expense {
  final String id;
  final String description;
  final double value;
  final DateTime date;
  final String categorie;
  final String observation;

  Expense({
    this.id,
    this.description,
    this.value,
    this.date,
    this.categorie,
    this.observation,
  });

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
