import 'package:flutter/material.dart';
import 'package:star_wars_persons/screens/person_list_screen.dart';

void main() {
  runApp(StarWarsGalacticApp());
}

class StarWarsGalacticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarWars Persons Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonListScreen(title: 'StarWars Persons Demo'),
    );
  }
}