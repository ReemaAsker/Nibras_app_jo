import 'package:get_it/get_it.dart';
import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/company_cubit.dart';
import 'package:nibras_group_jor/features/company/company_info/data/web_services.dart';
import 'package:nibras_group_jor/features/company/company_info/data/company_repo.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<CompanyCubit>(() => CompanyCubit(getIt()));

  getIt.registerLazySingleton<CompanyRepo>(() => CompanyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 1 * 1000)
    ..options.receiveTimeout = Duration(seconds: 10 * 1000);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: true,
    requestBody: true,
    request: true,
  ));
  return dio;
}
