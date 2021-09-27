import 'package:flutter/material.dart';
import 'common_widgets.dart';
import 'models/todo.dart';

class Example3 extends StatelessWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = List<Todo>.generate(
        20,
        (i) => Todo(
            'Todo $i', 'A description of what needs to be done for Todo $i'));

    return Column(
      children: [
        const TitleWidget(label: "Route Example"),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(todo: todos[index]),
                    ),);
                  },
            );
          },
        ),)
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(todo.title),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(todo.desc),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text('back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
