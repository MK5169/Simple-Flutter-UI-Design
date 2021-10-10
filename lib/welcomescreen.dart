import 'package:cryptoworld/bottomnavbar.dart';
import 'package:cryptoworld/homepage.dart';
import 'package:flutter/material.dart';

class WELCOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login Successful!",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 30,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                "NEXT",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
