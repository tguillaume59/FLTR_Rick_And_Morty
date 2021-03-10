import 'package:flutter/material.dart';
import 'package:rick_and_morty/services/characters/models/character.dart';
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
                    //region background
                    Column(
                      children: [
                        Container(
                            color: HexColor(APP_BAR_COLOR),
                            height: 200,
                            width: MediaQuery.of(context).size.width),
                        Container(color: Colors.white)
                      ],
                    ),
                    //endregion background
                    Column(
                      children: [
                        //region profile identity
                        _buildContainerWrapContent(
                            marginTop: 100,
                            child: snapshot.hasData
                                ? Column(children: [
                                    _buildCharacterNameTextView(snapshot),
                                    _buildSpeciesTextView(snapshot),
                                    _buildTypeTextView(snapshot),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 20,
                                          bottom: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildOriginTextView(snapshot),
                                          _buildBlackLeftTextView(
                                              text: "Last known location"),
                                          _buildLastKnownLocationTextView(
                                              snapshot)
                                        ],
                                      ),
                                    )
                                  ])
                                : buildLoader()),
                        //endregion profile identity

                        //region episodes
                        _buildContainerWrapContent(
                          marginTop: 20,
                          child: snapshot.hasData
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildBlackTitleTextView(
                                        text: "Apparitions", marginLeft: 20),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          top: 8,
                                          right: 20,
                                          bottom: 8),
                                      child: buildChipList(
                                          lisNumEpisodes: widget
                                              .profileScreenBloc
                                              .getListEpisodes(
                                                  snapshot.data.episode)),
                                    ),
                                  ],
                                )
                              : buildLoader(),
                        ),
                        //endregion episodes
                        _buildContainerWrapContent(
                          marginTop: 20,
                          child: snapshot.hasData
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildBlackTitleTextView(
                                        text: "Ranking", marginLeft: 20),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(20),
                                      child: _buildRankingValue(snapshot),
                                    ),
                                  ],
                                )
                              : buildLoader(),
                        )
                      ],
                    ),
                    //region character icon profile
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
                    //endregion character icon profile
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

  Wrap buildChipList({List<String> lisNumEpisodes}) {
    List<Widget> listChips = [];

    lisNumEpisodes.forEach((numEpisode) {
      listChips
          .add(_buildChip("Episode n°$numEpisode", HexColor(CHIP_BG_COLOR)));
    });

    return Wrap(spacing: 6.0, runSpacing: 6.0, children: listChips);
  }

  Container _buildContainerWrapContent({Widget child, double marginTop}) {
    return Container(
        width: (MediaQuery.of(context).size.width),
        margin:
            EdgeInsets.only(left: 15, right: 15, top: marginTop, bottom: 10),
        child: _buildMaterial(child: child));
  }

  Container _buildContainer({Widget child, double height, double marginTop}) {
    return Container(
        height: height,
        width: (MediaQuery.of(context).size.width),
        margin:
            EdgeInsets.only(left: 15, right: 15, top: marginTop, bottom: 10),
        child: _buildMaterial(child: child));
  }

  Material _buildMaterial({Widget child}) {
    return Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: child);
  }

  Widget buildLoader() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: CircularProgressIndicator());
  }

  Container _buildGreyCenterTextView({String text}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: HexColor(TEXT_COLOR_GREY),
              fontSize: 14)),
    );
  }

  Container _buildBlackLeftTextView({String text}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: HexColor(TEXT_COLOR_BLACK),
              fontSize: 14)),
    );
  }

  Container _buildBlackTitleTextView(
      {String text, double fontSize = 20, double marginTop = 10, double marginLeft = 0}) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, left: marginLeft),
      child: Text(text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: HexColor(TEXT_COLOR_BLACK),
              fontSize: fontSize)),
    );
  }

  Container _buildCharacterNameTextView(AsyncSnapshot<Character> snapshot) {
    return _buildBlackTitleTextView(text: snapshot.data.name, marginTop: 80);
  }

  Container _buildSpeciesTextView(AsyncSnapshot<Character> snapshot) {
    String text = "";
    if (snapshot.data.species.isNotEmpty) {
      text += snapshot.data.species;
    }

    if (snapshot.data.gender.isNotEmpty && text.isNotEmpty) {
      text += " - ";
    }

    if (snapshot.data.gender.isNotEmpty) {
      text += snapshot.data.gender;
    }

    return _buildGreyCenterTextView(text: text);
  }

  Container _buildTypeTextView(AsyncSnapshot<Character> snapshot) {
    if (snapshot.data.type.isNotEmpty) {
      return _buildGreyCenterTextView(text: snapshot.data.type);
    } else {
      return Container();
    }
  }

  Container _buildOriginTextView(AsyncSnapshot<Character> snapshot) {
    String text = "";
    snapshot.data.origin.isNotEmpty()
        ? text = snapshot.data.origin.name
        : text = "N/A";

    return _buildBlackLeftTextView(text: "Origin: $text");
  }

  Container _buildLastKnownLocationTextView(AsyncSnapshot<Character> snapshot) {
    String lastKnowLocation = "";
    snapshot.data.location.isNotEmpty()
        ? lastKnowLocation = snapshot.data.location.name
        : lastKnowLocation = "N/A";

    return _buildBlackLeftTextView(text: lastKnowLocation);
  }

  Container _buildRankingValue(AsyncSnapshot<Character> snapshot){
    String text = "N°${snapshot.data.id}/${widget.profileScreenBloc.getTotalCharacters()}";
    return _buildBlackTitleTextView(
        text: text,
        fontSize: 50);
  }
//endregion
}
