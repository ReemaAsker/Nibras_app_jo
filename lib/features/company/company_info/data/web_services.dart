import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:nibras_group_jor/features/company/company_info/data/company.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://srv568036.hstgr.cloud/api/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('company/get-company')
  Future<Company> grtCompanyById(@Path('id') int id);
  @POST("/company/create-company")
  // @Headers(<String, dynamic>{
  //   'Accept': 'application/json',
  //   'Content-Type': 'application/x-www-form-urlencoded'
  // })
  Future<Company> createCompany(
    @Body() Company newCompany,
  );
}
