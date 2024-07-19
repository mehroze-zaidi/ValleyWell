import 'package:flutter/material.dart';
import 'package:valley_well/utils/enums/develop_mode.dart';
import 'package:valley_well/utils/enums/device_mode.dart';

class AppConstants {
  AppConstants._();

  /// ==== KEYS ======////
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>(debugLabel: 'scaffoldKey');

  static const DevelopMode developMode = DevelopMode.release;
  static const DeviceMode deviceMode = DeviceMode.realDevice;
}
