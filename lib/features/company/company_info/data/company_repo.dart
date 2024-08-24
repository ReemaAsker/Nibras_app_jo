import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/CompanyType.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/companyInfoFromApi.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_country_national.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_title.dart';
import 'package:nibras_group_jor/features/company/company_info/data/web_services.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/helper/api_Exception.dart';

class CompanyRepo {
  final WebServices webservices;
  CompanyRepo(this.webservices);
  Future<Company> getCompanyById(int id) async {
    ApiResponse<Company> response = await webservices.getCompanyById(id);
    return response.data;
  }

  Future<bool> deleteCompany(int id) async {
    final response = await webservices.deleteCompany({'company_id': id});

    return response.data;
  }

  Future<bool> updateCompany(int id, String companyName) async {
    ApiResponse<dynamic> response = await webservices
        .updateCompany({'company_id': id, 'company_name': companyName});

    return response.success;
  }

  Future<List<CompanyInfoFromApi>> getAllCompanies() async {
    ApiResponse<List<CompanyInfoFromApi>> response =
        await webservices.getAllCompanies();
    return response.data;
  }

  Future<dynamic> createNewCompany(Company newCompany) async {
    var response;

    response = await webservices.createCompany(newCompany);

    return response;
  }

  AppException _handleError(Response response) {
    switch (response.statusCode) {
      case 400:
        return BadRequestException(response.statusMessage);
      case 401:
      case 403:
        return UnauthorisedException(response.statusMessage);
      case 500:
      default:
        return FetchDataException(
            'Error occurred with status code: ${response.statusCode}');
    }
  }

  Future<List<CompanyType>> getCompanyTypes() async {
    ApiResponse<List<CompanyType>> companies =
        await webservices.getCompaniesTypes();

    return companies.data;
  }

  Future<List<CompanyTitle>> getCompanyTitles() async {
    ApiResponse<List<CompanyTitle>> companies =
        await webservices.getCompaniesTitles();

    return companies.data;
  }

  Future<List<CompanyCountryNational>> getCountries() async {
    ApiResponse<List<CompanyCountryNational>> companies =
        await webservices.getCompaniesCountries();

    return companies.data;
  }
}
  // AppException _handleDioError(DioException error) {
  //   switch (error.type) {
  //     case DioExceptionType.cancel:
  //       return AppException("Request to API server was cancelled");
  //     case DioExceptionType.connectionTimeout:
  //       return AppException("Connection timeout with API server");
  //     case DioExceptionType.unknown:
  //       return FetchDataException("No Internet connection");
  //     case DioExceptionType.receiveTimeout:
  //       return AppException("Receive timeout in connection with API server");
  //     case DioExceptionType.badResponse:
  //       return _handleError(error.response!);
  //     case DioExceptionType.sendTimeout:
  //       return AppException("Send timeout in connection with API server");
  //     default:
  //       return AppException("Unexpected error occurred");
  //   }
  // }

