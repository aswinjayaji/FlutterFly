import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_fly/model/search.dart';

Future<All> fetchRepos() async {
  final response =
      await http.get(Uri.https('api.github.com', 'users/nirans2002/repos'));
  if (response.statusCode == 200) {
    // print(response.body);
    return All.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  late Future<All> futureRepos;
  @override
  void initState() {
    super.initState();
    fetchRepos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder<All>(
              future: futureRepos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Repo> repos = [];
                  for (int i = 0; i < snapshot.data!.repos.length; i++) {
                    repos.add(
                      Repo(
                          name: snapshot.data!.repos[i].name,
                          fullname: snapshot.data!.repos[i].fullname,
                          htmlUrl: snapshot.data!.repos[i].htmlUrl),
                    );
                    print(repos[i].name);
                  }
                  return ListView();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error!'),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
