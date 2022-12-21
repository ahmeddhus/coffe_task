import 'package:algoriza_task/api/api_links.dart';
import 'package:dio/dio.dart';

final ApiCore apiCore = ApiCore();

class ApiCore {
  factory ApiCore() => _singleton;

  ApiCore._();

  static final ApiCore _singleton = ApiCore._();

  final Dio dio = Dio();

  void init() {
    dio.options.baseUrl = baseUrl;
  }
}
