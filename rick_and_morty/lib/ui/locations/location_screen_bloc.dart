import 'package:rick_and_morty/services/location/models/location.dart';
import 'package:rick_and_morty/services/location/repositories/location_repository.dart';
import 'package:rick_and_morty/ui/common/base_classes/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LocationScreenBloc extends BaseBloc {
  LocationScreenBloc(this._locationRepository);

  final LocationRepository _locationRepository;

  ///
  /// - Lifecycle - ///
  ///
  @override
  void dispose() {
    _listLocationStream.close();
  }

  ///
  /// - Streams - ///
  ///
  final _listLocationStream = PublishSubject<List<Location>>();

  Stream<List<Location>> get listLocations => _listLocationStream.stream;

  ///
  /// - API request - ///
  ///
  loadLocations() async {
    var result = await _locationRepository.getListLocations();
    _listLocationStream.sink.add(result);
    //_listCharactersStream.sink.addError(); //todo
  }
}
