import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_language_provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';

class PeofilePage extends StatelessWidget {
  const PeofilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
           
            fontSize: 25,
          ),
        ),
       
      ),
      body: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.lg,
            style: TextStyle( fontWeight: FontWeight.bold,fontSize: 30),
          ),
          DropdownButton(
            value: languageProvider.appLanguage,
            isExpanded: true,
            items: [
              DropdownMenuItem<String>(value: 'en', child: Text('English')),
              DropdownMenuItem<String>(value: 'ar', child: Text('العربية')),
            ],
            onChanged: (value) {
              languageProvider.changeLanguage(value.toString());
            },
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle( fontWeight: FontWeight.bold,fontSize: 30),
          ),
          DropdownButton(
            value: themeProvider.appTheme,
            isExpanded: true,
            items: [
              DropdownMenuItem(value: ThemeMode.dark, child: Text(AppLocalizations.of(context)!.dark,)),
              DropdownMenuItem(value: ThemeMode.light, child: Text(AppLocalizations.of(context)!.light,)),
            ],
            onChanged: (value) {
             if(value != null){
              themeProvider.changeChame(value);
             }
            },
          )
        ],
      ),
    );
  }
}
