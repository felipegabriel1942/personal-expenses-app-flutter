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

  @computed
  Function get loginPressed => isEmailValid && isPasswordValid ? _login : null;

  @computed
  Function get pressAuthButton => isLoginMode ? loginPressed : signUpPressed;

  @observable
  String error;

  @observable
  bool isBusy = false;

  @observable
  bool logged = false;

  @action
  Future<void> _signUp() async {
    isBusy = true;

    try{
      await UserRepository().signup(email, password);
      error = null;
    } catch(e) {
      error = e;
    } finally {
      isBusy = false;
    }
  }

  @action
  Future<void> _login() async {
    isBusy = true;

    try{
      await UserRepository().login(email, password);
      logged = true;
      error = null;
    } catch(e) {
      error = e;
    } finally {
      isBusy = false;
    }
  }
}