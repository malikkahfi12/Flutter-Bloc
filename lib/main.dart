import 'package:flutter/material.dart';
import 'package:hello_world/injection.dart';
import 'package:hello_world/presentation/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
