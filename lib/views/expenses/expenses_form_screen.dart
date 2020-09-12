import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/stores/expenses/expenses_form_store.dart';

class ExpensesFormScreen extends StatefulWidget {
  @override
  _ExpensesFormScreenState createState() => _ExpensesFormScreenState();
}

class _ExpensesFormScreenState extends State<ExpensesFormScreen> {
  final store = ExpensesFormStore();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then(store.setDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova despesa'),
        backgroundColor: Colors.red[400],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Observer(builder: (_) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    errorText: store.descriptionFieldError,
                    prefixIcon: Icon(
                      Icons.edit,
                    ),
                  ),
                  onChanged: store.setDescription,
                ),
              );
            }),
            Observer(builder: (_) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Valor',
                    errorText: store.expenseValueFieldError,
                    prefixIcon: Icon(
                      Icons.monetization_on,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: store.setExpenseValue,
                ),
              );
            }),
            Observer(builder: (_) {
              final format = new DateFormat('dd/MM/yyyy');

              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: TextFormField(
                  controller: TextEditingController(
                    text: store.dateValid ? format.format(store.date) : null,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Data',
                    errorText: store.dateFieldError,
                    prefixIcon: Icon(
                      Icons.date_range,
                    ),
                  ),
                  onTap: _showDatePicker,
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter()
                  ],
                ),
              );
            }),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Categoria',
                  prefixIcon: Icon(
                    Icons.list,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      'Alimentação',
                    ),
                    value: 'alimentacao',
                  )
                ],
                onChanged: store.setCategorie,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Observação',
                  prefixIcon: Icon(
                    Icons.text_fields,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        onPressed: () {
          print(store.description);
          print(store.expenseValue);
          print(store.date);
          print(store.categorie);
        },
      ),
    );
  }
}
