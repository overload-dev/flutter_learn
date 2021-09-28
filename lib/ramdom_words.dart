import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(          // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),
      home: const Scaffold(
        body: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({
    Key? key,
  }) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return const Divider();

      final index = i ~/ 2;

      //scroll length check, first, make a list spaces
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      WordPair pair = _suggestions[index];
      final bool alreadySaved = _saved.contains(pair);

      return ListTile(
        title: Text(pair.asPascalCase, style: _biggerFont),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_outline,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startup Name Generator'), actions: [
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: _pushSaved,
        ),
      ]),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {

      final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
          return ListTile(
            title: Text(pair.asPascalCase, style: _biggerFont),
          );
        },
      );

      final List<Widget> divided =
      ListTile.divideTiles(context: context, tiles: tiles).toList();

      debugPrint(divided.length.toString());
      return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: divided.isNotEmpty ?ListView(
          children: divided,
        ) : const Center(
          child: Text('No Data'),
        ),
      );
    }));
  }
}
