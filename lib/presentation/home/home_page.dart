import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/presentation/router.gr.dart';


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
        title: Text("Bloc"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(onPressed: (){
            ExtendedNavigator.of(context).push(Routes.locationPage);
          },
          child: Text("Tekan akuh"),)
        ],
      ),
    );
    }
}