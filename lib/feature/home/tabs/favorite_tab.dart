import 'package:flutter/material.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:tevent/core/widget/custom-filed.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FavoriteTab extends StatelessWidget {
   FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 80,),
          CustomTextField(
            hintText: AppLocalizations.of(context)!.search,
            prefixIcon: Icon(Icons.search,),
            
            
            
          ),
          SizedBox(height: 15,),
           Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: 24,
                itemBuilder: (context, index) {
                // return EventItemWidget(
//event: ,
                 //);
                },
              ),
            ),
        ],
      ),
    );
  }
}