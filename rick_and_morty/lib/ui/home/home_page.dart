import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/ui/characters/characters_screen.dart';
import 'package:rick_and_morty/ui/characters/characters_screen_bloc.dart';
import 'package:rick_and_morty/ui/common/providers/text_view_provider.dart';
import 'package:rick_and_morty/ui/locations/location_screen.dart';
import 'package:rick_and_morty/ui/locations/location_screen_bloc.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

class HomePage extends StatefulWidget {
  HomePage({this.headerTitle, Key key}) : super(key: key);

  String headerTitle;

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CharactersScreen(bloc: GetIt.I.get<CharactersScreenBloc>()),
    LocationScreen(bloc: GetIt.I.get<LocationScreenBloc>())
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(APP_BAR_COLOR),
        title: Text(widget.headerTitle),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor(APP_BAR_COLOR),
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              title: NavBarItemTextView(text: "Personnage")),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail, color: Colors.white),
            title: NavBarItemTextView(text: "Lieux"),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        widget.headerTitle = "Personnage";
        break;
      case 1:
        widget.headerTitle = "Lieux";
        break;
      default:
        widget.headerTitle = "My Flutter App";
        break;
    }

    setState(() {
      _currentIndex = index;
    });
  }
}
