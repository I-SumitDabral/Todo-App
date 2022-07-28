import 'package:flutter/cupertino.dart';

class LoadingViewModel extends ChangeNotifier {
  bool get isLoading => false;

  set isLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
