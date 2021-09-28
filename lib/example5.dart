import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'common_widgets.dart';

// get Data
Future<Post> fetchPost() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;

  final int id;
  final String title;
  final String body;
  final String? test;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body,
      this.test});

  factory Post.fromJson(Map<String, dynamic> json) {
    debugPrint(json.toString());
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
    return Column(
      children: [
        const TitleWidget(label: 'Http Request Example'),
        Divider(),
        FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // nullable 일때 텍스트 표기
                // return Text(snapshot.data!.test ?? 'data null');
                Widget titleSection = Container(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    children: [
                      Expanded(
                        /* 1 */
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* 2 */
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                snapshot.data!.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Kandersteg Switzerland',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                Widget w = Container(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    children: [
                      Expanded(
                        /* 1 */
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(snapshot.data!.title,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            /* 2 */
                            Text(
                              snapshot.data!.body,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text('Id: ' + snapshot.data!.id.toString()),
                            Text('userId: ' + snapshot.data!.userId.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                return w;
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
  }
}
