import 'package:flutter/material.dart';
import 'package:flutter_fly/homepage.dart';
import 'package:flutter_fly/welcome/modelsearch.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  bool _validate = false;
  TextEditingController search = TextEditingController();

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
                  controller: search,
                  autofocus: false,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Enter Github Username',
                    hintText: ' Octocat',
                    errorText: _validate ? "Search can't be null" : null,
                    filled: true,
                    fillColor: Colors.grey.shade50.withOpacity(0.1),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (search.text.isEmpty) {
                      setState(() {});
                      _validate = true;
                    } else {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      _validate = false;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(search.text),
                      ),
                    );
                  },
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
