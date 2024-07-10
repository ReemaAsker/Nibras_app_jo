import 'package:dio/dio.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';

class AuthWebServices {
  late Dio dio;

  AuthWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseurl, //baseurl
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20));

    dio = Dio(options);
  }

  // Future<dynamic> getUser() async {
  //   try {
  //     Response response = await dio.get('character/');
  //     // print(response.data.toString());
  //     return response.data;
  //   } catch (e) {
  //     // print(e.toString());
  //     return {};
  //   }
  // }
}
