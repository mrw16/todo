class TodoModel {
  late String id;
  late String title;
  late bool isChecked;
  late DateTime createdAt;
  late DateTime updatedAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.isChecked,
    required this.createdAt,
    required this.updatedAt,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isChecked = json['isChecked'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
