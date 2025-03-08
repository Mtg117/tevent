import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class Tabeventwidget extends StatelessWidget {
  Tabeventwidget({super.key, required this.eventName,required this.isSelected});
  String eventName;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      decoration: BoxDecoration(
        color:isSelected?AppColors.whiteColor:AppColors.transparentColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 2,
        ),
      ),
      child: Text(eventName,style: TextStyle(color:isSelected? AppColors.primaryLight:AppColors.whiteColor),),
    );
  }
}
