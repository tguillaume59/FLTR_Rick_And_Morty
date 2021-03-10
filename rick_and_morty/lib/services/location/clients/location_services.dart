import 'package:dio/src/dio.dart';
import 'package:rick_and_morty/services/common/base_services.dart';
import 'package:rick_and_morty/services/location/models/location.dart';
import 'package:rick_and_morty/services/location/models/locations_list_result.dart';

class LocationApiServices extends BaseApiServices {
  LocationApiServices(Dio dio) : super(dio);

  Future<List<Location>> getOnlyLocationList() async {
    var data = await getData("/location");
    List<dynamic> locationData = data['results'];
    List<Location> locationsList =
        locationData.map((f) => Location.fromJson(f)).toList();
    return locationsList;
  }

  Future<LocationsListResult> getLocationList() async {
    var data = await getData("/location");
    LocationsListResult locationsList = LocationsListResult.fromJson(data);
    return locationsList;
  }

  Future<Location> getLocationById(int id) async {
    var data = await getData("/location/$id");
    Location location = Location.fromJson(data);
    return location;
  }
}
