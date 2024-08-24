// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/filterCompanies/FilterCompanyState.dart';
// import 'package:nibras_group_jor/features/company/company_info/data/models/company.dart';

// import '../../../data/models/companyInfoFromApi.dart';
// import '../../../data/company_repo.dart';

// class FilterCompaniesCubit extends Cubit<FilterCompanyState> {
//   final CompanyRepo company_Repo;
//   FilterCompaniesCubit(this.company_Repo) : super(ShowCompanyInitial());
//   List<CompanyInfoFromApi> allCompanies = [];

//   Future<List<CompanyInfoFromApi>> filterCompanies() async {
//     try {
//       emit(ShowCompanyLoading("يتم التحميل..."));
//       allCompanies = await company_Repo.getAllCompanies();
//       emit(ShowCompanySuccess(allCompanies, 'تم التحميل بنجاح'));
//     } catch (e) {
//       emit(ShowCompanyError("$e"));
//     }
//     return allCompanies;
//   }

//   void filterData(String query) {
//     List<CompanyInfoFromApi> filterCompaniesDependOnCompanyName =
//         allCompanies.where((item) {
//       final value = item.companyName;
//       return value.toString().toLowerCase().contains(query.toLowerCase());
//     }).toList();
//     emit(
//         CompanySearch(filterCompaniesDependOnCompanyName, "تمت العملية بنجاح"));
//   }

//   Future<Company> CompanyData(int id) async {
//     var companyDataById;
//     try {
//       emit(ShowCompanyLoading("يتم التحميل..."));
//       companyDataById = await company_Repo.getCompanyById(id);
//       emit(DisplyingDataSuccess(
//           companyDataById, "تم تحميل بيانات الشركة بنجاح"));
//     } catch (e) {
//       emit(ShowCompanyError("$e"));
//     }
//     return companyDataById;
//   }
// }
