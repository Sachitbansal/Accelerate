import 'package:flutter/material.dart';

import '../constant.dart';
import 'ordivider.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle, date, month;
  final void Function()? onTap;
  final bool enable;
  final Color color;

  const NotificationTiles({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
    required this.date,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFFEBEE), Color(0xFFFFF3E0)])),
          child: ListTile(
            leading: Container(
                height: 50.0,
                width: 50.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(logo), fit: BoxFit.cover))),
            trailing: Container(
              height: 50,
              width: 50,
              child: Column(
                children: [
                  Text(date, style: const TextStyle(color: kDarkColor)),
                  Text(month, style: const TextStyle(color: kDarkColor)),
                ],
              ),
            ),
            title: Text(title, style: const TextStyle(color: kDarkColor)),
            subtitle: Text(subtitle, style: TextStyle(color: color)),
            onTap: onTap,
            enabled: enable,
          ),
        ),
        MyDivider()
      ],
    );
  }
}
