import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/application/location/location_bloc.dart';
import 'package:hello_world/domain/location/location_req.dart';
import 'package:hello_world/injection.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _errorMessage;
  ProvinceResponse _provinceResponse;
  @override
  void initState() {
    _errorMessage = "";
    _provinceResponse = null;
    super.initState();
  }

  void locationBlocListener(BuildContext context, LocationState state) {
    state.maybeMap(
        orElse: () {},
        provinceDataOptions: (e) => e.dataProvince.fold(
            () => {},
            (a) => a.fold(
                  (l) {
                    l.map(
                        notFound: (e) => _errorMessage = e.msg,
                        badRequest: (e) => _errorMessage = e.badRequest,
                        serverError: (e) => _errorMessage = "Server Error");
                    FlushbarHelper.createError(message: _errorMessage)
                      ..show(context);
                  },
                  (r) => _provinceResponse = r,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: BlocProvider(
              create: (context) => getIt<LocationBloc>()
                ..add(LocationEvent.getLocationProvince()),
              child: BlocConsumer<LocationBloc, LocationState>(
                listener: locationBlocListener,
                builder: (context, state) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        state.maybeMap(
                            orElse: () => Container(
                                child: Text("Tidak ada data yang ditampilkan")),
                            provinceDataOptions: (e) {
                              if (e.onLoading == true) {
                                return locationLoadingWidget();
                              } else {
                                return e.dataProvince.fold(
                                    () => noneDataGetProvinceWidget(),
                                    (a) => a.fold(
                                          (l) => errorGetProvinceWidget(
                                              _errorMessage),
                                          (r) => successGetProvinceResponse(
                                              _provinceResponse),
                                        ));
                              }
                            }),
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }

  Container noneDataGetProvinceWidget() {
    return Container(
      child: Text("Datanya None"),
    );
  }

  Expanded successGetProvinceResponse(ProvinceResponse r) {
    return Expanded(
        child: ListView.builder(
            itemCount: r.results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(r.results[index].province),
              );
            }));
  }

  Container locationLoadingWidget() {
    return Container(
        child: Center(
      child: CircularProgressIndicator(),
    ));
  }

  Expanded errorGetProvinceWidget(String message) {
    return Expanded(
        child: Container(
      child: Text(message),
    ));
  }
}
