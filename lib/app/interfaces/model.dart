abstract class Model {
  int? id;
  String? name;

  Model({this.id, this.name});

  Map<String, dynamic> toMap();
}
