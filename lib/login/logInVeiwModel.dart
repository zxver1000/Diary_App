import 'package:flutter/cupertino.dart';

import 'logInModel.dart';

import 'package:provider/provider.dart';
class logInViewModel extends ChangeNotifier {
  late logInModel model;

  int get count=>model.counter;

  logInViewModel() {
    model = logInModel();
  }
    void update() {
      notifyListeners();
    }
    void inc() {
      this.model.increase();
      update();
    }
}









