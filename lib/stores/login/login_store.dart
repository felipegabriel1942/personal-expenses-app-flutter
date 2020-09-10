import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String senha;

  void setSenha(String value) => senha = value;
}