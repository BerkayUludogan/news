import 'package:flutter/material.dart';

class HomeCustomContainer extends StatelessWidget {
  const HomeCustomContainer({
    // required this.onTap,
    super.key,
    this.height,
    this.decoration,
    this.width,
    this.color,
    this.child,
  });
  final double? height;
  final double? width;
  final Decoration? decoration;
  final Color? color;
  final Widget? child;
  // final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        color: color,
        child: child,
      ),
    );
  }
}
