import 'package:flutter/material.dart';
import 'package:valley_well/presentation/app/app_initializer.dart';

void main() async {
  await AppInitializer.initialize();
  runApp(AppInitializer.buildApp());
}
