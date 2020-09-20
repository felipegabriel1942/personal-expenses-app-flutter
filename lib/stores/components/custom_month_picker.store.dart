import 'package:mobx/mobx.dart';
part 'custom_month_picker.store.g.dart';

class CustomMonthPickerStore = _CustomMonthPickerStoreBase with _$CustomMonthPickerStore;

abstract class _CustomMonthPickerStoreBase with Store {

  @observable
  DateTime selectedMonth = DateTime.now();

  @action
  void setSelectedMonth(DateTime value) => selectedMonth = value;
}