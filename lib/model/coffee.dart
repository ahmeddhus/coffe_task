
class Coffee {
  Coffee({
    this.title,
    this.description,
    this.ingredients,
    this.image,
    this.id,
  });

  Coffee.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'] != null ? json['ingredients'].cast<String>() : [];
    image = json['image'];
    id = json['id'] is int ? json['id'] as int : int.tryParse(json['id'].toString());
  }

  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['ingredients'] = ingredients;
    map['image'] = image;
    map['id'] = id;
    return map;
  }
}
