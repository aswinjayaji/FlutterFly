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
                Container(
                  child: Image.asset(""),
                ),
                Container(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
