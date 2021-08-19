import 'package:flutter/material.dart';

import '../constant.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final action;

  const DefaultAppBar({
    required this.title,
    required this.child,
    this.action,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: kPrimaryColor)),
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: kRadius,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      leading: child,
      actions: action,
    );
  }
}
