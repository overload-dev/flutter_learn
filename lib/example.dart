import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demos',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('layout example 1'),
        ),
        body: const Center(
          child: ParentWidget(),
        )
      )
    );
  }


}

class ParentWidget extends StatefulWidget{
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = true;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }

}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key? key, this.active = false, required this.onChanged }) : super(key: key);

  bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {

  bool _highlight  = false;

  void _handleTapDown(TapDownDetails details) {
    debugPrint('_handleTapDown');
    setState(() {
      _highlight  = true;
    });
  }
  void _handleTapUp(TapUpDetails detail){
    debugPrint('_handleTapUp');
    setState(() {
      _highlight  = false;
    });
  }

  void _handleTapCancel(){
    debugPrint('_handleTapCancel');
    setState(() {
      _highlight  = false;
    });
  }

  void _handleTap() {
    debugPrint('_handleTap');
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTapDown:_handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color:Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color:
          widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border:
          _highlight ? Border.all(color: Colors.teal, width: 10.0, ) : null,
        ),
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  const TapBoxB({Key? key, this.active = false, required this.onChanged }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child:Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }

}