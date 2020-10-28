import 'package:flutter/material.dart';
import 'package:star_wars_persons/models/people.dart';

class DetailInfoScreen extends StatefulWidget {
  final Person person;

  DetailInfoScreen({this.person});

  @override
  _DetailInfoScreenState createState() => _DetailInfoScreenState();
}

class _DetailInfoScreenState extends State<DetailInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.person.name)),
    );
  }
}
