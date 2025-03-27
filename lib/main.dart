import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tevent/AppRoutes.dart';
import 'package:tevent/core/providers/app_language_provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_theme.dart';
import 'package:tevent/feature/auth/login/login_page.dart';
import 'package:tevent/feature/auth/register/register_page.dart';
import 'package:tevent/feature/event/add_event_page.dart';
import 'package:tevent/feature/home/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/feature/home/tabs/favorite_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppThemeProvider(),
        child: MyApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppLanguageProvider(),
        child: MyApp(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: themeProvider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Locale(languageProvider.appLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.favorite: (context) => FavoriteTab(),
        AppRoutes.addEvent: (context) => AddEventPage(),
        AppRoutes.login: (context) => LoginPage(), 
        AppRoutes.register: (context) => RegisterPage(),
      },
    );
  }
}
