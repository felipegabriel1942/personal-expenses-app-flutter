import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @observable
  String confirmPassword;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @observable
  bool isLoginMode = true;

  @action
  void setLoginMode() => isLoginMode = !isLoginMode;
}