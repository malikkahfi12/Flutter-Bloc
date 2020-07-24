import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hello_world/domain/location/location_interface.dart';
import 'package:hello_world/domain/location/location_req.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this._locationInterface) : super(LocationState.initial());
  LocationInterface _locationInterface;
  
  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    yield* event.map(
        getLocationProvince: (e) async* {
          yield LocationState.provinceDataOptions(
              onLoading: true, dataProvince: none());
          final _result =
              await _locationInterface.getAllLocationFromRajaOngkir();
          yield LocationState.provinceDataOptions(
              onLoading: false, dataProvince: some(_result));
        },
        getLocationCity: (e) async*{},
    );
  }
}
