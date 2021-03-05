import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/services/characters/character_repository.dart';
import 'package:rick_and_morty/services/characters/character_services.dart';

setupDependenciesInjection() {

  // Clients
  GetIt.I.registerSingleton<CharacterApiServices>(CharacterApiServices(Dio()));

  // Repositories
  GetIt.I.registerSingleton<CharacterRepository>(CharacterRepository(GetIt.I.get<CharacterApiServices>()));
}