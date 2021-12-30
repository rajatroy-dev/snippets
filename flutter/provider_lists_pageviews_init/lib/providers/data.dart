import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  final List<String> _data = [];

  List<String> get getData {
    return [..._data];
  }

  Future<void> fetchData() async {
    for (var i = 0; i < 5; i++) {
      _data.add(i.toString());
    }
    print("fetchData");
    notifyListeners();
  }
}
