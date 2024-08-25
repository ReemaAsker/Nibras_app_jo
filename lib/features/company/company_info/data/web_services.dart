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
  Future<dynamic> updateCompany(
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

    // @Path("company_name") String? companyName,
    // @Path("company_trademark") String? companyTrademark,
    // @Path("company_title_id") int? companyTitleId,
    // @Path("company_country_id") int? companyCountryId,
    // @Path("company_type_id") int? companyTypeId,
    // @Path("company_cat_id") int? companyCatId,
    // @Path("national_id") int? nationalId,
    // @Path("registration_number") String? registrationNumber,
    // @Path("phone") String? phone,
    // @Path("mobile") String? mobile,
    // @Path("email") String? email,
    // @Path("notes") String? notes,
    // @Path("a_address") int? aAddress,
    // @Path("address_desc") String? addressDesc,
    // @Path("File") MultipartFile image,
    /*

  @override
  Future<dynamic> createCompany(Company company) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    // Convert company data to a Map
    Map<String, dynamic> companyData = company.toJson();

    // Add image data to FormData
    MultipartFile? multipartFile;
    if (company.picture is Uint8List) {
      // Handle web image data
      multipartFile = MultipartFile.fromBytes(
        company.picture,
        filename: 'company_picture.png', // Adjust the filename as needed
      );
    } else if (company.picture is File) {
      // Handle mobile image data
      multipartFile = await MultipartFile.fromFile(
        company.picture.path,
        filename: company.picture.path.split('/').last,
      );
    }

    // Add image data to companyData if needed
    companyData['picture'] = multipartFile;

    // Create FormData
    FormData formData = FormData.fromMap(companyData);
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'company/create-company',
          queryParameters: queryParameters,
          data: formData,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final _value = _result.data;
    return _value;
  }


    */