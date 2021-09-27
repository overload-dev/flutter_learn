import 'package:flutter/material.dart';

import 'common_widgets.dart';

class Example4 extends StatelessWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TitleWidget(label: 'GestureDetector'),
        Center(
          child: ParentWidget(),
        ),
      ],
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = true;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxC(
      active: _active,
      onChanged: _handleTapBoxChanged,
    );
  }
}

class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapBoxC({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    debugPrint('_handleTapDown');
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails detail) {
    debugPrint('_handleTapUp');
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    debugPrint('_handleTapCancel');
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    debugPrint('_handleTap');
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
              style: const TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal,
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
