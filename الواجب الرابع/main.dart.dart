// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanced Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Dual FAB Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // دالة لزيادة العداد
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // دالة لإنقاص العداد
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter Value:',
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.headline6),
            // ignore: deprecated_member_use
            Text('$_counter', style: Theme.of(context).textTheme.headline2),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // زر الإنقاص
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            heroTag: 'decrement',
            child:
                const Icon(Icons.remove), // مهم لتجنب تضارب الـ Hero animations
          ),
          const SizedBox(width: 310), // مسافة بين الزرين
          // زر الزيادة
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            heroTag: 'increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
