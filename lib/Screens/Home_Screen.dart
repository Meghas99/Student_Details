import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_student_database/Screens/Widgets/list_student_widget.dart';
import 'package:hive_student_database/Screens/Widgets/search_screen.dart';
import 'package:hive_student_database/functions/db_functions.dart';

import 'Widgets/add_student_widget.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    // TODO: implement initState
    getAllStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Open Search',
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchWidget(),
              );
            },
          ),
        ],
      ),
      body: const ListStudentWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddStudentWidget();
              },
            ),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add students',
      ),
    );
  }
}
