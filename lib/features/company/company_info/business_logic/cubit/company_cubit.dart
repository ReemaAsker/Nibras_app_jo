import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nibras_group_jor/features/company/company_info/data/company_repo.dart';

import '../../data/company.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepo company_Repo;
  CompanyCubit(this.company_Repo) : super(CompanyInitial());

  Future<void> getCompanyById(int id) async {
    try {
      emit(CompanyLoading("يتم التحميل..."));
      var response = await company_Repo.getCompanyById(id);
      emit(CompanySuccess(response, 'تمت عملية انشاء المنشأة بنجاح !'));
    } catch (e) {
      emit(CompanyError(e.toString()));
    }
  }

  void emitCreateCompany(Company newCompany) async {
    // try {
    // emit(CompanyLoading("يتم التحميل..."));
    print("^^^^^^^^^^^^^^^^^^");
    var response = await company_Repo.createNewCompany(newCompany).then(
      (value) {
        print("{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}");
        print(value);
        print("{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}");
      },
    );
    print(response);
    emit(CompanySuccess(response, "ok"));
    // } on DioException catch (dioError) {
    //   String errorMessage;
    //   if (dioError.response != null && dioError.response?.data != null) {
    //     errorMessage =
    //         dioError.response?.data['message'] ?? 'An unknown error occurred';
    //   } else {
    //     errorMessage = dioError.response!.statusMessage!;
    //   }

    // emit(CompanyError(errorMessage));
    // } catch (e) {
    //   print("================================");
    //   print(e);
    //   print("================================");
    //   emit(CompanyError(e.toString()));
    // }
  }
  // try {
  //   emit(CompanyLoading("يتم التحميل..."));
  //   var response = await company_Repo.createNewCompany(newCompany);
  //   emit(CompanySuccess(response, 'تمت عملية انشاء المنشأة بنجاح !'));
  // } catch (e) {
  //   emit(CompanyError(e.toString()));
  // }

  //////////////////////
  // company_Repo.createNewCompany(newCompany).then((newCompany) {
  //   emit(CreateCompany(newCompany: newCompany));
  // });
}
