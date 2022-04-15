class Person {
  String birthYear;
  String created;
  String edited;
  String eyeColor;
  List<String> films;
  String gender;
  String hairColor;
  String height;
  String homeWorld;
  String mass;
  String name;
  String skinColor;
  List<String> species;
  List<String> starships;
  String url;
  List<String> vehicles;

  Person(
      {required this.birthYear,
      required this.created,
      required this.edited,
      required this.eyeColor,
      required this.films,
      required this.gender,
      required this.hairColor,
      required this.height,
      required this.homeWorld,
      required this.mass,
      required this.name,
      required this.skinColor,
      required this.species,
      required this.starships,
      required this.url,
      required this.vehicles});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      birthYear: json['birth_year'],
      created: json['created'],
      edited: json['edited'],
      eyeColor: json['eye_color'],
      films: json['films'] != null
          ? List<String>.from(json['films'])
          : List.empty(),
      gender: json['gender'],
      hairColor: json['hair_color'],
      height: json['height'],
      homeWorld: json['homeworld'],
      mass: json['mass'],
      name: json['name'],
      skinColor: json['skin_color'],
      species: json['species'] != null
          ? List<String>.from(json['species'])
          : List.empty(),
      starships: json['starships'] != null
          ? List<String>.from(json['starships'])
          : List.empty(),
      url: json['url'],
      vehicles: json['vehicles'] != null
          ? List<String>.from(json['vehicles'])
          : List.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birth_year'] = this.birthYear;
    data['created'] = this.created;
    data['edited'] = this.edited;
    data['eye_color'] = this.eyeColor;
    data['gender'] = this.gender;
    data['hair_color'] = this.hairColor;
    data['height'] = this.height;
    data['homeworld'] = this.homeWorld;
    data['mass'] = this.mass;
    data['name'] = this.name;
    data['skin_color'] = this.skinColor;
    data['url'] = this.url;
    if (this.films != null) {
      data['films'] = this.films;
    }
    if (this.species != null) {
      data['species'] = this.species;
    }
    if (this.starships != null) {
      data['starships'] = this.starships;
    }
    if (this.vehicles != null) {
      data['vehicles'] = this.vehicles;
    }
    return data;
  }
}
