import 'package:flutter/cupertino.dart';

class SigninProvider with ChangeNotifier {
  bool _isLoading = false;
  get isLoading => _isLoading;
  void isLoadingFun(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
