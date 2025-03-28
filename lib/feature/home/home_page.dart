import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevent/AppRoutes.dart';
import 'package:tevent/feature/event/add_event_page.dart';
import 'package:tevent/feature/home/tabs/favorite_tab.dart';
import 'package:tevent/feature/home/tabs/home_tab.dart';
import 'package:tevent/feature/home/tabs/map_tab.dart';
import 'package:tevent/feature/home/tabs/profile_tab.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
     HomeTab(),
      MapTab(),
      FavoriteTab(),
      ProfileTab()
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
   Navigator.pushNamed(context,AppRoutes.addEvent);
              
      },child: Icon(Icons.add),),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
             selectedIndex = value;
          });
        },
        items:[
       BottomNavigationBarItem(icon: Icon(Icons.home), label:AppLocalizations.of(context)!.home),
       BottomNavigationBarItem(icon: Icon(Icons.map), label:AppLocalizations.of(context)!.map),
       BottomNavigationBarItem(icon: Icon(Icons.favorite), label: AppLocalizations.of(context)!.favorite),
       BottomNavigationBarItem(icon: Icon(Icons.person),label: AppLocalizations.of(context)!.profile),
      ] ),
    );
  }
}