import 'package:star_wars_persons/models/people.dart';

class PeopleList {
    int count;
    String next;
    String previous;
    List<Person> results;

    PeopleList({this.count, this.next, this.previous, this.results});

    factory PeopleList.fromJson(Map<String, dynamic> json) {
        return PeopleList(
            count: json['count'] != null ? json['count'] : null,
            next: json['next'] != null ? json['next'] : "",
            previous: json['previous'] != null ? json['previous'] : "",
            results: json['results'] != null ? (json['results'] as List).map((i) => Person.fromJson(i)).toList() : [],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.count != null) {
            data['count'] = this.count;
        }
        if (this.next != null) {
            data['next'] = this.next;
        }
        if (this.previous != null) {
            data['previous'] = this.previous;
        }
        if (this.results != null) {
            data['results'] = this.results.map((v) => v.toJson()).toList();
        }
        return data;
    }
}