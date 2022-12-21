import 'package:algoriza_task/model/Coffee.dart';
import 'package:algoriza_task/repositories/coffee_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<CoffeeViewModel> coffeeProvider =
    ChangeNotifierProvider<CoffeeViewModel>((ref) {
  return CoffeeViewModel();
});

class CoffeeViewModel extends ChangeNotifier {
  CoffeeViewModel() {
    getCoffeeData();
  }

  bool isLoading = false;
  final List<Coffee> coffeeList = [];

  Future<void> getCoffeeData({bool refresh = false}) async {
    toggleLoading(on: true);
    await coffeeRepository.getCoffeeData(refresh: refresh);
    coffeeList.clear();
    coffeeList.addAll(coffeeRepository.coffeeList);
    toggleLoading(on: false);
  }

  void toggleLoading({required bool on}) {
    isLoading = on;
    notifyListeners();
  }
}
