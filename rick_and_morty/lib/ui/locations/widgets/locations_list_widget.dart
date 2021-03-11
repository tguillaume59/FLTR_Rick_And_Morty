import 'package:flutter/material.dart';
import 'package:rick_and_morty/services/location/models/location.dart';
import 'package:rick_and_morty/ui/locations/widgets/location_list_item.dart';

class LocationListWidget extends StatelessWidget {
  LocationListWidget({Key key, this.listLocations}) : super(key: key);

  final List<Location> listLocations;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: listLocations.length,
          itemBuilder: (BuildContext context, int index) {
            return LocationListItem(location: listLocations[index]);
          },
        ));
  }
}
