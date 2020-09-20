import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jiffy/jiffy.dart';

import 'package:personal_expenses_app/stores/components/custom_month_picker.store.dart';

class CustomMonthPicker extends StatelessWidget {
  final store = CustomMonthPickerStore();

  CustomMonthPicker();

  _increaseMonth() {
    store.setSelectedMonth(Jiffy(store.selectedMonth).add(months: 1));
    print(store.selectedMonth);
  }

  _decreaseMonth() {
    store.setSelectedMonth(Jiffy(store.selectedMonth).subtract(months: 1));
    print(store.selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              iconSize: 25,
              onPressed: _decreaseMonth,
            ),
          ),
          Observer(builder: (_) {
            return Container(
              child: Text(
                store.selectedMonth.toIso8601String(),
                style: TextStyle(fontSize: 18),
              ),
            );
          }),
          Container(
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              iconSize: 25,
              onPressed: _increaseMonth,
            ),
          )
        ],
      ),
    );
  }
}
