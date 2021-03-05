import 'package:flutter/material.dart';
import 'dependencies_injection/get_it_module.dart';
import 'my_app.dart';

void main() async {

  // init Dependencies injection
  await setupDependenciesInjection();

  runApp(MyApp());
}
