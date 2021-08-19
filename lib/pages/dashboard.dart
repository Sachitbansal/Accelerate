import 'package:accelerate/cards/barchart.dart';
import 'package:accelerate/cards/rounded_button.dart';
import 'package:accelerate/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shake/shake.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../cards/data.dart';
import 'graph.dart';
import 'notification_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class StatCard extends StatelessWidget {
  final String title;
  final double total;
  final double achieved;
  final Image image;
  final Color color;

  const StatCard({
    Key? key,
    required this.title,
    required this.total,
    required this.achieved,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    color: const Color(0xFFEF9A9A).withAlpha(200),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
              achieved < total
                  ? Image.asset(
                      'assets/img/down_orange.png',
                      width: 20,
                    )
                  : Image.asset(
                      'assets/img/up_red.png',
                      width: 20,
                    ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          Center(
            child: image
          ),
          // CircularPercentIndicator(
          //   radius: 80.0,
          //   lineWidth: 8.0,
          //   percent: achieved / (total < achieved ? achieved : total),
          //   circularStrokeCap: CircularStrokeCap.round,
          //   center: image,
          //   progressColor: color,
          //   backgroundColor: const Color(0xFFEF9A9A).withAlpha(30),
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: achieved.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.red[200],
                ),
              ),
              TextSpan(
                text: ' / $total',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class _DashboardState extends State<Dashboard> {
  int count = 0;
  int maxjumps = 20;
  bool pressed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.0, -2.0),
          end: Alignment(1.0, 2.0),
          colors: [Color(0xFFEF9A9A), Color(0xFFFFFDE7), Color(0xFFFFE0B2)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -2.0),
                end: Alignment(1.0, 2.0),
                colors: [
                  Color(0xFFFFF3E0),
                  Color(0xFFFCE4EC),
                  Colors.white,
                ],
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 10,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfilePage(),
                    ),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfilePage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sachit Bansal',
                      style: TextStyle(
                        color: Colors.red[200],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Jul 18, 2021',
                      style: TextStyle(
                        color: Colors.red[200],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationList(),
                  ),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.red[200],
                      size: 35,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    width: 20,
                    height: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.red,
                      ),
                      width: 20,
                      height: 20,
                      child: const Center(
                        child: Text(
                          '03',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 25, 25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onLongPress: () {
                      setState(() {
                        count = 0;
                        maxjumps = 20;
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).primaryColor.withAlpha(50),
                      ),
                      child: Image.asset(
                        'assets/img/jump.png',
                        width: 100,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$count',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 80,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'jumps',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '0 jumps'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '$maxjumps jumps'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        // LinearPercentIndicator(
                        //   lineHeight: 9.0,
                        //   percent: count / (maxjumps * 10) * 10,
                        //   linearStrokeCap: LinearStrokeCap.roundAll,
                        //   backgroundColor:
                        //       const Color(0xFFEF9A9A).withAlpha(30),
                        //   progressColor: Theme.of(context).primaryColor,
                        // ),
                        pressed
                            ? Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFBDBDBD)
                                          .withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                        0,
                                        1,
                                      ), // changes position of shadow
                                    ),
                                  ],
                                ),
                                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: NumberPicker(
                                    axis: Axis.horizontal,
                                    step: 10,
                                    minValue: count,
                                    maxValue: 1000,
                                    value: maxjumps,
                                    onChanged: (value) {
                                      setState(() {
                                        maxjumps = value;
                                      });
                                    }),
                              )
                            : const SizedBox(),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            backgroundColor: Colors.transparent,
                          ),
                          // onPressed: press,
                          onPressed: () {
                            if (pressed == true) {
                              setState(() {
                                pressed = false;
                              });
                            } else {
                              setState(() {
                                pressed = true;
                              });
                            }
                          },
                          child: Text(
                            'Set Limit',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                letterSpacing: 1.3),
                          ),
                        ),
                        Text(
                          'Jump Count'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.red[200],
                            fontFamily: 'Bebas',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'You jumped 2 min today',
                          style: TextStyle(
                            color: Colors.red[200],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 25,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Target',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: (0.6 * maxjumps).toStringAsFixed(1),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red[200],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' cal',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '1 jump Cal',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '0.6',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red[200],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' cal',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Calories Burnt',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: (count * 0.6).toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red[200],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' cal',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 25,
                    color: Colors.grey[300],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Water PROGRESS',
                        style: TextStyle(
                          color: Colors.red[200],
                          fontSize: 24,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/img/down_orange.png',
                            width: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 15),
                          ),
                          const Text(
                            '500 Calories',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BarChart(weeklySpending, '18 july 2021'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFBDBDBD).withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: RoundedButton(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    }, 'View Details', Colors.white,
                        Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment(-1.0, -2.0),
                          end: Alignment(1.0, 2.0),
                          colors: [
                            Color(0xFFE8EAF6),
                            Color(0xFFE0F2F1),
                            Color(0xFFF8BBD0)
                          ]),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFBDBDBD).withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: StatCard(
                      title: 'Water',
                      achieved: 1.5,
                      total: 7,
                      color: Colors.blue,
                      image: Image.asset('assets/img/bolt.png', width: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    ShakeDetector.autoStart(onPhoneShake: () {
      if (count < maxjumps) {
        setState(() {
          count++;
        });
      } else {
        showTopSnackBar(
          context,
          const CustomSnackBar.success(
            message: "Good job, Your Goal for the day is completed!",
          ),
        );
      }
    });
  }
}
