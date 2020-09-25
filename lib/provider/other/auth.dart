import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zfr_inventory_app/models/http_exception.dart';

class Auth with ChangeNotifier {
  
  String _token;
  DateTime _expiry;
  String _userId;
  Timer _authTime;

  bool get isAuth {
    return _token != null;
  }

  String get token {
    if (_token != null && _expiry.isAfter(DateTime.now()) && _expiry != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> login(
      String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAQ-MLKYlewuPkQas_zMhUqvIqNQtTlTNc';
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final postResponse = jsonDecode(response.body);
      if (postResponse['error'] != null) {
        throw HttpException(postResponse['error']['message']);
      }
      _token = postResponse['idToken'];
      _expiry = DateTime.now()
          .add(Duration(seconds: int.parse(postResponse['expiresIn'])));
      _userId = postResponse['localId'];
      autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = jsonEncode({
        'token': _token,
        'userId': _userId,
        'expiry': _expiry.toIso8601String()
      });
      prefs.setString('userData1', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData1')) {
      return false;
    }
    final userData =
        json.decode(prefs.getString('userData1')) as Map<String, Object>;
    if (DateTime.parse(userData['expiry']).isBefore(DateTime.now())) {
      return false;
    }
    print( userData['token']);
    _token = userData['token'];
    _expiry = DateTime.parse(userData['expiry']);
    _userId = userData['userId'];
    notifyListeners();
    autoLogout();

    return true;
  }

 

  

  Future<void> logout() async {
    _userId = null;
    _token = null;
    _expiry = null;
    if (_authTime != null) {
      _authTime.cancel();
      _authTime = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  void autoLogout() {
    if (_authTime != null) {
      _authTime.cancel();
    }
    var timeExpiry = _expiry.difference(DateTime.now()).inSeconds;
    _authTime = Timer(Duration(seconds: timeExpiry), logout);
  }
}