import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_api/http/failure.dart';
import 'package:star_wars_api/models/people.dart';
import 'package:star_wars_api/models/people_list.dart';
import 'package:star_wars_api/widgets/person_list_widget.dart';

class PersonListScreen extends StatefulWidget {
  final String title;

  PersonListScreen({required this.title});

  @override
  _PersonListScreenState createState() => _PersonListScreenState();
}

class _PersonListScreenState extends State<PersonListScreen> {
  static const viewListLabel = 'Mode list';
  static const viewGridLabel = 'Mode grid';

  final searchController = TextEditingController();
  late List<Person> personList;
  late Future<PeopleList> searchResult;
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

    print('https://swapi.dev/api/people/?search=' + string);

    try {
      final response =
          await http.get('https://swapi.dev/api/people/?search=' + string);
      return PeopleList.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw Failure('Cannot connect to server');
    } on HttpException {
      throw Failure("Couldn't find the post");
    } on FormatException {
      throw Failure("Bad response format");
    }
  }

  void handleClick(String value) {
    switch (value) {
      case viewListLabel:
        setState(() {
          viewMode = ViewMode.LIST;
        });
        break;
      case viewGridLabel:
        setState(() {
          viewMode = ViewMode.GRID;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const paddingSize = 20.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('StarWars Persons'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {viewListLabel, viewGridLabel}.map((String choice) {
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
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: paddingSize, vertical: paddingSize),
            child: TextField(
              controller: searchController,
              onChanged: (text) {
                onSearchTextChanged(text);
              },
            ),
          ),
          FutureBuilder<PeopleList>(
              future: searchResult,
              builder: (context, snapshot) {
                print(snapshot.data?.results.toString());

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Expanded(
                        child: PersonList(
                            personList: snapshot.data?.results ?? [],
                            viewMode: viewMode),
                      );
                    }
                }
              })
        ],
      ),
    );
  }
}

enum ViewMode { LIST, GRID }
