import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:tevent/core/widget/TabEventWidget.dart';

class HomeTab extends StatefulWidget {
  HomeTab({
    super.key,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.eating,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.whiteColor,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Qamar Maree",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Icon(Icons.sunny),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "EN",
                    style:
                        TextStyle(color: AppColors.primaryLight, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 24,
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      "Nablus,Palestine",
                      style:
                          TextStyle(color: AppColors.whiteColor, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                DefaultTabController(
                  length: eventsNameList.length,
                  child: TabBar(
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      indicatorColor: AppColors.transparentColor,
                      dividerColor: AppColors.transparentColor,
                      isScrollable: true,
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      tabAlignment: TabAlignment.start,
                      tabs: eventsNameList.map(
                        (eventName) {
                          return Tabeventwidget(
                              eventName: eventName,
                              isSelected: selectedIndex ==
                                  eventsNameList.indexOf(eventName));
                        },
                      ).toList()),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: 24,
              itemBuilder: (context, index) {
                return EventItemWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
