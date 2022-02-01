class Todo {
  String text;
  dynamic done;

  Todo({required this.text, this.done = false});

  factory Todo.formJSON(Map<String, dynamic> json) => Todo(
        text: json['text'],
        done: json['done'],
      );

  Map<String, dynamic> toJSON() => {'text': text, 'done': done};
}
