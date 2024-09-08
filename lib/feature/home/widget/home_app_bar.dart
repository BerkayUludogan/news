import 'package:flutter/material.dart';
import 'package:news/product/constant/color/const_color.dart';
import 'package:news/product/constant/strings/const_string.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.elevation = 1,
    this.backgroundColor = ConstColor.red,
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
      iconTheme: const IconThemeData(
        color:
            ConstColor.white, // Burada geri butonunun rengini değiştirirsiniz
      ),
      elevation: elevation,
      backgroundColor: backgroundColor,
      title: Text(
        title.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
