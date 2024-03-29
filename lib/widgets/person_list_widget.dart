import 'package:flutter/material.dart';
import 'package:star_wars_api/models/people.dart';
import 'package:star_wars_api/screens/detail_info_screen.dart';
import 'package:star_wars_api/screens/person_list_screen.dart';

class PersonList extends StatefulWidget {
  final List<Person> personList;
  final ViewMode viewMode;

  PersonList({required this.personList, required this.viewMode});

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  _PersonListState();

  var builder;

  @override
  void initState() {
    super.initState();
    setBuilder();
  }

  void setBuilder() {
    const paddingSize = 20.0;

    if (widget.viewMode == ViewMode.GRID) {
      builder = GridView.builder(
        itemCount: widget.personList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => DetailInfoScreen(person: widget.personList[index]))),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: paddingSize, vertical: paddingSize),
              child: Text(widget.personList[index].name),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
      );
    } else {
      builder = ListView.builder(
        itemCount: widget.personList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) =>
                    DetailInfoScreen(person: widget.personList[index]))),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: paddingSize, vertical: paddingSize),
              child: Text(widget.personList[index].name),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    setBuilder();
    return Container(
      child: builder,
    );
  }
}
