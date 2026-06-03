import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<String> todos = [];
  TextEditingController controller = TextEditingController();

  void addTodo() {
    if (controller.text.isNotEmpty) {
      setState(() {
        todos.add(controller.text);
        controller.clear();
      });
    }
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Todo List')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller, decoration: InputDecoration(hintText: 'Add todo'))),
                SizedBox(width: 10),
                ElevatedButton(onPressed: addTodo, child: Text('Add')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => deleteTodo(index)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}