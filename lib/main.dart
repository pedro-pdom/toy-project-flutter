import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'CustomScreen1.dart';
import 'CustomScreen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('lib/image/frog.jpg'), context);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context)  {
          return Scaffold(
            appBar: AppBar(
              title: Text('sapinho multitoque boy'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(double.infinity),
                    minScale: 0.1,
                    maxScale: 3.0,
                    child: Image.asset(
                      'lib/image/frog.jpg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomScreen1()),
                    );
                  },
                  tooltip: 'Tela Personalizada 1',
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomScreen2()),
                    );
                  },
                  tooltip: 'Tela Personalizada 2',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
