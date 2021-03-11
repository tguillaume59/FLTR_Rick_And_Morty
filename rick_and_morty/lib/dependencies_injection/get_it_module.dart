import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/services/characters/repositories/character_repository.dart';
import 'package:rick_and_morty/services/characters/clients/character_services.dart';
import 'package:rick_and_morty/services/location/repositories/location_repository.dart';
import 'package:rick_and_morty/services/location/clients/location_services.dart';
import 'package:rick_and_morty/ui/characters/characters_screen_bloc.dart';
import 'package:rick_and_morty/ui/common/providers/text_view_provider.dart';
import 'package:rick_and_morty/ui/locations/location_screen_bloc.dart';
import 'package:rick_and_morty/ui/profile/profile_screen_bloc.dart';

setupDependenciesInjection() {

  // Clients
  GetIt.I.registerSingleton<CharacterApiServices>(CharacterApiServices(Dio()));
  GetIt.I.registerSingleton<LocationApiServices>(LocationApiServices(Dio()));

  // Repositories
  GetIt.I.registerSingleton<CharacterRepository>(CharacterRepository(GetIt.I.get<CharacterApiServices>()));
  GetIt.I.registerSingleton<LocationRepository>(LocationRepository(GetIt.I.get<LocationApiServices>()));

  // Blocs
  GetIt.I.registerSingleton<CharactersScreenBloc>(CharactersScreenBloc(GetIt.I.get<CharacterRepository>()));
  GetIt.I.registerSingleton<ProfileScreenBloc>(ProfileScreenBloc(GetIt.I.get<CharacterRepository>()));
  GetIt.I.registerSingleton<LocationScreenBloc>(LocationScreenBloc(GetIt.I.get<LocationRepository>()));

  // UI Providers
  GetIt.I.registerSingleton<TextViewProvider>(TextViewProvider());
}