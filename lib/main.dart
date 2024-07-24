import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/AppRouter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

void main() {
  runApp(NibrasApp(
    appRouter: AppRouter(),
  ));
}

class NibrasApp extends StatelessWidget {
  const NibrasApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
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
    );
  }
}
