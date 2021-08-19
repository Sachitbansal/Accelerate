import 'package:accelerate/pages/welcome.dart';
import 'package:flutter/material.dart';


Future<void> main()  async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[300],
        accentColor: Colors.red[200],
        fontFamily: 'Poppins',
      ),
      home: const Welcome(),
    );
  }
}
