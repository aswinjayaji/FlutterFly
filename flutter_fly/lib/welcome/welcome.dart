import 'package:flutter/material.dart';
import 'package:flutter_fly/homepage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  child: Image.asset(
                    MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? "images/PNG/GitHub-Mark-120px-plus.png"
                        : "images/PNG/GitHub-Mark-Light-120px-plus.png",
                  ),
                ),
                Text(
                  "Welcome to github API app",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Enter Github Username',
                    hintText: ' Octocat',

                    filled: true,
                    fillColor: Colors.grey.shade50.withOpacity(0.1),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  ),
                  child: Text("Search"),
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
