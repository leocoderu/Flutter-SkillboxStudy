class Person {
  final int     id;
  final String? name;
  final String? birthYear;
  final String? eyeColor;
  final String? gender;
  final String? hairColor;
  final String? height;
  final String? mass;
  final String? skinColor;
  final String? homeWorld;
  final String? url;
  final String? imgUrl;
  final String? created;
  final String? edited;

  Person(this.id, this.name, this.birthYear, this.eyeColor, this.gender, this.hairColor, this.height, this.mass,
      this.skinColor, this.homeWorld, this.url, this.imgUrl, this.created, this.edited);

  Person.fromJson(Map<String, dynamic> json, this.id, this.imgUrl)
    : name = json["name"],
      birthYear = json["birth_year"],
      eyeColor = json["eye_color"],
      gender = json["gender"],
      hairColor = json["hair_color"],
      height = json["height"],
      mass = json["mass"],
      skinColor = json["skin_color"],
      homeWorld = json["homeworld"],
      url = json["url"],
      created = json["created"],
      edited = json["edited"];
}