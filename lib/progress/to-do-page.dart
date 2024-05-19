import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Tasks(),
    );
  }
}

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
     backgroundColor: const Color(0xFFFAEBD2), // Change background color here
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment(0.00, -1.00),
      //         end: Alignment(0, 1),
      //         colors: [Color(0xFFD7B883), Color(0x00F7E0BA), Color(0xFFFAEBD2)],
      //       ),
      //     ),
      //   ),
      //   title: const Center(
      //     child: Text(
      //       'Tasks',
      //       style: TextStyle(
      //         color: Color(0xFF333232),
      //         fontFamily: 'Poppins',
      //         fontSize: 20,
      //         fontWeight: FontWeight.w700,
      //       ),
      //     ),
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // Task girl illustration 
          Container(
              padding: const EdgeInsets.only(left: 30, top: 75, right: 30),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/graphics/task-girl.png',
                  width: 210,
                  height: 195,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // "YOUR TASKS" text space
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              alignment: Alignment.center,
              child: Text(
                'YOUR TASKS',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF3D405B),
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

          Container(
            child: const Expanded(
              child: TodoListWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  List<TodoItem> todoItems = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the list with pre-populated to-do items
    todoItems = [
      // TodoItem("Task 1", false),
      // TodoItem("Task 2", true),
      // TodoItem("Task 3", false),
    ];
  }

  void addTodoItem() {
    String text = controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        todoItems.add(TodoItem(text, false));
        controller.clear();
      });
    }
  }

  void toggleTodoItem(int index) {
    setState(() {
      bool isChecked = !todoItems[index].isDone;
      todoItems[index].isDone = isChecked;

      // If the task is done, wait for 0.5 seconds, then remove it from the list
      if (isChecked) {
        Future.delayed(const Duration(milliseconds: 700), () {
          setState(() {
            todoItems.removeAt(index);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todoItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  todoItems[index].text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    decoration: todoItems[index].isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: todoItems[index].isDone ? const Color(0x803D405B) : const Color(0xFF3D405B),
                    fontFamily: 'Poppins',
                  ),
                ),
                leading: Checkbox(
                  value: todoItems[index].isDone,
                  onChanged: (value) {
                    toggleTodoItem(index);
                  },
                  activeColor: Color(0xFF064147),
                ),
              );
            },
          ),
        ),

        // Add new tasks button
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x600FA3B1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(15),
                  iconSize: 30,
                  icon: SvgPicture.asset('assets/icons/plus.svg', color:  const Color(0xFF3D405B)),
                  onPressed: addTodoItem,
                  //color: const Color(0xFF3D405B),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3D405B),
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.left,
                      onSubmitted: (_) {
                        addTodoItem();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TodoItem {
  final String text;
  bool isDone;

  TodoItem(this.text, this.isDone);
}
