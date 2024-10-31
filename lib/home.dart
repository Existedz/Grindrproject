import 'package:flutter/material.dart';
import 'package:grindernt/browse.dart';
import 'package:grindernt/favorites.dart';
import 'package:grindernt/inbox.dart';
import 'grindr_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageSelected = 0;

  Map<String, IconData> routesPair = {
    'Browse': GrindrIcons.grindr,
    'Inbox': Icons.chat_bubble,
    'Faves': Icons.star_rate
  };

  late List<String> pageTitles = routesPair.keys.toList();
  late String appBarTitle = pageTitles[pageSelected];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/thaponsak.jpg"),
          ),
        ),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(Icons.tune),
        //   ),
        // ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (pageIndex) => {
          setState(() {
            pageSelected = pageIndex;
            appBarTitle = pageTitles[pageSelected];
          })
        },
        selectedIndex: pageSelected,
        indicatorColor: Colors.transparent,
        destinations: routesPair.entries
            .map((e) => NavigationDestination(
                  icon: Icon(e.value),
                  selectedIcon: Icon(
                    e.value,
                    color: Colors.yellow,
                  ),
                  label: e.key,
                ))
            .toList(),
      ),
      body: [Browse(), Inbox(), Favorites()][pageSelected],
    );
  }
}
