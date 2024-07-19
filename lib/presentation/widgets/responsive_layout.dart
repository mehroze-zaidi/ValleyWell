import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;

  const ResponsiveLayout({
    super.key,
    required this.tiny,
    required this.phone,
    required this.tablet,
    required this.largeTablet,
    required this.computer,
  });

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 380;
  static const int phoneLimit = 520;
  static const int tabletLimit = 620;
  static const int largeTabletLimit = 1100;

  static bool isTinyHeightLimit(
    BuildContext context,
  ) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;

  static bool isTinyLimit(
    BuildContext context,
  ) =>
      MediaQuery.of(context).size.width < tinyLimit;

  static bool isPhone(
    BuildContext context,
  ) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;

  static bool isTablet(
    BuildContext context,
  ) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;

  static bool isLargeTablet(
    BuildContext context,
  ) =>
      MediaQuery.of(context).size.width < largeTabletLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;

  static bool isComputer(
    BuildContext context,
  ) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;

  @override
  Widget build(
    BuildContext context,
  ) =>
      LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints constraints,
        ) {
          if (constraints.maxWidth < tinyLimit || constraints.maxHeight < tinyHeightLimit) {
            return tiny;
          } else if (constraints.maxWidth < phoneLimit) {
            return phone;
          } else if (constraints.maxWidth < tabletLimit) {
            return tablet;
          } else if (constraints.maxWidth < largeTabletLimit) {
            return largeTablet;
          } else {
            return computer;
          }
        },
      );
}
