class Todo {
  String? text;
  dynamic done;

  Todo({ this.text, this.done = false});

  factory Todo.formJson(Map<String, dynamic> json) => Todo(
        text: json['text'],
        done: json['done'],
      );

  Map<String, dynamic> toJson() => {'text': text, 'done': done};
}
