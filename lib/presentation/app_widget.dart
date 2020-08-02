import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/presentation/router.gr.dart';

import 'home/home_page.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: ExtendedNavigator.builder(
            router: Router(),
            builder: (context, extendedNav) => Theme(
                data: ThemeData(brightness: Brightness.dark),
                child: extendedNav)),
        home: HomePage());
  }
}
