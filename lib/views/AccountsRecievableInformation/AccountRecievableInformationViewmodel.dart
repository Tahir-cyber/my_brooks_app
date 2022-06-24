import 'package:flutter/cupertino.dart';

class AccountRecievableInformationViewmodel extends ChangeNotifier {
  String value = "Goods";

  changeValue(String value) {
    this.value = value;
    notifyListeners();
  }
}
