import '../constant.dart';
import '../cards/default_backbutton.dart';
import 'package:flutter/material.dart';
import '../cards/notification_tiles.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);


  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
          title: const Text('Notifications', style: TextStyle(color: kPrimaryColor)),
          centerTitle: true,
          backgroundColor: kWhiteColor,
          elevation: kRadius,
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: kPrimaryColor),
          leading: DefaultBackButton(),
          actions: [
            IconButton(
              onPressed: () {
                if (enabled == true) {
                  setState(() {
                    enabled = false;
                  });
                } else {
                  setState(() {
                    enabled = true;
                  });
                }
              },
              icon: const Icon(Icons.clear_all, size: 35,),
            )
          ]),
      body: enabled
          ? SingleChildScrollView(
              child: Column(
                children: [
                  NotificationTiles(
                    color: kLightColor,
                    title: 'Water Alert',
                    date: '19',
                    month: 'Jul',
                    subtitle: 'Have more water to burt your fat!',
                    enable: true,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationList())),
                  ),
                  NotificationTiles(
                    color: kLightColor,
                    title: 'Start!',
                    date: '18',
                    month: 'Jul',
                    subtitle: 'Where Have you been? Lets Jump!',
                    enable: true,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationList())),
                  ),
                  NotificationTiles(
                    color: Colors.green,
                    title: 'Goal Completion',
                    subtitle: 'You Completed your daily goals',
                    enable: true,
                    date: '17',
                    month: 'Jul',
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationList())),
                  ),
                  NotificationTiles(
                    color: Colors.red,
                    title: 'Goal Completion',
                    subtitle: 'You Failed your daily goal',
                    enable: true,
                    date: '16',
                    month: 'Jul',
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationList())),
                  ),
                  NotificationTiles(
                    color: kLightColor,
                    title: 'Accelerate',
                    date: '15',
                    month: 'Jul',
                    subtitle: 'Thanks for downloading Accelerate.',
                    enable: true,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationList())),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(
                'No Notifications',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
    );
  }
}
