import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// pass parameters route
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Returning Data Demo'),
        ),
        body: const Center(
          child: SelectionButton(),
        ));
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Pick an option, any option!'),
      onPressed: (){
        _navigateAndDisplaySelection(context);
      },
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));


    debugPrint(result.toString());
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Wise'),
                onPressed: () {
                  Navigator.pop(context, 'Wise');
                  // return to main
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('wisdom'),
                onPressed: () {
                  Navigator.pop(context, 'wisdom');
                  // return to main
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
