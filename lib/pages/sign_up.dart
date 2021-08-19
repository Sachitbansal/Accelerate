import 'package:accelerate/cards/ordivider.dart';
import 'package:accelerate/cards/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool passVisible = true;
  bool confirmPassVisible = true;

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://i.ibb.co/xmmYtHQ/bg1.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/exercise.png',
                        height: 350,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 325,
                    child: TextFormField(
                      cursorColor: Colors.red[800],
                      decoration: InputDecoration(
                        fillColor: Colors.red[50],
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 0.8,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        hintText: 'ID',
                        labelText: 'Email ID',
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Theme.of(context).primaryColor,
                          // size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: 325,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:8),
                      child: TextFormField(
                        validator: (val) =>
                        val!.length < 6
                            ? 'Password too short.'
                            : null,
                        obscureText: passVisible,
                        cursorColor: Colors.red[800],
                        decoration: InputDecoration(
                          fillColor: Colors.red[50],
                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(width: 0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              width: 0.8,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                            ),
                          ),
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(passVisible
                                ? Icons.visibility
                                : Icons.visibility_off,),
                            color: Theme
                                .of(context)
                                .primaryColor,
                            onPressed: () {
                              setState(() {
                                passVisible = !passVisible;
                              });
                            },
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme
                                .of(context)
                                .primaryColor,
                            // size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 325,
                    child: TextFormField(
                      validator: (val) =>
                      val!.length < 6
                          ? 'Password too short.'
                          : null,
                      obscureText: passVisible,
                      cursorColor: Colors.red[800],
                      decoration: InputDecoration(
                        fillColor: Colors.red[50],
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 0.8,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(confirmPassVisible
                              ? Icons.visibility
                              : Icons.visibility_off,),
                          color: Theme
                              .of(context)
                              .primaryColor,
                          onPressed: () {
                            setState(() {
                              confirmPassVisible = !confirmPassVisible;
                            });
                          },
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme
                              .of(context)
                              .primaryColor,
                          // size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'Sign Up Button',
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: RoundedButton(
                              () {Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));},
                          'Sign Up',
                          Colors.white,
                          Theme.of(context).primaryColor),
                    ),
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          border: Border.all(color: const Color(0xFFFF5252)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 1.0), //(x,y),
                            ),
                          ],
                        ),
                        child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.google,
                            ),
                            onPressed: () {}),
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          border: Border.all(color: const Color(0xFFFF5252)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 1.0), //(x,y),
                            ),
                          ],
                        ),
                        child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.facebookF,
                            ),
                            onPressed: () {}),
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          border: Border.all(color: const Color(0xFFFF5252)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 1.0), //(x,y),
                            ),
                          ],
                        ),
                        child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.twitter,
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
