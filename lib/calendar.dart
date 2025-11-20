import 'package:flutter/material.dart';
import 'todo.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });

      // Navega para a tela de tarefas do dia escolhido
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TodoPage(date: selectedDate)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendário')),
      body: Center(
        child: ElevatedButton(
          onPressed: pickDate,
          child: const Text('Selecionar dia'),
        ),
      ),
    );
  }
}