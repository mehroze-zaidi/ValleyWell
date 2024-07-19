import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:valley_well/di/app_module.dart';
import 'package:valley_well/presentation/app/valley_well_app.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env');
    await setupDependencies();
  }

  static Widget buildApp() {
    return const ValleyWellApp();
  }
}
