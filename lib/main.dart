import 'package:flutter/material.dart';
import 'package:star_wars_api/screens/person_list_screen.dart';

void main() {
  runApp(const StarWarsGalacticApp());
}

class StarWarsGalacticApp extends StatelessWidget {
  const StarWarsGalacticApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarWars Persons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonListScreen(title: 'StarWars Persons'),
    );
  }
}
