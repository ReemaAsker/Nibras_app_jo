import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/AppRouter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
