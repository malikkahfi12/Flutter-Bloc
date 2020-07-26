

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hello_world/domain/location/location_failure.dart';
import 'package:hello_world/domain/location/location_interface.dart';
import 'package:hello_world/domain/location/location_req.dart';
import 'package:hello_world/domain/location/province_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocationInterface)
class LocationRepository extends LocationInterface {
  Dio dio;
  LocationRepository(this.dio);

  @override
  Future<Either<LocationFailure, ProvinceResponse>>
      getAllLocationFromRajaOngkir() async {
    dio = Dio();
    Response response;
    try {
      response = await dio.get("https://api.rajaongkir.com/starter/province",
          options:
              Options(headers: {"key": "f2e3b99c86cb0052ecb45e442d9b9e86"}));
      final _result = response.data['rajaongkir'];
      final data = ProvinceResponse.fromJson(_result);
      return right(data);
    } on DioError catch (err) {
      switch(err.response.statusCode){
        case 400 :
        final errorData = err.response.data['rajaongkir']['status'];
        final data = ProvinceStatusData.fromJson(errorData);
        return left(LocationFailure.badRequest(data.description));
        break;
        case 404 : 
        return left(LocationFailure.notFound("Not Found"));
        default :
        return left(LocationFailure.serverError());
        break;
      }
      
    } 
  }
}
