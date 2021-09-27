import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'example2.dart';
import 'example1.dart';
import 'example3.dart';
import 'example4.dart';
import 'example5.dart';
import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', ''),
        Locale('en', ''),
        Locale('jp', 'JP'),
      ],
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: const Text('Flutter layout demo'),
        ),
        // body: Example1(),
        // body: Example2(),
        // body: const Example3(),
        // body: const Example4(),
          body: const Example5(),
      )
    );
  }
}