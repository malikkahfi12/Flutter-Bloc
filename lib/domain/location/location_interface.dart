import 'package:dartz/dartz.dart';
import 'package:hello_world/domain/location/location_req.dart';

abstract class LocationInterface {
  Future<Either<String, ProvinceResponse>> getAllLocationFromRajaOngkir(); 
}