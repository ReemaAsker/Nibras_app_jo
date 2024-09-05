import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibras_group_jor/features/company/company_info/data/company_repo.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_country_national.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_title.dart';

import '../../../../../core/helper/api_Exception.dart';
import '../../data/models/CompanyRgistrationStatus.dart';
import '../../data/models/company.dart';
import '../../data/models/companyInfoFromApi.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepo companyRepo;
  List<CompanyInfoFromApi> allCompanies = [];
  bool haveInternet = true;
  bool search = false;
  bool appearCompanyData = false;

  CompanyCubit(this.companyRepo) : super(CompanyInitial());

  void toggleSearch() {
    search = !search;
  }

  Future<int> noState() async {
    appearCompanyData = false;
    haveInternet = true;
    int latestId = 0;
    emit(NoStateLoading());
    try {
      List<CompanyInfoFromApi> companies = await companyRepo.getAllCompanies();
      latestId = companies
          .map((company) => company.id)
          .reduce((a, b) => a > b ? a : b);

      List<CompanyRgistrationStatus> companiesTypes = await getCompanyTypes();
      List<CompanyCountryNational> companiesNationality = await getNationals();
      List<CompanyTitle> companiesTitles = await getCompanyTitles();
      haveInternet = true;
      search = false;

      emit(NoState(
          latestId, companiesTypes, companiesNationality, companiesTitles));
    } on AppException catch (e) {
      haveInternet = false;
      emit(CompanyInternetError());
    } on SocketException {
      haveInternet = false;
      emit(CompanyInternetError());
    } catch (e) {
      emit(CompanyError('حدث خطأ'));
    }
    return latestId;
  }

  Future<List<CompanyRgistrationStatus>> getCompanyTypes() async {
    try {
      return await companyRepo.getCompanyTypes();
    } on SocketException {
      emit(CompanyInternetError());
      return [];
    } on AppException catch (e) {
      emit(CompanyInternetError());
      return [];
    } catch (e) {
      emit(CompanyError('حدث خطأ'));
      return [];
    }
  }

  Future<List<CompanyTitle>> getCompanyTitles() async {
    try {
      return await companyRepo.getCompanyTitles();
    } on SocketException {
      emit(CompanyInternetError());
      return [];
    } on AppException catch (e) {
      emit(CompanyInternetError());
      return [];
    } catch (e) {
      emit(CompanyError('حدث خطأ'));
      return [];
    }
  }

  Future<List<CompanyCountryNational>> getNationals() async {
    try {
      return await companyRepo.getCountries();
    } on SocketException {
      emit(CompanyInternetError());
      return [];
    } on AppException catch (e) {
      emit(CompanyInternetError());
      return [];
    } catch (e) {
      emit(CompanyError('حدث خطأ'));
      return [];
    }
  }

  Future<void> createCompany(Company newCompany) async {
    emit(CompanyLoading("تحميل..."));
    try {
      var response = await companyRepo.createNewCompany(newCompany);
      haveInternet = true;

      emit(CompanySuccess("تم انشاء الشركة بنجاح"));
    } on SocketException {
      haveInternet = false;
      emit(CompanyInternetError());
    } on AppException catch (e) {
      haveInternet = false;
      emit(CompanyInternetError());
    } catch (e) {
      emit(CompanyError('حدث خطأ'));
    }
  }

  Future<void> deleteCompany(int id) async {
    try {
      bool response = await companyRepo.deleteCompany(id);
      if (response) {
        haveInternet = true;

        emit(CompanyDeletedSuccess(response, 'تم حذف الشركة بنجاح'));
      } else {
        emit(CompanyError('حدث خطأ'));
      }
    } on SocketException {
      haveInternet = false;

      emit(CompanyInternetError());
    } on AppException catch (e) {
      haveInternet = false;

      emit(CompanyInternetError());
    } catch (e) {
      haveInternet = false;

      emit(CompanyError('حدث خطأ'));
    }
  }

  Future<void> updateCompany(Company company) async {
    emit(CompanyLoading("تحميل..."));
    try {
      bool response = await companyRepo.updateCompany(company);
      haveInternet = true;

      emit(CompanyUpdatedSuccess(response, 'تم تعديل بيانات الشركة بنجاح'));
    } on SocketException {
      haveInternet = false;
      emit(CompanyInternetError());
    } on AppException catch (e) {
      haveInternet = false;

      emit(CompanyInternetError());
    } catch (e) {
      haveInternet = false;

      emit(CompanyError('حدث خطأ'));
    }
  }

  Future<void> filterCompanies() async {
    emit(CompanyFromAPILoading("تحميل..."));
    try {
      allCompanies = await companyRepo.getAllCompanies();
      search = true;
      haveInternet = true;
      appearCompanyData = false;
      emit(CompanyFromAPISuccess(allCompanies, 'تم تحميل البيانات بنجاح'));
    } catch (e) {
      appearCompanyData = false;

      emit(CompanyFromAPIError(null));
    }
  }

  void filterData(String query) {
    List<CompanyInfoFromApi> filteredCompanies = allCompanies.where((item) {
      final value = item.companyName;
      return value.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(CompanySearch(filteredCompanies, "تم البحث بنجاح"));
  }

  // void selectCompany(CompanyInfoFromApi company) {
  //   emit(CompanySelected(company));
  //   fetchCompanyDetails(company.id);
  // }

  Future<void> fetchCompanyDetails(int companyId) async {
    emit(CompanyFilteringLoading("تحميل..."));
    try {
      Company company = await companyRepo.getCompanyById(companyId);
      search = false;
      appearCompanyData = true;
      haveInternet = true;

      // toggleSearch();
      emit(DisplayingDataSuccess(company));
    } catch (e) {
      search = false;

      appearCompanyData = true;
      haveInternet = false;
      emit(DisplayingDataError('حدث خطأ'));
    }
  }
}
