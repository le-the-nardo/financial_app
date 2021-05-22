import 'package:flutter/material.dart';

import 'features/inicial_screen/presentation/pages/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* title: 'Financial APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), */
      home: MyHomePage(title: 'Financial APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text(widget.title),
      ), */
      body: InitialScreen(),
     /*  floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
