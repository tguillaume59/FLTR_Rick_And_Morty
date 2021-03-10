import 'package:rick_and_morty/services/location/clients/location_services.dart';
import 'package:rick_and_morty/services/location/models/location.dart';
import 'package:rick_and_morty/services/location/models/locations_list_result.dart';

class LocationRepository {
  final LocationApiServices client;
  int totalCharacters = 0;

  LocationRepository(this.client);

  Future<List<Location>> getListLocations() async {
    LocationsListResult listLocations = await client.getLocationList();
    totalCharacters = listLocations.info.count;
    return listLocations.results;
  }

  Future<Location> getLocationById(int id) async =>
      await client.getLocationById(id);
}
