import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tevent/core/models/event_model.dart';
import 'package:tevent/core/utils/firebase_utils.dart';
import 'package:tevent/core/widget/EventItemWidget.dart';
import 'package:tevent/core/widget/custom-filed.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({super.key});
  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}
class _FavoriteTabState extends State<FavoriteTab> {
  List eventsList = [];
  void getFavoriteEvents() async {
    QuerySnapshot<EventModel> query = await FirebaseUtils.getEventCollection()
        .where("isFavorite", isEqualTo: true)
        .get();
    eventsList = query.docs.map((doc) {
      return doc.data();
    }).toList();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    getFavoriteEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          CustomTextField(
            hintText: AppLocalizations.of(context)!.search,
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: eventsList.length,
              itemBuilder: (context, index) {
                return EventItemWidget(
                  event: eventsList[index],
                  onUpdateFavorite: () {
                    getFavoriteEvents();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
