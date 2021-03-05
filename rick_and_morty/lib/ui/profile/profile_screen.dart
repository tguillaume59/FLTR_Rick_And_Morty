import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/characters/character.dart';
import 'package:rick_and_morty/ui/profile/profile_screen_bloc.dart';
import 'package:rick_and_morty/utils/color/colors.dart';
import 'package:rick_and_morty/utils/color/hex_color.dart';

/**
 * MediaQuery.of(context).size.height,
 */
class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.profileScreenBloc, this.id}) : super(key: key);

  final ProfileScreenBloc profileScreenBloc;
  final int id;

  @override
  _ProfileScreenState createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadCharacter();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: HexColor(APP_BAR_COLOR),
          elevation: 0,
        ),
        body: StreamBuilder(
            stream: widget.profileScreenBloc.character,
            builder: (context, AsyncSnapshot<Character> snapshot) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                            color: HexColor(APP_BAR_COLOR),
                            height: 200,
                            width: MediaQuery.of(context).size.width),
                        Container(color: Colors.white)
                      ],
                    ),
                    Column(
                      children: [
                        buildContainer(marginTop: 100, child: Container()),
                        buildContainer(
                            marginTop: 20,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              margin: EdgeInsets.all(8),
                              child: buildChipList(listEpisodes: [
                                "Épisode 1",
                                "Épisode 1",
                                "Épisode 30",
                                "Épisode 1",
                                "Épisode 100",
                                "Épisode 1",
                                "Épisode 286"
                              ]),
                            ))
                      ],
                    ),
                    snapshot.hasData
                        ? Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 40),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(snapshot.data.image),
                              ),
                              radius: 60.0,
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            }));
  }

  //region functions
  _loadCharacter() async {
    /**
     * Astuce pour faire de l'async dans le initState
     */
    await widget.profileScreenBloc.fetchCharacter(widget.id);
  }

//endregion

//region build UI
  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

  Wrap buildChipList({List<String> listEpisodes}) {
    List<Widget> listChips = [];

    listEpisodes.forEach((episode) {
      listChips.add(_buildChip(episode, HexColor(CHIP_BG_COLOR)));
    });

    return Wrap(spacing: 6.0, runSpacing: 6.0, children: listChips);
  }

  Container buildContainer({Widget child, double marginTop}) {
    return Container(
      height: 300,
      width: (MediaQuery.of(context).size.width),
      margin: EdgeInsets.only(left: 15, right: 15, top: marginTop, bottom: 10),
      child: Material(
          elevation: 5,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: child),
    );
  }
//endregion
}
