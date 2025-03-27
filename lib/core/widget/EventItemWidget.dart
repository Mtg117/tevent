import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tevent/AppRoutes.dart';
import 'package:tevent/core/models/event_model.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/utils/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventItemWidget extends StatefulWidget {
  final EventModel event;
   final VoidCallback onUpdateFavorite;
  EventItemWidget({super.key, required this.event, required this.onUpdateFavorite});

  @override
  State<EventItemWidget> createState() => _EventItemWidgetState();
}

class _EventItemWidgetState extends State<EventItemWidget> {
   bool isFavorite = false;
  void updateEventFavorite() async {
  try {
    await FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .doc(widget.event.id)
        .update({'isFavorite': !isFavorite}); 
    setState(() {
      isFavorite = !isFavorite; 
    });
    widget.onUpdateFavorite(); 
  } catch (e) {
    print("Error updating favorite: $e");
  }
  }
      @override
  void initState() {
    super.initState();
    isFavorite = widget.event.isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
            image: AssetImage("assets/images/birthday.png"), fit: BoxFit.fill),
        border: Border.all(color: AppColors.primaryLight, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  widget.event.dateTime.day.toString(),
                  style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('MMM').format(widget.event.dateTime),
                  style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.event.title),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: AppColors.redColor,
                  onPressed: () async {
                    await FirebaseUtils.deleteEvent(widget.event.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Center(
                              child: Text(
                        AppLocalizations.of(context)!.deleteEvent,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.primaryLight),
                      ))),
                    );
                    
                    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                  },
                ),
                IconButton(
                  icon:  Icon( isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,),onPressed: updateEventFavorite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
