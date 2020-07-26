import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/application/location/location_bloc.dart';
import 'package:hello_world/injection.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ongkir"),
      ),
      body: Container(
        child: BlocProvider(
          create: (context) => getIt<LocationBloc>(),
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        context
                            .bloc<LocationBloc>()
                            .add(LocationEvent.getLocationProvince());
                      },
                      child: Text("Tekan"),
                    ),
                    state.maybeMap(
                        orElse: () => Container(
                            child: Text("Tidak ada data yang ditampilkan")),
                        provinceDataOptions: (e) {
                          if (e.onLoading == true) {
                            return Container(
                                child: Center(
                              child: CircularProgressIndicator(),
                            ));
                          } else {
                            return e.dataProvince.fold(
                                () => Container(
                                      child: Text("Datanya None"),
                                    ),
                                (a) => a.fold(
                                    (l) => l.map(
                                        notFound: (e) =>
                                            errorGetProvinceWidget(e.msg),
                                        badRequest: (e) =>
                                            errorGetProvinceWidget(
                                                e.badRequest),
                                        serverError: (e) =>
                                            errorGetProvinceWidget(
                                                "Server Error")),
                                    (r) => Expanded(
                                        child: ListView.builder(
                                            itemCount: r.results.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                    r.results[index].province),
                                              );
                                            }))));
                          }
                        }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Expanded errorGetProvinceWidget(String message) {
    return Expanded(
        child: Container(
      child: Text(message),
    ));
  }
}
