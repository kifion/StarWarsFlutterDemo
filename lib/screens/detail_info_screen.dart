import 'package:flutter/material.dart';
import 'package:star_wars_persons/models/people.dart';

class DetailInfoScreen extends StatelessWidget {
  final Person person;
  static const paddingSize = 8.0;

  DetailInfoScreen({this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(person.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Name: " + person.name),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Eye color: " + person.eyeColor),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Gender: " + person.gender),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Hair color: " + person.hairColor),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Planet: " + person.homeWorld),
          ),
        ],
      ),
    );
  }
}
