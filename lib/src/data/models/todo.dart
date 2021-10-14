class Todo {
  String todoMessage;
  String isCompleted;
  int id;

  Todo.fromJson(Map<String, dynamic> json)
      : todoMessage = json['todo'],
        isCompleted = json['isCompleted'],
        id = json['id'] as int;
}
