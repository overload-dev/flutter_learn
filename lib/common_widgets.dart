import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget{
  final String label;

  const TitleWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
          label,
          style: const TextStyle(
              fontSize: 30.0,
              color:Colors.blueAccent
          )
      ),
    );
  }
}