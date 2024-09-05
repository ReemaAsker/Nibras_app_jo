part of 'company_cubit.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {
  final String message;
  CompanyLoading(this.message);
}

class CompanySuccess extends CompanyState {
  final String message;

  CompanySuccess(this.message);
}

class CompanyFromAPISuccess extends CompanyState {
  final dynamic company;
  final String message;

  CompanyFromAPISuccess(this.company, this.message);
}

class CompanyFromAPIError extends CompanyState {
  final dynamic company;

  CompanyFromAPIError(this.company);
}

class CompanyError extends CompanyState {
  final String message;
  CompanyError(this.message);
}

class CompanyInternetError extends CompanyState {
  CompanyInternetError();
}

class CompanyFromAPILoading extends CompanyState {
  final String message;
  CompanyFromAPILoading(this.message);
}

class CompanyFilteringLoading extends CompanyState {
  final String message;
  CompanyFilteringLoading(this.message);
}

class CompanyDeletedSuccess extends CompanyState {
  final String message;
  final bool isDeleted;

  CompanyDeletedSuccess(
    this.isDeleted,
    this.message,
  );
}

class CompanyUpdatedSuccess extends CompanyState {
  final bool isUpdated;

  final String message;
  CompanyUpdatedSuccess(
    this.isUpdated,
    this.message,
  );
}

class CompanySearch extends CompanyState {
  final dynamic data;
  final String message;

  CompanySearch(this.data, this.message);
}

class DisplyingDataSuccess extends CompanyState {
  final Company data;
  final String message;

  DisplyingDataSuccess(this.data, this.message);
}

class CompanySelected extends CompanyState {
  final CompanyInfoFromApi selectedCompany;
  CompanySelected(this.selectedCompany);
}

class DisplayingDataSuccess extends CompanyState {
  final Company data;
  DisplayingDataSuccess(this.data);
}

class DisplayingDataError extends CompanyState {
  final String data;
  DisplayingDataError(this.data);
}

class NoState extends CompanyState {
  final int lastId;
  final List<CompanyRgistrationStatus> companyRgistrationStatus;
  final List<CompanyCountryNational> nationalites;
  final List<CompanyTitle> CompanyTitles;
  NoState(this.lastId, this.companyRgistrationStatus, this.nationalites,
      this.CompanyTitles);
}

class NoStateLoading extends CompanyState {
  NoStateLoading();
}
