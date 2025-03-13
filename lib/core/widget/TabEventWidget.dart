import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';

class Tabeventwidget extends StatelessWidget {
  Tabeventwidget({
    super.key,
    required this.eventName,
    required this.isSelected,
    required this.selectedColorr,
    required this.selectedColore,
    required this.bordorColor,
    required this.bodyColorr,
    required this.bodyColore,
    
  });
  String eventName;
  Color selectedColorr;
  Color selectedColore;
  Color bordorColor;
  Color bodyColorr;
  Color bodyColore;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? bodyColorr : bodyColore,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: bordorColor,
          width: 2,
        ),
      ),
      child: Text(
        eventName,
        style: TextStyle(color: isSelected ? selectedColorr : selectedColore),
      ),
    );
  }
}
