part of 'location_bloc.dart';

@freezed
abstract class LocationEvent with _$LocationEvent {
  factory LocationEvent.getLocationData() = GetLocationCity;
  factory LocationEvent.getLocationProvince() = GetLocationProvince;
}
