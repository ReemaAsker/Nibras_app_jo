part of 'company_cubit.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {
  final String message;
  CompanyLoading(this.message);
}

class CompanySuccess extends CompanyState {
  final Company company;
  final String message;

  CompanySuccess(this.company, this.message);
}

class CompanyError extends CompanyState {
  final String message;
  CompanyError(this.message);
}

// class getCompanyDetail extends CompanyState {
//   Company companyDetail;
//   getCompanyDetail({
//     required this.companyDetail,
//   });
// }

// class CreateCompany extends CompanyState {
//   Company newCompany;
//   CreateCompany({
//     required this.newCompany,
//   });
// }
