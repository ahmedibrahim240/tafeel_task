import 'package:dio/dio.dart';

// import '../helpers/constants.dart';
// import '../helpers/shared_pref_helper.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      _addDioHeaders();
      // addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addDioHeaders({String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      "connection": "Keep-Alive",
      "x-api-key": "reqres-free-v1",
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _addDioHeaders(token: token);
  }

  // static void addDioInterceptor() {
  //   dio?.interceptors.add(
  //     PrettyDioLogger(
  //       requestBody: true,
  //       requestHeader: true,
  //       responseHeader: true,
  //     ),
  //   );
  // }
}
