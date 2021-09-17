// ignore: unused_import
import 'package:flutter/foundation.dart';

class Repo {
  late String name;
  late int stargazers_count;
  late String commits_url;

  Repo({
    required this.name,
    required this.stargazers_count,
    required this.commits_url,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
        name: json['name'],
        stargazers_count: json['stargazers_count'],
        commits_url: json['commits_url']);
  }
}

class AllRepo {
  List<Repo> repos;
  AllRepo({required this.repos});
  factory AllRepo.fromJson(List<dynamic> json) {
    // ignore: deprecated_member_use
    List<Repo> repos = [];
    repos = json.map((r) => Repo.fromJson(r)).toList();
    return AllRepo(repos: repos);
  }
}
