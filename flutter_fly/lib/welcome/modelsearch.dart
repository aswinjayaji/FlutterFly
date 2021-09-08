import 'package:flutter/material.dart';
import 'package:flutter_fly/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_fly/model/search.dart';

Future<AllRepo> fetchRepos(String query) async {
  final response =
      await http.get(Uri.https('api.github.com', 'users/$query/repos'));
  if (response.statusCode == 200) {
    // print(response.body);
    return AllRepo.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Search extends StatefulWidget {
  final String search;
  Search(this.search);
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<Search> {
  late Future<AllRepo> futureRepos;
  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos(widget.search);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Results for \'${widget.search}\''),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<AllRepo>(
                future: futureRepos,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.repos.length,
                      itemBuilder: (context, index) {
                        return ListCard();
                      },
                    );
                  } else
                    return CircularProgressIndicator();
                })));
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
        //   children: [
        //     ListTile(
        //       leading: Icon(Icons.album),
        //       title: Text(
        //         'Put repo name here',
        //         style: TextStyle(
        //           color: Color(0xFFF5F5F5),
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20,
        //         ),
        //       ),
        //       subtitle: Text('info about the repo here'),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: <Widget>[
        //         TextButton(
        //           child: Text('Commits'),
        //           onPressed: () {},
        //         ),
        //         const SizedBox(width: 8),
        //       ],
        //     ),
        //   ],
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
