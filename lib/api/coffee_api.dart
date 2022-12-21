import 'package:algoriza_task/api/api_core.dart';
import 'package:algoriza_task/api/api_links.dart';
import 'package:dio/dio.dart';

class CoffeeApi {
  late ApiCore _apiCore;

  factory CoffeeApi({ApiCore? api}) {
    _singleton._apiCore = api ?? apiCore;
    return _singleton;
  }

  CoffeeApi._();

  static final CoffeeApi _singleton = CoffeeApi._();

  Future<Response<dynamic>> getCoffeeData() {
    return _apiCore.dio
        .get(coffeeLink)
        .then(
          (value) => value,
        )
        .catchError(
      (error) {
        throw error;
      },
    );
  }
}
