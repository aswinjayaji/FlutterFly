import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Stack(
                  children: [
                    Container(
                      child:
                          Image.asset("images/PNG/GitHub-Mark-120px-plus.png"),
                    ),
                    Container(
                      child: Column(
                        childern: [Text("Welcome to Github API app"),
                        Text
                        ],
                      
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
