import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_persons/models/people.dart';
import 'package:star_wars_persons/models/people_list.dart';
import 'package:star_wars_persons/widgets/person_list_widget.dart';

class PersonListScreen extends StatefulWidget {
  final String title;

  PersonListScreen({Key key, this.title}) : super(key: key);

  @override
  _PersonListScreenState createState() => _PersonListScreenState();
}

class _PersonListScreenState extends State<PersonListScreen> {
  final searchController = TextEditingController();
  List<Person> personList;
  Future<PeopleList> searchResult;
  ViewMode viewMode = ViewMode.GRID;

  @override
  void initState() {
    super.initState();
    searchResult = fetchPeoples("");
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  onSearchTextChanged(String text) {
    setState(() {
      searchResult = fetchPeoples(text);
    });
  }

  Future<PeopleList> fetchPeoples(String string) async {
    final response = await http.get('https://swapi.dev/api/people/?search=' + string);
    if (response.statusCode == 200) {
      return PeopleList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  void handleClick(String value) {
    switch (value) {
      case 'Mode list':
        setState(() {
          viewMode = ViewMode.LIST;
        });
        break;
      case 'Mode grid':
        setState(() {
          viewMode = ViewMode.GRID;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('StarWars Persons Demo'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Mode list', 'Mode grid'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: TextField(
                controller: searchController,
                onChanged: (text) { onSearchTextChanged(text); },
              ),
            ),
          ),
          FutureBuilder<PeopleList>(
            future: searchResult,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(child: PersonList(personList: snapshot.data.results, viewMode: viewMode));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}

enum ViewMode { LIST, GRID }