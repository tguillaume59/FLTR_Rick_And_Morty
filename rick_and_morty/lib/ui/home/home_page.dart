import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/ui/characters/characters_screen.dart';
import 'package:rick_and_morty/ui/characters/characters_screen_bloc.dart';
import 'package:rick_and_morty/ui/locations/location_screen.dart';


class HomePage extends StatefulWidget {
  HomePage({String title, Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    CharactersScreen(bloc:  GetIt.I.get<CharactersScreenBloc>()),
    LocationScreen()
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
        title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Personnages"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text("Lieux"),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}