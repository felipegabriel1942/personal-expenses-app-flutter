import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_expenses_app/stores/expenses/expenses_form_store.dart';

class ExpensesFormScreen extends StatefulWidget {
  @override
  _ExpensesFormScreenState createState() => _ExpensesFormScreenState();
}

class _ExpensesFormScreenState extends State<ExpensesFormScreen> {
  final store = ExpensesFormStore();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = autorun((_) {
      if (store.isFormSaved) {
        Navigator.of(context).pop();
        Flushbar(
          message: 'Despensa foi salva com sucesso!',
          duration: Duration(seconds: 3),
        ).show(context);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

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
        title: Text(
          'Nova despesa',
        ),
        backgroundColor: Colors.red[400],
      ),
      body: Observer(
        builder: (_) {
          return store.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Observer(
                        builder: (_) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: TextFormField(
                              autovalidate: store.autovalidate,
                              decoration: InputDecoration(
                                
                                labelText: 'Descrição',
                                prefixIcon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              validator: store.descriptionValidation,
                              onChanged: store.setDescription,
                            ),
                          );
                        },
                      ),
                      Observer(builder: (_) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: TextFormField(
                            autovalidate: store.autovalidate,
                            decoration: InputDecoration(
                              labelText: 'Valor',
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.monetization_on,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: store.expenseValueValidation,
                            onChanged: store.setExpenseValue,
                          ),
                        );
                      }),
                      Observer(builder: (_) {
                        final format = new DateFormat(
                          'dd/MM/yyyy',
                        );

                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: TextFormField(
                            autovalidate: store.autovalidate,
                            controller: TextEditingController(
                              text: store.isDateValid
                                  ? format.format(store.date)
                                  : null,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Data',
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.date_range,
                              ),
                            ),
                            onTap: _showDatePicker,
                            keyboardType: TextInputType.datetime,
                            validator: store.dateValidation,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter()
                            ],
                          ),
                        );
                      }),
                      Observer(builder: (_) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            autovalidate: store.autovalidate,
                            decoration: InputDecoration(
                              labelText: 'Categoria',
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.list,
                              ),
                            ),
                            validator: store.categorieValidation,
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
                        );
                      }),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.text_fields,
                            ),
                          ),
                          onChanged: store.setObservation,
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        onPressed: () {
          store.setAutovalidate();
          store.saveButtonPressed();
        },
      ),
    );
  }
}
