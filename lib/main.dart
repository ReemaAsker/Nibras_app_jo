import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nibras_group_jor/core/AppRouter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/helper/injection.dart';

import 'features/company/company_info/business_logic/cubit/company_cubit.dart';

void main() {
  initGetIt();
  runApp(NibrasApp(
    appRouter: AppRouter(),
  ));
}

class NibrasApp extends StatelessWidget {
  const NibrasApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<CompanyCubit>(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: MyColors
                .custom_yellow, // Change this to the color you want for AppBar
          ),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        supportedLocales: const [
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: Locale('ar'),
      ),
    );
  }
}
