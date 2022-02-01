import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_todo_getx/controllers/todocontroller.dart';
import 'package:task_todo_getx/models/todo.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(99, 201, 254, 1),
        child: Icon(
          Icons.add,
          size: 50,
        ),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Add Task",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(99, 201, 254, 1)),
                          ),
                        ),
                        TextField(
                          controller: textEditingController,
                          autofocus: true,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(99, 201, 254, 1)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromRGBO(99, 201, 254, 1)),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(99, 201, 254, 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(99, 201, 254, 1)),
                              onPressed: () {
                                todoController.todos.add(
                                    Todo(text: textEditingController.text));
                                Get.back();
                              },
                              child: Text("Add")),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      backgroundColor: Color.fromRGBO(99, 201, 254, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 201, 254, 1),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(99, 201, 254, 1),
            child: Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 36,
                    child: Icon(
                      Icons.list,
                      size: 50,
                      color: Color.fromRGBO(99, 201, 254, 1),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () => Text(
                      "${todoController.todos.length} Tasks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Obx(() => ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                          todoController.todos[index].text.toString(),
                          style: (todoController.todos[index].done)
                              ? TextStyle(
                                  decoration: TextDecoration.lineThrough)
                              : TextStyle(),
                        ),
                        onLongPress: () {
                          todoController.todos.removeAt(index);
                        },
                        trailing: Checkbox(
                          value: todoController.todos[index].done,
                          onChanged: (val) {
                            var change = todoController.todos[index];
                            change.done = val;
                            todoController.todos[index] = change;
                          },
                        ),
                      ),
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: todoController.todos.length)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            ),
          ),
        ],
      ),
    );
  }
}
