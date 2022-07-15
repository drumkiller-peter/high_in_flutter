import 'package:flutter/material.dart';
import 'package:high_in_flutter/repository/local_data.dart';

class DarkModeProvider extends ChangeNotifier {
  LocalRepositoryManager localRepositoryManager = LocalRepositoryManager();

  bool getDarkTheme() => localRepositoryManager.getTheme();

  // bool _darkTheme = false;

  bool get darkTheme => getDarkTheme();

  set darkTheme(bool value) {
    // _darkTheme = value;
    localRepositoryManager.saveTheme(value);
    notifyListeners();
  }
}
