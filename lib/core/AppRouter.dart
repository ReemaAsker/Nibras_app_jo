import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';
import 'package:nibras_group_jor/features/Authontication/business_logic/cubit/auth_cubit.dart';
import 'package:nibras_group_jor/features/Authontication/data/repo/authRepo.dart';
import 'package:nibras_group_jor/features/Authontication/presentation/login.dart';
import 'package:nibras_group_jor/features/company/company_info/presentation/first_company_info.dart';
import 'package:nibras_group_jor/features/home/presentation/home.dart';

import '../features/Authontication/data/webservices/auth_webservice.dart';

class AppRouter {
  late AuthRepo authRepo;
  late AuthCubit authCubit;

  AppRouter() {
    authRepo = AuthRepo(AuthWebServices());
    authCubit = AuthCubit(authRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (
            _,
          ) =>
              Login(),
        );
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case firstCompanyInfo:
        return MaterialPageRoute(builder: (_) => const FirstCompnayInfo());
    }
  }
}
/*
BlocProvider(
                  create: (BuildContext context) => authCubit,
                  child: const Login(),
                ));

*/