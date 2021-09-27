import 'package:flutter/material.dart';

import 'common_widgets.dart';

class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(label: "Button Interactive"),
        Center(
          child: Column(
            children: const [IconClickAction(), IconAnimation()],
          ),
        ),
      ],
    );
  }
}

class IconClickAction extends StatefulWidget {
  const IconClickAction({Key? key}) : super(key: key);

  @override
  _IconClickActionState createState() => _IconClickActionState();
}

class _IconClickActionState extends State<IconClickAction> {
  int _clickCount = 0;

  void _onTapIconCountUp(TapUpDetails details) {
    setState(() {
      _clickCount++;
    });
  }

  void _onTapIconCountDown() {
    debugPrint('long press');
    setState(() {
      _clickCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTapUp: _onTapIconCountUp,
          onLongPress: _onTapIconCountDown,
          child: const FlutterLogo(size: 150),
        ),
        Text(
          '$_clickCount',
          style: const TextStyle(fontSize: 30.0, color: Colors.blueAccent),
        ),
      ],
    );
  }
}

class IconAnimation extends StatefulWidget {
  const IconAnimation({Key? key}) : super(key: key);

  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation> {
  double _opacityValue = 1.0;
  bool _isHide = false;
  String _btnStr = "Hide";

  void _onCLickIcon() {
    if (_isHide) {
      setState(() {
        _isHide = false;
        _btnStr = "Hide";
        _opacityValue = 1.0;
      });
    } else {
      setState(() {
        _isHide = true;
        _btnStr = "Show";
        _opacityValue = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: _opacityValue,
          duration: const Duration(seconds: 1),
          child: const FlutterLogo(size: 150),
        ),
        MaterialButton(
            color: _isHide ? Colors.blue : Colors.lightGreen,
            child: Text(_btnStr),
            onPressed: _onCLickIcon),
        // TextButton(
        //   style: ButtonStyle(
        //     backgroundColor:
        //     MaterialStateProperty.resolveWith((states) {
        //       if (states.contains(MaterialState.pressed)){
        //         //버튼이 눌렸을 때
        //         return Colors.cyan;
        //       } else {
        //         return Colors.blue;
        //       }
        //     }),
        //   ),
        //     onPressed: _onCLickIcon,
        //     child: Text(_btnStr, style: const TextStyle(color:Colors.white))
        // ),
      ],
    );
  }
}
