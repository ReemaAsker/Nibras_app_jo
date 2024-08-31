import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/companyInfoFromApi.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_country_national.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_title.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company.dart';

import 'models/CompanyRgistrationStatus.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://srv568036.hstgr.cloud/api/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  @GET('get-company_type')
  Future<ApiResponse<List<CompanyRgistrationStatus>>> getCompaniesTypes();
  @GET('get-titles')
  Future<ApiResponse<List<CompanyTitle>>> getCompaniesTitles();
  @GET('get-countries')
  Future<ApiResponse<List<CompanyCountryNational>>> getCompaniesCountries();
  @GET('company/get-company/')
  Future<ApiResponse<Company>> getCompanyById(
      @Query("company_id") int companyId);
  @GET('company/get-company/')
  // Future<ApiResponse<dynamic>> getFullAddress(@Query("area_id") int area_id);
  @DELETE('company/delete-company')
  Future<ApiResponse<bool>> deleteCompany(@Body() Map<String, int> companyData);
  @POST('company/update-company')
  @MultiPart()
  Future<ApiResponse<dynamic>> updateCompany(
    @Body() Company company,
  );
  @GET('company/get-companies')
  Future<ApiResponse<List<CompanyInfoFromApi>>> getAllCompanies();
  @POST("company/create-company")
  @MultiPart()
  Future<dynamic> createCompany(
    @Body() Company company,
  );
}

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final int code;
  final T data;

  ApiResponse({
    required this.success,
    required this.code,
    required this.data,
  });
  // Factory constructor for creating a new ApiResponse instance from a map
  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  // Method for serializing ApiResponse instance to a map
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
