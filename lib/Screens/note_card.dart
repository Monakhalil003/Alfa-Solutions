import 'package:flutter/material.dart';
import 'tasks.dart';
import 'To_do_list.dart';

class NoteCard extends StatefulWidget {
  final String title;
  final int taskIndex;
  final List<SubTask> subTasks;
  final Function(int, int, bool?) onToggleSubTask;

  NoteCard({
    required this.title,
    required this.taskIndex,
    required this.subTasks,
    required this.onToggleSubTask,
  });

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final TextEditingController _controller = TextEditingController();
  bool _showInputField = false;
  bool _showDeleteField = false;
  bool _showEditField = false;
  int? _editIndex;

  void addTask() {
    setState(() {
      widget.subTasks.add(SubTask(title: _controller.text, isCompleted: false));
      _controller.clear();
      _showInputField = false;
    });
  }

  void deleteTask() {
    if (_showDeleteField) {
      int? index = int.tryParse(_controller.text);
      if (index != null && index >= 0 && index < widget.subTasks.length) {
        setState(() {
          widget.subTasks.removeAt(index);
          _controller.clear();
          _showDeleteField = false;
        });
      } else {
        print('Invalid index');
      }
    }
  }

  void editTask() {
    if (_editIndex != null && _controller.text.isNotEmpty) {
      setState(() {
        if (_editIndex! >= 0 && _editIndex! < widget.subTasks.length) {
          widget.subTasks[_editIndex!] = SubTask(
            title: _controller.text,
            isCompleted: widget.subTasks[_editIndex!].isCompleted,
          );
          _controller.clear();
          _editIndex = null;
          _showEditField = false;
        } else {
          print('Invalid index');
        }
      });
    }
  }

  void startEditing(int index) {
    setState(() {
      _editIndex = index;
      _controller.text = widget.subTasks[index].title;
      _showEditField = true;
      _showInputField = false;
      _showDeleteField = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.subTasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.subTasks[index].title),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => startEditing(index),
                    ),
                    leading: Checkbox(
                      value: widget.subTasks[index].isCompleted,
                      onChanged: (value) {
                        widget.onToggleSubTask(widget.taskIndex, index, value);
                      },
                    ),
                  );
                },
              ),
            ),
            if (_showInputField)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'New Task',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: addTask,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        minimumSize: Size(60, 35),
                      ),
                      child: Text('Add', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            if (_showDeleteField)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Index to Delete',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: deleteTask,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        minimumSize: Size(60, 35),
                      ),
                      child: Text('Delete', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            if (_showEditField)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Edit Task',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: editTask,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        minimumSize: Size(60, 35),
                      ),
                      child: Text('Save', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showInputField = !_showInputField;
                      if (_showInputField) {
                        _showDeleteField = false;
                        _showEditField = false;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                    minimumSize: Size(60, 35),
                  ),
                  child: Text(
                    _showInputField ? 'Cancel' : 'Add Task',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showDeleteField = !_showDeleteField;
                      if (_showDeleteField) {
                        _showInputField = false;
                        _showEditField = false;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                    minimumSize: Size(60, 35),
                  ),
                  child: Text(
                    _showDeleteField ? 'Cancel' : 'Delete Task',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
