import 'package:flutter/material.dart';
import 'package:news/product/constant/color/const_color.dart';
import 'package:news/product/constant/strings/const_string.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.elevation = 1,
    this.backgroundColor = ConstColor.white,
    this.title = ConstantStrings.title,
    this.centerTitle = true,
    this.actions,
  });
  final bool? centerTitle;
  final double? elevation;
  final Color? backgroundColor;
  final String? title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      title: Text(title.toString()),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
