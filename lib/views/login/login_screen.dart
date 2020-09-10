import 'package:flutter/material.dart';
import 'package:personal_expenses_app/stores/login/login_store.dart';
import 'package:personal_expenses_app/utils/app_routes.dart';
import 'package:personal_expenses_app/views/login/components/login_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LoginStore loginStore = LoginStore();

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
              Container(
                height: _availableHeight * (_isLanscape ? 0.38 : 0.25),
                child: Column(
                  children: [
                    LoginTextFormField(
                      label: 'E-mail',
                      icon: Icons.mail,
                      onChanged: loginStore.setEmail,
                    ),
                    LoginTextFormField(
                      label: 'Senha',
                      icon: Icons.lock,
                      onChanged: loginStore.setSenha,
                    ),
                  ],
                ),
              ),
              Container(
                width: 200,
                height: _availableHeight * (_isLanscape ? 0.13 : 0.07),
                child: RaisedButton(
                  elevation: 6,
                  onPressed: () {
                    print(loginStore.email);
                    print(loginStore.senha);
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              Container(
                height: _availableHeight * (_isLanscape ? 0.1 : 0.23),
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRoutes.CADASTRO);
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
