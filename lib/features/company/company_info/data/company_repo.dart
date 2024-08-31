import 'package:dio/dio.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/CompanyRgistrationStatus.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/companyInfoFromApi.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_country_national.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_title.dart';
import 'package:nibras_group_jor/features/company/company_info/data/web_services.dart';

// import '../../../../core/helper/api_Exception.dart';
// import '../../../../core/helper/connectivity_service.dart';

// class CompanyRepo {
//   final WebServices webservices;
//   // final ConnectivityService? connectivityService;

//   CompanyRepo(this.webservices);
//   Future<Company> getCompanyById(int id) async {
//     ApiResponse<Company> response = await webservices.getCompanyById(id);
//     return response.data;
//   }

//   Future<bool> deleteCompany(int id) async {
//     final response = await webservices.deleteCompany({'company_id': id});

//     return response.data;
//   }

//   Future<bool> updateCompany(Company updatedCompany) async {
//     // ApiResponse<dynamic>
//     dynamic response = await webservices.updateCompany(updatedCompany);
//     // print(response);
//     // print(response.code);
//     return response.success;
//   }

//   Future<List<CompanyInfoFromApi>> getAllCompanies() async {
//     ApiResponse<List<CompanyInfoFromApi>> response =
//         await webservices.getAllCompanies();
//     return response.data;
//   }

//   Future<dynamic> createNewCompany(Company newCompany) async {
//     var response;

//     response = await webservices.createCompany(newCompany);

//     return response;
//   }

//   AppException _handleError(Response response) {
//     switch (response.statusCode) {
//       case 400:
//         return BadRequestException(response.statusMessage);
//       case 401:
//       case 403:
//         return UnauthorisedException(response.statusMessage);
//       case 500:
//       default:
//         return FetchDataException(
//             'Error occurred with status code: ${response.statusCode}');
//     }
//   }

//   Future<List<CompanyRgistrationStatus>> getCompanyTypes() async {
//     ApiResponse<List<CompanyRgistrationStatus>> companies =
//         await webservices.getCompaniesTypes();

//     return companies.data;
//   }

//   Future<List<CompanyTitle>> getCompanyTitles() async {
//     ApiResponse<List<CompanyTitle>> companies =
//         await webservices.getCompaniesTitles();

//     return companies.data;
//   }

//   Future<List<CompanyCountryNational>> getCountries() async {
//     ApiResponse<List<CompanyCountryNational>> companies =
//         await webservices.getCompaniesCountries();

//     return companies.data;
//   }
// }
//   // AppException _handleDioError(DioException error) {
//   //   switch (error.type) {
//   //     case DioExceptionType.cancel:
//   //       return AppException("Request to API server was cancelled");
//   //     case DioExceptionType.connectionTimeout:
//   //       return AppException("Connection timeout with API server");
//   //     case DioExceptionType.unknown:
//   //       return FetchDataException("No Internet connection");
//   //     case DioExceptionType.receiveTimeout:
//   //       return AppException("Receive timeout in connection with API server");
//   //     case DioExceptionType.badResponse:
//   //       return _handleError(error.response!);
//   //     case DioExceptionType.sendTimeout:
//   //       return AppException("Send timeout in connection with API server");
//   //     default:
//   //       return AppException("Unexpected error occurred");
//   //   }
//   // }

import 'dart:io';

import '../../../../core/helper/api_Exception.dart'; // For SocketException

class CompanyRepo {
  final WebServices webservices;

  CompanyRepo(this.webservices);

  Future<Company> getCompanyById(int id) async {
    try {
      ApiResponse<Company> response = await webservices.getCompanyById(id);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  Future<bool> deleteCompany(int id) async {
    try {
      final response = await webservices.deleteCompany({'company_id': id});
      return response.data;
    } on DioError catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  Future<bool> updateCompany(Company updatedCompany) async {
    try {
      dynamic response = await webservices.updateCompany(updatedCompany);
      return response.success;
    } on DioError catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  Future<List<CompanyInfoFromApi>> getAllCompanies() async {
    try {
      ApiResponse<List<CompanyInfoFromApi>> response =
          await webservices.getAllCompanies();
      return response.data;
    } on DioException catch (e) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>");
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  Future<dynamic> createNewCompany(Company newCompany) async {
    try {
      var response = await webservices.createCompany(newCompany);
      return response;
    } on DioError catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  Future<List<CompanyRgistrationStatus>> getCompanyTypes() async {
    try {
      ApiResponse<List<CompanyRgistrationStatus>> companies =
          await webservices.getCompaniesTypes();
      return companies.data;
    } on DioError catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  Future<List<CompanyTitle>> getCompanyTitles() async {
    try {
      ApiResponse<List<CompanyTitle>> companies =
          await webservices.getCompaniesTitles();
      return companies.data;
    } on DioError catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  Future<List<CompanyCountryNational>> getCountries() async {
    try {
      ApiResponse<List<CompanyCountryNational>> companies =
          await webservices.getCompaniesCountries();
      return companies.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw AppException('No internet connection or server is unreachable');
    } catch (e) {
      throw AppException('An unexpected error occurred: $e');
    }
  }

  AppException _handleDioError(DioException e) {
    if (e.type == DioExceptionType.unknown && e.error is SocketException) {
      return AppException('No internet connection or server is unreachable');
    }
    // else if (e.type == DioExceptionType.r) {
    //   return _handleError(e.response!);
    // }

    else if (e.type == DioExceptionType.connectionTimeout) {
      return AppException('Connection timeout');
    } else if (e.type == DioExceptionType.sendTimeout) {
      return AppException('Send timeout');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return AppException('Receive timeout');
    } else {
      return AppException('An unexpected error occurred: ${e.message}');
    }
  }

  AppException handleError(Response response) {
    switch (response.statusCode) {
      case 400:
        return BadRequestException(response.statusMessage ?? 'Bad request');
      case 401:
      case 403:
        return UnauthorisedException(response.statusMessage ?? 'Unauthorized');
      case 500:
      default:
        return FetchDataException(
            'Error occurred with status code: ${response.statusCode}');
    }
  }
}
