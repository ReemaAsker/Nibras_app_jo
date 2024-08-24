import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';
import 'package:nibras_group_jor/features/Authontication/business_logic/cubit/auth_cubit.dart';
import 'package:nibras_group_jor/features/Authontication/data/repo/authRepo.dart';
import 'package:nibras_group_jor/features/Authontication/presentation/login.dart';
import 'package:nibras_group_jor/features/company/company_info/commercial_record/persons/presentation/persons.dart';
import 'package:nibras_group_jor/features/company/company_info/commercial_record/presentation/commercial_record.dart';
import 'package:nibras_group_jor/features/company/company_info/presentation/first_company_info.dart';
import 'package:nibras_group_jor/features/home/presentation/home.dart';

import '../features/Authontication/data/webservices/auth_webservice.dart';
import '../features/company/company_info/commercial_record/authorized_signatorie.dart/presentation/authorized_signatories.dart';
import '../core/helper/injection.dart';
import '../features/company/company_info/business_logic/cubit/company_cubit.dart';

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
      case commercialRecord:
        return MaterialPageRoute(builder: (_) => const CommercialRecord());
      case authorizedSignatories:
        return MaterialPageRoute(builder: (_) => const AuthorizedSignatories());
      case personsDefination:
        return MaterialPageRoute(builder: (_) => const PersonsDefination());
    }
  }
}
/*
BlocProvider(
                  create: (BuildContext context) => authCubit,
                  child: const Login(),
                ));

*/