import 'package:accelerate/cards/rounded_button.dart';
import 'package:accelerate/pages/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://i.ibb.co/xmmYtHQ/bg1.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/exercise.png',
                      height: 400,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
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
                const SizedBox(
                  height: 11,
                ),
                SizedBox(
                  width: 325,
                  child: TextFormField(
                    validator: (val) =>
                    val!.length < 6 ? 'Password too short.' : null,
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
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          passVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            passVisible = !passVisible;
                          });
                        },
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                        // size: 30.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Hero(
                  tag: 'Login Button',
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: RoundedButton(
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Dashboard(),
                          ),
                        ),
                        'Login',
                        Colors.white,
                        Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.red),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
