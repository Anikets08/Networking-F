import 'package:flutter/cupertino.dart';

class SignupProvider extends ChangeNotifier {
  bool _isLoading = false;
  get isLoading => _isLoading;
  void isLoadingFun(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
