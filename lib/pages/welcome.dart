import 'package:accelerate/cards/rounded_button.dart';
import 'package:accelerate/constant.dart';
import 'package:accelerate/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://i.ibb.co/xmmYtHQ/bg1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/img/illustration.png',
                    width: 300,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  const Text(
                    'Your Personal',
                    style: TextStyle(
                      color: kPrimaryAccentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fitness Trainer'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Bebas',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  const Text(
                    'Accelerate is an app which promotes jumping as a way to achieve fitness. People refrain to go out for walk which is a positive attitude towards Covid Precautions. Therefore, Accelerate is here to monitor your jumps instead of steps!',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: RoundedButton(
                            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen())),
                        'Get Started',
                        Colors.white,
                        Theme.of(context).primaryColor
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: RoundedButton(
                            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                        'Sign In',
                        Colors.white,
                        // Colors.green
                        kPrimaryAccentColor
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
}
