import 'package:mobx/mobx.dart';
import 'package:personal_expenses_app/repositories/user_repository.dart';
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

  @computed
  bool get isPasswordEquals => password == confirmPassword;

  @computed
  bool get isEmailValid => email != null && email != '';

  @computed
  bool get isPasswordValid => password != null && password != '';

  @computed
  bool get isSignUpFormValid => isPasswordEquals && isEmailValid && isPasswordValid;

  @computed
  Function get signUpPressed => isSignUpFormValid ? _signUp : null;

  Future<void> _signUp() async {

    try{
      await UserRepository().signup(email, password);
    } catch(e) {

    }
  }
}