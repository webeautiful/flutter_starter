import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_starter/router.dart';
import 'package:flutter_starter/store/theme.dart';
import 'package:flutter_starter/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // theme
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: Colors.redAccent,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
      ),
      themeMode: ref.watch(themeProvider),

      // route
      routerConfig: appRouter,
      // routeInformationProvider: appRouter.routeInformationProvider,
      // routeInformationParser: appRouter.routeInformationParser,
      // routerDelegate: appRouter.routerDelegate,

      // l10n
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Toast
      builder: FlutterSmartDialog.init(),
    );
  }
}

/// Global helpers for readability
