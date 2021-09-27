import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// get Data
Future<Post> fetchPost() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

  if(response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}


class Post {
  final int userId ;
  final int id;
  final String title;
  final String body;
  final String test;
  Post({required this.userId, required this.id, required this.title, required this.body, required this.test});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        test: json['test'],
    );
  }

}


class Example5 extends StatefulWidget {
  const Example5({Key? key}) : super(key: key);

  @override
  _Example5State createState() => _Example5State();
}

class _Example5State extends State<Example5> {
  late Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.test != null ? Text('a') : Text('b');



          } else if (snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return const Center( child: CircularProgressIndicator(),);
        });
  }



}
