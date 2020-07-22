// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/get_it_helper.dart';

import 'application/location/location_bloc.dart';
import 'domain/location/location_interface.dart';
import 'infrastructure/core/dio_injectable_module.dart';
import 'infrastructure/location/location_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  final dioInjectableModule = _$DioInjectableModule();
  gh.lazySingleton<Dio>(() => dioInjectableModule.dio);
  gh.factory<LocationInterface>(() => LocationRepository(g<Dio>()));
  gh.factory<LocationBloc>(() => LocationBloc(g<LocationInterface>()));
}

class _$DioInjectableModule extends DioInjectableModule {}
