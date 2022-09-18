import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/LoginUserApi/LoginUserApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/LoginUserRepository/LoginUserRepositoryImpl.dart';
import 'package:imdbmovieapp/domain/LoginUserUseCase.dart';
import 'package:imdbmovieapp/presentation/BottomBarScreen/BottomNavigationbarScreen.dart';

class LoginScreenProvider extends ChangeNotifier {
  LoginUserUseCase _loginUserUseCase =
      LoginUserUseCase(LoginUserRepositoryImpl(LoginUserApiImpl()));

  var _usernamemessage;

  get usernamemessage => _usernamemessage;

  void uservalidation(String? user) {
    if (user!.length > 0) {
      _usernamemessage = null;
      notifyListeners();
    } else {
      _usernamemessage = "Please enter Username";
      notifyListeners();
    }
  }

  var _passwordmessage;

  get passwordmessage => _passwordmessage;

  void passwordvalidation(String? pass) {
    if (pass!.length < 8) {
      _passwordmessage = "Please enter 8 digit password";
      notifyListeners();
    } else {
      _passwordmessage = null;
      notifyListeners();
    }
  }

  var _isobscuretext = true;

  get isobscuretext => _isobscuretext;

  void changeobscuretext() {
    if (_isobscuretext == false) {
      _isobscuretext = true;
      notifyListeners();
    } else {
      _isobscuretext = false;
      notifyListeners();
    }
  }

  late DataSnapshot _loginuserdetails;

  get loginuserdetails => _loginuserdetails;

  bool _isloading = false;

  get isloading => _isloading;

  void loginuser(String email, String password, DatabaseReference _userref,
      BuildContext context) async {
    _isloading = true;
    var responses = await _loginUserUseCase.callapi(email, password, _userref);

    print("responses=>,${responses}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationbarScreen()),
    );

    _isloading = false;
    notifyListeners();
  }
}
