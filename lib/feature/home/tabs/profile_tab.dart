import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tevent/core/providers/app_language_provider.dart';
import 'package:tevent/core/providers/app_theme_provider.dart';
import 'package:tevent/core/utils/app_colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            height: 190,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/avtar.jpeg'),
                ),
               SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Mohammad Maree",
                      style: TextStyle(
                        fontSize: 19,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("mtg112@gmail.com",
                    style: TextStyle(
                      color: AppColors.whiteColor
                    ),)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.lg,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryLight),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton(
                    value: languageProvider.appLanguage,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(20),
                    items: [
                      DropdownMenuItem<String>(
                          value: 'en', child: Text('English')),
                      DropdownMenuItem<String>(
                          value: 'ar', child: Text('العربية')),
                    ],
                    onChanged: (value) {
                      languageProvider.changeLanguage(value.toString());
                    },
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryLight),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton(
                    value: themeProvider.appTheme,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text(
                            AppLocalizations.of(context)!.dark,
                          )),
                      DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text(
                            AppLocalizations.of(context)!.light,
                          )),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.changeChame(value);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
