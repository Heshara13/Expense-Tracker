import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  /// method to Stores user details in shared preferences.
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      // check if passwords match
      if (password != confirmPassword) {
        // show a message to the user
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Passwords do not match!")));
      }
      // if passwords are same, save username and email to shared preferences or any storage
      //cretae an instance of SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //save user details as key-value pairs
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      // show a message to gthe user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User details saved successfully!")),
      );
      return;
    } catch (err) {
      err.toString();
    }
  }
}
