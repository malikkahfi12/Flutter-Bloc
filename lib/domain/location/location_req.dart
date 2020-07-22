import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hello_world/domain/location/province_data.dart';
part 'location_req.freezed.dart';
part 'location_req.g.dart';

@freezed
abstract class LocationReq with _$LocationReq{
  factory LocationReq.rajaOngkir(ProvinceResponse rajaOngkir) = RajaOngkir;

  factory LocationReq.provinceResponse(
    List<dynamic> query, 
    ProvinceStatusData status, 
    List<ProvinceResultData> results) = ProvinceResponse;

  factory LocationReq.fromJson(Map<String, dynamic> json) => 
  _$LocationReqFromJson(json); 
}