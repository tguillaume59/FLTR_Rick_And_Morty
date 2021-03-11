import 'package:flutter/material.dart';
import 'package:rick_and_morty/services/location/models/location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/ui/common/providers/text_view_provider.dart';

class LocationListItem extends StatelessWidget {
  LocationListItem({Key key, this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(20),
            child: SvgPicture.asset("assets/images/ic_earth_globe.svg"),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BlackBoldBodyTextView(text: location.name),
            GreyBodyTextView(text: location.type),
            GreyBodyTextView(text: location.dimension)
          ])
        ]));
  }
}
