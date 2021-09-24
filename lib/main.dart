import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Row Widget
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
                  child: const Text(
                    'Oeshinen Lake Camproground',
                    style: TextStyle(
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
          const FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 균등 배치
        children:[
          _buildButtonColumn(color, Icons.call, 'Call'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ]
      )
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    Widget logoSection = Container(
        padding: const EdgeInsets.all(32),
        child: const LogoApp(),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children:[
            Image.asset(
              'assets/images/lake.jpg',
              width:600,
              height:240,
              fit: BoxFit.cover
            ),
            titleSection,
            Divider(),
            buttonSection,
            Divider(),
            textSection,
            Divider(),
            _title('Logo Action'),
            logoSection,
            Divider(),
            _title('Action Fade'),
            ActionAnimation(),
          ],
        )
      )
    );
  }

  Text _title(String label) {
    return Text(
        label,
        style: const TextStyle(
            fontSize: 30.0,
          color:Colors.blueAccent
        )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Icon(icon, color:color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color:color,
            ),
          ),
        ),
      ],
    );
  }


}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() { // 다시 렌더링
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? const Icon(Icons.star) : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount')
        )
      ],
    );

  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({Key? key}) : super(key: key);
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp>{
  int _clickCount = 0;

  void _onTapLogoCountUp(TapUpDetails detail){
    setState((){
      _clickCount++;
    });
  }

  void _onTapLogoCountDown() {
    debugPrint('long press');
    setState((){
      _clickCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTapUp:_onTapLogoCountUp,
          onLongPress: _onTapLogoCountDown,
          child: Container(
            child: FlutterLogo(size: 150),
          ),
        ),
        Text(
          '$_clickCount',
          style: const TextStyle(
              fontSize: 30.0,
              color:Colors.blueAccent
          ),
        ),
      ],
    );
  }

}

class ActionAnimation extends StatefulWidget {
  const ActionAnimation({Key? key}) : super(key: key);

  @override
  _ActionAnimationState createState() => _ActionAnimationState();
}


class _ActionAnimationState extends State<ActionAnimation> {
  double _opacityValue = 1.0;
  bool _isHide = false;

  void _onCLickLogo() {
    debugPrint('_onCLickLogo');
    if (_isHide) {
      setState(() {
        _isHide = true;
        _opacityValue = 0.0;
      });
    } else {
      setState(() {
        _isHide = false;
        _opacityValue = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacityValue,
          duration: const Duration(seconds: 1),
          child: IconButton(
            icon: const FlutterLogo(size: 150),
            onPressed: _onCLickLogo,
          ),
        ),
      ],
    );
  }

}




