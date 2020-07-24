

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hello_world/domain/location/location_interface.dart';
import 'package:hello_world/domain/location/location_req.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LocationInterface)
class LocationRepository extends LocationInterface {
  Dio dio;
  LocationRepository(this.dio);

  @override
  Future<Either<String, ProvinceResponse>>
      getAllLocationFromRajaOngkir() async {
    dio = Dio();
    Response response;
    try {
      response = await dio.get("https://api.rajaongkir.com/starter/province",
          options:
              Options(headers: {"key": "f2e3b99c86cb0052ecb45e442d9b9e86"}));
      final _result = response.data['rajaongkir'];
      print(_result.toString());
      final data = ProvinceResponse.fromJson(_result);
      print(data.status.code);
      return right(data);
    } catch (e) {
      print(e);
      return left(e.toString());
    }
  }
}
