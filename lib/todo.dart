import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  final DateTime date;

  const TodoPage({Key? key, required this.date}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Map<String, dynamic>> tasks = [];
  String newTask = '';

  void addTask() {
    if (newTask.trim().isEmpty) return;

    setState(() {
      tasks.add({
        'text': newTask.trim(),
        'done': false,
      });
      newTask = '';
    });
  }

  void toggleTask(Map<String, dynamic> task, bool? value) {
    setState(() {
      task['done'] = value ?? false;
    });
  }

  List<Widget> buildTaskList() {
    // separar pendentes e concluídas
    final pending = tasks.where((t) => t['done'] == false).toList();
    final done = tasks.where((t) => t['done'] == true).toList();

    // ordenação alfabética
    pending.sort((a, b) => a['text'].toLowerCase().compareTo(b['text'].toLowerCase()));
    done.sort((a, b) => a['text'].toLowerCase().compareTo(b['text'].toLowerCase()));

    List<Widget> widgets = [];

    // pendentes
    for (var task in pending) {
      widgets.add(
        CheckboxListTile(
          title: Text(task['text']),
          value: task['done'],
          onChanged: (val) => toggleTask(task, val),
        ),
      );
    }

    // concluídas
    for (var task in done) {
      widgets.add(
        CheckboxListTile(
          title: Text(
            task['text'],
            style: const TextStyle(decoration: TextDecoration.lineThrough),
          ),
          value: task['done'],
          onChanged: (val) => toggleTask(task, val),
        ),
      );
    }

    if (widgets.isEmpty) {
      widgets.add(
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(child: Text('Nenhuma tarefa para este dia.')),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final dateString =
        '${widget.date.day}/${widget.date.month}/${widget.date.year}';

    return Scaffold(
      appBar: AppBar(title: Text('Tarefas - $dateString')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) => newTask = text,
                    decoration: const InputDecoration(
                      labelText: 'Adicionar tarefa',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addTask,
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: buildTaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
