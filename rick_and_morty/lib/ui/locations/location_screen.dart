import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/common/providers/progress_indicator_provider.dart';
import 'package:rick_and_morty/ui/locations/location_screen_bloc.dart';
import 'package:rick_and_morty/ui/locations/widgets/locations_list_widget.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key key, this.bloc}) : super(key: key);

  final LocationScreenBloc bloc;

  @override
  _LocationScreenState createState() {
    return _LocationScreenState();
  }
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    /**
     * Astuce pour faire de l'async dans le initState
     */
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    //widget.bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await _loadData(),
      child: StreamBuilder(
          stream: widget.bloc.listLocations,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return LocationListWidget(listLocations: snapshot.data);
            }
            if (snapshot.hasError) {
              return Text("Erreur");
            }
            return CircularLoader();
          }),
    );
  }

  //region functions
  _loadData() async {
    await widget.bloc.loadLocations();
  }
//endregion
}