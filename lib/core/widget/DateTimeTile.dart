import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateTimeTile extends StatelessWidget {
  final String title;
  final DateTime? selectedDate;
  final VoidCallback onPressed;

  DateTimeTile({required this.title,  this.selectedDate, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListTile(
          leading: Icon(Icons.date_range),
          title: Text(title),
          subtitle: Text(
            selectedDate == null
                ?   AppLocalizations.of(context)!.choosedate
                : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
          ),
          onTap: onPressed,
        ),
      ],
    );
  }
}
