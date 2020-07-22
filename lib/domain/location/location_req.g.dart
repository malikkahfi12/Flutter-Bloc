// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RajaOngkir _$_$RajaOngkirFromJson(Map<String, dynamic> json) {
  return _$RajaOngkir(
    json['rajaOngkir'] == null
        ? null
        : ProvinceResponse.fromJson(json['rajaOngkir'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$RajaOngkirToJson(_$RajaOngkir instance) =>
    <String, dynamic>{
      'rajaOngkir': instance.rajaOngkir,
    };

_$ProvinceResponse _$_$ProvinceResponseFromJson(Map<String, dynamic> json) {
  return _$ProvinceResponse(
    json['query'] as List,
    json['status'] == null
        ? null
        : ProvinceStatusData.fromJson(json['status'] as Map<String, dynamic>),
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : ProvinceResultData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$ProvinceResponseToJson(_$ProvinceResponse instance) =>
    <String, dynamic>{
      'query': instance.query,
      'status': instance.status,
      'results': instance.results,
    };
