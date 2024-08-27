import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nibras_group_jor/features/company/company_info/data/company_repo.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_country_national.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_title.dart';

import '../../../../../core/helper/api_Exception.dart';
import '../../data/models/CompanyRgistrationStatus.dart';
import '../../data/models/company.dart';
import '../../data/models/companyInfoFromApi.dart';
import 'filterCompanies/FilterCompaniesCubit.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepo company_Repo;
  List<CompanyInfoFromApi> allCompanies = [];

  CompanyCubit(this.company_Repo) : super(CompanyInitial());

  // Future<int> lastId(BuildContext context) async {
  //   List<CompanyInfoFromApi> companies = [];
  //   try {
  //     List<CompanyInfoFromApi> companies = await filterCu.filterCompanies();
  //   } catch (e, st) {
  //     print("@@@@@@@@@@@@@");
  //     print(e);
  //     print(st);
  //   }
  //   return companies
  //       .map((company) => company.id)
  //       .reduce((a, b) => a > b ? a : b);
  // }

  // Future<int> lastId(BuildContext context) async {

  // }
  Future<int> noState() async {
    emit(NoStateLoading());
    List<CompanyInfoFromApi> companies = await company_Repo.getAllCompanies();

    int latestId =
        companies.map((company) => company.id).reduce((a, b) => a > b ? a : b);
    List<CompanyRgistrationStatus> companiesTypes = await getCompanyTypes();
    List<CompanyCountryNational> companiesNationality = await getNationals();
    List<CompanyTitle> companiesTitles = await getCompanyTitles();

    emit(NoState(
        latestId, companiesTypes, companiesNationality, companiesTitles));

    return latestId;
  }

  Future<List<CompanyRgistrationStatus>> getCompanyTypes() async {
    List<CompanyRgistrationStatus> companies =
        await company_Repo.getCompanyTypes();

    // // Map over the list and extract the companyTypeName field
    // List<String> companyTypeNames =
    //     companies.map((company) => company.compType ?? '').toList();

    return companies;
  }

  Future<List<CompanyTitle>> getCompanyTitles() async {
    List<CompanyTitle> companies = await company_Repo.getCompanyTitles();
    return companies;
  }

  Future<List<CompanyCountryNational>> getNationals() async {
    List<CompanyCountryNational> companies = await company_Repo.getCountries();

    return companies;
  }
  // Future<int> GetCompanyTitles() async {
  //   List<CompanyInfoFromApi> companies = await company_Repo.getAllCompanies();

  //   int latestId =
  //       companies.map((company) => company.id).reduce((a, b) => a > b ? a : b);

  //   emit(NoState(latestId));

  //   return latestId;
  // }

  // Future<int> GetCompanyCountries() async {
  //   List<CompanyInfoFromApi> companies = await company_Repo.getAllCompanies();

  //   int latestId =
  //       companies.map((company) => company.id).reduce((a, b) => a > b ? a : b);

  //   emit(NoState(latestId));

  //   return latestId;
  // }

  dynamic createCompany(Company newCompany) async {
    try {
      emit(CompanyLoading("يتم التحميل..."));
      var response = await company_Repo.createNewCompany(newCompany);
      emit(CompanySuccess(response, "تم انشاء المنشأة بنجاح"));
    } catch (e, s) {
      emit(CompanyError("خطأ"));

      print("t@@@@@@@@@@@@@@@@@@@");
      print("$e");
      print("$s");
      // throw _handleDioError(e);
    }
  }

  Future<void> deleteCompany(int id) async {
    try {
      // emit(CompanyLoading("يتم التحميل..."));
      bool response = await company_Repo.deleteCompany(id);
      if (response) {
        emit(CompanyDeletedSuccess(response, 'تمت عملية حذف المنشأة بنجاح !'));
      } 
      // else {
        // emit(CompanyNotFound('!الشركة المراد حذفها غير موجودة'));
      // }
    } catch (e) {
      emit(CompanyError(e.toString()));
    }
  }

  Future<void> UpdateCompany(Company company) async {
    try {
      emit(CompanyLoading("يتم التحميل..."));
      bool response = await company_Repo.updateCompany(company);
      emit(CompanyUpdatedSuccess(response, 'تمت عملية تعديل المنشأة بنجاح !'));
    } catch (e, str) {
      print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%UpdateCompany cubit%%%%%%%%%%");
      print(e);
      print(str);

      emit(CompanyError(e.toString()));
    }
  }

  Future<List<CompanyInfoFromApi>> filterCompanies() async {
    try {
      emit(CompanyFromAPILoading("يتم التحميل..."));
      allCompanies = await company_Repo.getAllCompanies();
      emit(CompanyFromAPISuccess(allCompanies, 'تم التحميل بنجاح'));
    } catch (e) {
      emit(CompanyError("$e"));
    }
    return allCompanies;
  }

  void filterData(String query) {
    List<CompanyInfoFromApi> filterCompaniesDependOnCompanyName =
        allCompanies.where((item) {
      final value = item.companyName;
      return value.toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(
        CompanySearch(filterCompaniesDependOnCompanyName, "تمت العملية بنجاح"));
  }

  // Method to handle company selection
  void selectCompany(CompanyInfoFromApi company) {
    emit(CompanySelected(company));
    // Fetch company details if needed
    fetchCompanyDetails(company.id);
  }

  // Method to fetch company details and emit display state
  void fetchCompanyDetails(int companyId) async {
    try {
      emit(CompanyFilteringLoading("يتم التحميل.."));
      // Fetch company details from API or database
      Company company = await companyData(companyId);
      emit(DisplayingDataSuccess(company));
    } catch (e) {
      emit(CompanyError('فشل تحميل البيانات'));
    }
  }

  Future<Company> companyData(int id) async {
    var companyDataById;
    try {
      // emit(CompanyLoading("يتم التحميل..."));
      companyDataById = await company_Repo.getCompanyById(id);
      // emit(DisplyingDataSuccess(
      //     companyDataById, "تم تحميل بيانات الشركة بنجاح"));
    } catch (e) {
      // emit(CompanyError("$e"));
    }
    return companyDataById;
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
}
