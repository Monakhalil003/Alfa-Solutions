import 'package:flutter/material.dart';
import 'common_drawer.dart';
import 'note_card.dart';
import 'tasks.dart';

class to_do_list extends StatefulWidget {
  @override
  State<to_do_list> createState() => _to_do_listState();
}

class _to_do_listState extends State<to_do_list> {
  final List<Task> tasks = [
    Task(title: "Today's Tasks", subtasks: [SubTask(title: 'Grocery Shopping'), SubTask(title: 'Dentist Appointment')]),
    Task(title: "Upcoming Tasks", subtasks: [SubTask(title: 'Laundry'), SubTask(title: 'Shopping')]),
    Task(title: "Overdue Tasks", subtasks: [SubTask(title: 'Nail Appointment')]),
  ];

  void toggleSubTask(int taskIndex, int subTaskIndex, bool? value) {
    setState(() {
      tasks[taskIndex].subtasks[subTaskIndex].isCompleted = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Daily Activities by MK!'),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'My To-Do-List',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    shadows: [
                      Shadow(
                        color: Colors.purpleAccent,
                        blurRadius: 2.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return NoteCard(
                      title: tasks[index].title,
                      taskIndex: index,
                      subTasks: tasks[index].subtasks,
                      onToggleSubTask: toggleSubTask,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: CommonDrawer(currentPage: 'to_do_list'),
    );
  }
}
