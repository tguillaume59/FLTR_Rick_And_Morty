import 'package:flutter/material.dart';
import 'package:rick_and_morty/services/characters/models/character.dart';
import 'package:rick_and_morty/ui/common/providers/chip_provider.dart';
import 'package:rick_and_morty/ui/common/providers/material_container_provider.dart';
import 'package:rick_and_morty/ui/common/providers/progress_indicator_provider.dart';
import 'package:rick_and_morty/ui/common/providers/text_view_provider.dart';
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
                        MaterialContainerWrapContent(
                            marginTop: 100,
                            child: snapshot.hasData
                                ? Column(children: [
                                    BlackTitleTextView(
                                        text: snapshot.data.name,
                                        marginTop: 80.0),
                                    GreyBodyTextView(
                                        text: widget.profileScreenBloc
                                            .getSpeciesText(
                                                character: snapshot.data)),
                                    snapshot.data.type.isNotEmpty
                                        ? GreyBodyTextView(
                                            text: snapshot.data.type)
                                        : Container(),
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
                                          BlackBodyTextView(
                                              text: widget.profileScreenBloc
                                                  .getOriginText(
                                                      character:
                                                          snapshot.data)),
                                          BlackBodyTextView(
                                              text: "Last known location"),
                                          BlackBodyTextView(
                                              text: widget.profileScreenBloc
                                                  .getLastKnownLocationText(
                                                      character: snapshot.data))
                                        ],
                                      ),
                                    )
                                  ])
                                : CircularLoader()),
                        //endregion profile identity

                        //region episodes
                        MaterialContainerWrapContent(
                          marginTop: 20,
                          child: snapshot.hasData
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlackTitleTextView(
                                        text: "Apparitions", marginLeft: 20.0),
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
                              : CircularLoader(),
                        ),
                        //endregion episodes
                        MaterialContainerWrapContent(
                          marginTop: 20,
                          child: snapshot.hasData
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlackTitleTextView(
                                        text: "Ranking", marginLeft: 20.0),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(20),
                                      child: BlackTitleTextView(
                                          text: widget.profileScreenBloc
                                              .getRankingValue(
                                                  character: snapshot.data),
                                          fontSize: 50.0),
                                    ),
                                  ],
                                )
                              : CircularLoader(),
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
  Wrap buildChipList({List<String> lisNumEpisodes}) {
    List<Widget> listChips = [];

    lisNumEpisodes.forEach((numEpisode) {
      listChips.add(GreyChip(label: "Episode n°$numEpisode"));
    });
    return Wrap(spacing: 6.0, runSpacing: 6.0, children: listChips);
  }
//endregion
}
