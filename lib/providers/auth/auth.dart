//Main Package Imports
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Config Import
import '../../config/endpoints.dart';

class Auth with ChangeNotifier {
  //TODO: Implement the use of tokens
  //String _token;

  String _personId = "";

  bool get isSignedIn {
    return _personId.isNotEmpty;
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse(
        '${Endpoints.Credentials}?username=$username&password=$password');
    print(url);

    try {
      //TODO: Change this to a post?? So details do not get sent in the url?
      final response = await http.get(url);
      final responseData = json.decode(response.body);

      //TODO: Remove before going to prod
      print(responseData);

      _personId = responseData["personid"];
      notifyListeners();

      //TODO: Save data locally
      // final prefs = await SharedPreferences.getInstance();
      // final userData = json.encode({
      //   'token': _token,
      //   'userId': _userId,
      //   'expiryDate': _expiryDate.toIso8601String()
      // });
      // prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    //TODO: Implement Auto Login
    // final prefs = await SharedPreferences.getInstance();
    // if (!prefs.containsKey('userData')) {
    //   return false;
    // }
    // final extractedUserData =
    //     json.decode(prefs.getString('userData')) as Map<String, Object>;
    // final expiryDate = DateTime.parse(extractedUserData['expiryDate']);
    // if (expiryDate.isBefore(DateTime.now())) {
    //   return false;
    // }
    // _token = extractedUserData['token'];
    // _userId = extractedUserData['userId'];
    // _expiryDate = expiryDate;
    // notifyListeners();
    // return true;
    return false;
  }
}
