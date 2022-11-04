class Places {
  Places({
    required this.name,
    required this.place,
    required this.rating,
    required this.picture,
  });

  String name;
  String place;
  double rating;
  String picture;

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        name: json["name"],
        place: json["place"],
        rating: json["rating"] as double,
        picture: json["picture"],
      );
}
