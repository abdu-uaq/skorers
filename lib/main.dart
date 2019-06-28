import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skorers',
      home: Scores()
    );
  }
}

class ScoresState extends State<Scores> {
  final _scores = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skorers'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _scores.length) {
            _scores.add("Luca, Tim  vs Giorgio, Reiner: 3-0");
          }
          return _buildRow(_scores[index]);
        });
  }

  Widget _buildRow(String score) {
    return ListTile(
      title: Text(
        score,
        style: _biggerFont,
      ),
    );
  }
}

class Scores extends StatefulWidget {
  @override
  ScoresState createState() => ScoresState();
}
