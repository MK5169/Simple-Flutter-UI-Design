import 'package:cryptoworld/bottomnavbar.dart';
import 'package:cryptoworld/constants.dart';
import 'package:cryptoworld/homepage.dart';
import 'package:cryptoworld/serviceapi.dart';
import 'package:cryptoworld/welcomescreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
  // final _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String gender = "SELECT GENDER";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    print(height);
    print(width);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            bgImage,
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
          Text(
            appName,
            style: TextStyle(
                fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w900),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    // key: _formKey,
                    controller: _emailController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: primarylite,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "E-MAIL",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Provide Email Address';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    controller: _passwordController,
                    // key: _formKey,
                    validator: (value) {
                      if (value.length < 8) {
                        return 'Password Must Contain Atlesast 8 Characters';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    // obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      filled: true,

                      fillColor: primarylite,
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "  PASSWORD  ",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      prefixIcon: Icon(Icons.lock_open),
                      // suffixIcon: Icon(Icons.remove_red_eye_outlined)
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: DropdownButtonFormField(
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: primarylite,
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(color: Colors.green),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(color: Colors.black),
                //       ),
                //     ),
                //     value: gender,
                //     icon: const Icon(Icons.arrow_drop_down),
                //     onChanged: (String _value) {
                //       setState(() {
                //         gender = _value;
                //       });
                //     },
                //     items: <String>["SELECT GENDER", "MALE", "FEMALE", "OTHERS"]
                //         .map(
                //           (String value) => DropdownMenuItem(
                //             child: Text(
                //               value,
                //               style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //             value: value,
                //           ),
                //         )
                //         .toList(),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.3,
            height: size.height * 0.05,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: new LinearGradient(
                colors: [Colors.pinkAccent.shade100, Colors.green],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
              ),
            ),
            child: TextButton(
              onPressed: () {
                validateUser();
                // if (_formKey.currentState.validate()) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => WELCOME()),
                //   );
                // }
              },
              child: Text('Login'),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text(
                "SKIP",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }

  void validateUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (_formKey.currentState.validate()) {
      String response = await signIn(email, password);
      print(response);
      if (response == ("User Login Successfully")) {
        print(email);
        print(password);
        _emailController.clear();
        _passwordController.clear();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WELCOME(),
          ),
        );
      } else if (response == ("password is incorrect")) {
        _popupDialog1(context);
      } else {
        _popupDialog(context);
      }
    }
  }

  void _popupDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("password is incorrect."),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Back"),
              ),
            ],
          );
        });
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("your Account is invalid."),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Okay"),
              ),
            ],
          );
        });
  }
}
