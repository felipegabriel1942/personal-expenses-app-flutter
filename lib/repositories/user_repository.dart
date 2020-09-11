import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personal_expenses_app/exceptions/firebase_exception.dart';
import 'package:personal_expenses_app/utils/app_keys.dart';


class UserRepository {

  String _userId;
  String _token;
  DateTime _expireDate;
  Timer _logoutTimer;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=${AppKeys.FIREBASE_KEY}';

    final response = await http.post(_url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    final responseBody = json.decode(response.body);

    if (responseBody['error'] != null) {
      print(responseBody['error']);
      throw FirebaseException(responseBody['error']['message']).toString();
    } else {
      _token = responseBody['idToken'];
      _userId = responseBody['localId'];
      _expireDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseBody['expiresIn'])));

      // Store.saveMap('userData', {
      //   'token': _token,
      //   'userId': _userId,
      //   'expireDate': _expireDate.toIso8601String()
      // });

      print(_token);
      print(_userId);
      print(_expireDate);
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}