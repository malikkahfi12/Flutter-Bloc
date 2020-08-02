// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'location/location_page.dart';

class Routes {
  static const String homePage = '/';
  static const String locationPage = '/location-page';
  static const all = <String>{
    homePage,
    locationPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.locationPage, page: LocationPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(key: args.key),
        settings: data,
      );
    },
    LocationPage: (data) {
      final args = data.getArgs<LocationPageArguments>(
        orElse: () => LocationPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LocationPage(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  HomePageArguments({this.key});
}

/// LocationPage arguments holder class
class LocationPageArguments {
  final Key key;
  LocationPageArguments({this.key});
}
