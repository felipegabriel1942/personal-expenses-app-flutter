import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_expenses_app/stores/login/login_store.dart';
import 'package:personal_expenses_app/utils/app_routes.dart';
import 'package:personal_expenses_app/views/login/components/login_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<ReactionDisposer> _disposers = [];
  final LoginStore loginStore = LoginStore();

  @override
  void initState() {
    super.initState();
    _disposers.add(
      autorun(
        (_) {

          if (loginStore.logged) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          }

          if (loginStore.error != null) {
            Flushbar(
              message: loginStore.error,
              duration: Duration(seconds: 3),
            )..show(context);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _disposers.forEach(
      (disposer) => disposer(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _availableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    bool _isLanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.lightBlue[600],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: _availableHeight * (_isLanscape ? 0.35 : 0.40),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: const AssetImage(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ),
              Container(
                height: _availableHeight * (_isLanscape ? 0.1 : 0.05),
                child: Text(
                  'Financial App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Container(
                  height: _availableHeight *
                      (_isLanscape
                          ? loginStore.isLoginMode ? 0.38 : 0.50
                          : loginStore.isLoginMode ? 0.23 : 0.35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginTextFormField(
                        label: 'E-mail',
                        icon: Icons.mail,
                        onChanged: loginStore.setEmail,
                      ),
                      LoginTextFormField(
                        label: 'Senha',
                        icon: Icons.lock,
                        onChanged: loginStore.setPassword,
                      ),
                      if (!loginStore.isLoginMode)
                        LoginTextFormField(
                          label: 'Confirmar senha',
                          icon: Icons.lock,
                          onChanged: loginStore.setConfirmPassword,
                        ),
                    ],
                  ),
                );
              }),
              if (!_isLanscape)
                const SizedBox(
                  height: 15,
                ),
              Observer(builder: (_) {
                return Container(
                  width: 200,
                  height: _availableHeight * (_isLanscape ? 0.13 : 0.07),
                  child: RaisedButton(
                    elevation: 6,
                    onPressed: loginStore.pressAuthButton,
                    color: Colors.white,
                    disabledColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: loginStore.isBusy
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            loginStore.isLoginMode ? 'LOGIN' : 'CADASTRAR',
                            style: TextStyle(
                              color: Colors.lightBlue,
                            ),
                          ),
                  ),
                );
              }),
              Observer(builder: (_) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(11),
                  height: _availableHeight *
                      (_isLanscape
                          ? 0.10
                          : loginStore.isLoginMode ? 0.26 : 0.14),
                  child: GestureDetector(
                    onTap: () {
                      loginStore.setLoginMode();
                    },
                    child: Text(
                      loginStore.isLoginMode
                          ? 'NÃO TEM CONTA? CADASTRE-SE.'
                          : 'JÁ TEM CONTA? FAÇA LOGIN.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
