import 'package:flutter/material.dart';
import 'package:totalx_task/model/user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> _filteredUsers = [];
  String _searchText = "";
  String _sortOption = "All";

  List<User> get users => _filteredUsers;
  String get sortOption => _sortOption;

  void addUser(User user) {
    _users.add(user);
    _filterAndSortUsers();
  }

  void setSearchText(String searchText) {
    _searchText = searchText;
    _filterAndSortUsers();
  }

  void setSortOption(String sortOption) {
    _sortOption = sortOption;
    _filterAndSortUsers();
  }

  void _filterAndSortUsers() {
    _filteredUsers = _users.where((user) {
      return user.name.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    if (_sortOption == "Age Elder") {
      _filteredUsers = _filteredUsers.where((user) => user.age > 60).toList();
    } else if (_sortOption == "Age Younger") {
      _filteredUsers = _filteredUsers.where((user) => user.age <= 60).toList();
    }

    notifyListeners();
  }
}
