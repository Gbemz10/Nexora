import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexora/app/app.bottomsheets.dart';
import 'package:nexora/app/app.dialogs.dart';
import 'package:nexora/app/app.locator.dart';
import 'package:nexora/app/app.router.dart';
import 'package:nexora/theme.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await ThemeManager.initialise();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        lightTheme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        builder: (
          BuildContext context,
          ThemeData? theme,
          ThemeData? darkTheme,
          ThemeMode? themeMode,
        ) {
          return MaterialApp(
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [StackedService.routeObserver],
            title: "Nexora",
            themeMode: themeMode,
            darkTheme: darkTheme,
            // theme: theme,
            theme: theme,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
