import 'package:flutter/material.dart';

class ExpensesFormScreen extends StatefulWidget {
  @override
  _ExpensesFormScreenState createState() => _ExpensesFormScreenState();
}

class _ExpensesFormScreenState extends State<ExpensesFormScreen> {

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        print(pickedDate);
      });
    });
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Valor',
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Data'
              ),
              onTap: _showDatePicker,
            ),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(labelText: 'Categoria'),
              items: [
                DropdownMenuItem(
                  child: Text('Alimentação'),
                  value: 'alimentacao',
                )
              ],
              onChanged: (String value) {},
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Observação',
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
        onPressed: () {},
      ),
    );
  }
}
