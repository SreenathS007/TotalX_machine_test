import 'package:flutter/material.dart';
import 'package:totalx_task/model/user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners(); // Notifies the views to update
  }

  void clearUsers() {
    _users.clear();
    notifyListeners(); // Notifies the views to update
  }
}
