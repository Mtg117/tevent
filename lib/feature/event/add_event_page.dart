import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:tevent/core/widget/TabEventWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/core/widget/custom-filed.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  int selectedIndex = 0;
  var formKey = GlobalKey<FormState>();

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
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.createevent,
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 400,
                  height: 200,
                  child: Image.asset(
                    'assets/images/birthday.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                        isSelected:
                            selectedIndex == eventsNameList.indexOf(eventName),
                        selectedColorr: AppColors.whiteColor,
                        selectedColore: AppColors.primaryLight,
                        bordorColor: AppColors.primaryLight,
                        bodyColore: AppColors.transparentColor,
                        bodyColorr: AppColors.primaryLight,
                      );
                    },
                  ).toList()),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: AppLocalizations.of(context)!.titles,
              labelStyle: TextStyle(fontSize: 15),
              hintText: AppLocalizations.of(context)!.eventtitles,
              prefixIcon: Icon(Icons.edit, color: AppColors.blackColor),
            ),
            SizedBox(
              height: 20,
            ),
            // For Description
            CustomTextField(
              hintText: AppLocalizations.of(context)!.eventdescription,
              maxLines: 4,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.calendar_month, color: Colors.black),
                SizedBox(width: 19),
                Text(AppLocalizations.of(context)!.eventdate,style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.choosedate,
                    style: TextStyle(color: AppColors.primaryLight),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.black),
                SizedBox(width: 19),
                Text(
                 AppLocalizations.of(context)!.eventtime,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.choosetime,
                      style: TextStyle(color: AppColors.primaryLight)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.my_location_outlined,
                        color: Colors.white,
                        size: 20,
                      
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.chooselocation,
                        style: TextStyle(
                          color: AppColors.primaryLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryLight,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
                child: Text(
                 AppLocalizations.of(context)!.addevent,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
