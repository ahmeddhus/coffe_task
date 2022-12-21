import 'package:algoriza_task/api/coffee_api.dart';
import 'package:algoriza_task/model/Coffee.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

CoffeeRepository coffeeRepository = CoffeeRepository();

class CoffeeRepository {
  final List<Coffee> coffeeList = [];

  late CoffeeApi _coffeeApi;

  CoffeeRepository._();

  static final CoffeeRepository _singleton = CoffeeRepository._();

  factory CoffeeRepository({CoffeeApi? coffeeApi}) {
    _singleton._coffeeApi = coffeeApi ?? CoffeeApi();
    return _singleton;
  }

  Future<void> getCoffeeData({bool refresh = false}) async {
    try {
      final Response<dynamic> response = await _coffeeApi.getCoffeeData();

      if (response.data is List) {
        List<dynamic> listOfDynamics = response.data;
        if (refresh) coffeeList.clear();
        for (var element in listOfDynamics) {
          coffeeList.add(Coffee.fromJson(element));
        }
      } else {}
    } catch (error) {
      debugPrint('getCoffeeData: $error');
    }
  }
}
