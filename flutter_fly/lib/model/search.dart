// ignore: unused_import
import 'package:flutter/foundation.dart';

class Repo {
  late String name;
  late String fullname;
  late String htmlUrl;

  Repo({required this.name, required this.fullname, required this.htmlUrl});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
        name: json['name'],
        fullname: json['full_name'],
        htmlUrl: json['html_url']);
  }
}

// class All {
//   List<Repo> repos;
//   All({required this.repos});
//   factory All.fromJson(List<dynamic> json) {
//     // ignore: deprecated_member_use
//     List<Repo> repos = new List<Repo>();
//     repos = json.map((r) => Repo.fromJson(r)).toList();
//     return All(repos: repos);
//   }
// }
