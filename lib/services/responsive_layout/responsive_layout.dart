import 'package:flutter/material.dart';

class HomeResponsive extends StatefulWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  HomeResponsive({
    super.key,
    this.tablet,
    required this.desktop,
    required this.mobile,
  });
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width <= 1280;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;

  @override
  State<HomeResponsive> createState() => _HomeResponsiveState();
}

class _HomeResponsiveState extends State<HomeResponsive> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1100) {
      return widget.desktop;
    } else if (size.width >= 850 && widget.tablet != null) {
      return widget.tablet!;
    } else {
      return widget.mobile;
    }
  }
}
