import 'package:flutter/material.dart';
import 'package:flutter_fly/constants.dart';
import 'package:flutter_fly/samplerepolist.dart';
import 'package:flutter_fly/welcome/modelsearch.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
              child: ListView.builder(
                  itemCount: repolist.length,
                  itemBuilder: (context, index) {
                    return ListCard();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Image.asset(
                    MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? "images/PNG/GitHub-Mark-120px-plus.png"
                        : "images/PNG/GitHub-Mark-Light-120px-plus.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'repo-name',
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'repo Description',
                        style:
                            TextStyle(color: Color(0xFFF5F5F5), fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
