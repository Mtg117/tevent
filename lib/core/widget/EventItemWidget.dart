import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical:10),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
            image: AssetImage("assets/images/birthday.png"), fit: BoxFit.fill),
        border: Border.all(color: AppColors.primaryLight, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "22",
                  style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Feb. ",
                  style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
