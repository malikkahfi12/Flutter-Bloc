import 'package:auto_route/auto_route_annotations.dart';
import 'package:hello_world/presentation/home/home_page.dart';
import 'package:hello_world/presentation/location/location_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomePage, initial: true),
  MaterialRoute(page: LocationPage)
])


class $Router{}