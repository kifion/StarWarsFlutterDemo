class Person {
    String birth_year;
    String created;
    String edited;
    String eye_color;
    List<String> films;
    String gender;
    String hair_color;
    String height;
    String homeworld;
    String mass;
    String name;
    String skin_color;
    List<String> species;
    List<String> starships;
    String url;
    List<String> vehicles;

    Person({this.birth_year, this.created, this.edited, this.eye_color, this.films, this.gender, this.hair_color, this.height, this.homeworld, this.mass, this.name, this.skin_color, this.species, this.starships, this.url, this.vehicles});

    factory Person.fromJson(Map<String, dynamic> json) {
        return Person(
            birth_year: json['birth_year'], 
            created: json['created'], 
            edited: json['edited'], 
            eye_color: json['eye_color'], 
            films: json['films'] != null ? new List<String>.from(json['films']) : null, 
            gender: json['gender'], 
            hair_color: json['hair_color'], 
            height: json['height'], 
            homeworld: json['homeworld'], 
            mass: json['mass'], 
            name: json['name'], 
            skin_color: json['skin_color'], 
            species: json['species'] != null ? new List<String>.from(json['species']) : null, 
            starships: json['starships'] != null ? new List<String>.from(json['starships']) : null,
            url: json['url'], 
            vehicles: json['vehicles'] != null ? new List<String>.from(json['vehicles']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['birth_year'] = this.birth_year;
        data['created'] = this.created;
        data['edited'] = this.edited;
        data['eye_color'] = this.eye_color;
        data['gender'] = this.gender;
        data['hair_color'] = this.hair_color;
        data['height'] = this.height;
        data['homeworld'] = this.homeworld;
        data['mass'] = this.mass;
        data['name'] = this.name;
        data['skin_color'] = this.skin_color;
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