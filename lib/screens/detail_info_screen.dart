import 'package:flutter/material.dart';
import 'package:star_wars_persons/models/people.dart';

class DetailInfoScreen extends StatefulWidget {
  final Person person;

  DetailInfoScreen({this.person});

  @override
  _DetailInfoScreenState createState() => _DetailInfoScreenState();
}

class _DetailInfoScreenState extends State<DetailInfoScreen> {
  static const paddingSize = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.person.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Name: " + widget.person.name),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Eye color: " + widget.person.eyeColor),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Gender: " + widget.person.gender),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Hair color: " + widget.person.hairColor),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: Text("Planet: " + widget.person.homeWorld),
          ),
        ],
      ),
    );
  }
}
