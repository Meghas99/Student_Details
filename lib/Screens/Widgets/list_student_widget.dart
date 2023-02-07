import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hive_student_database/functions/db_functions.dart';

import '../../model/data_model.dart';
import 'display_student_screen.dart';
import 'edit_student.dart';

class ListStudentWidget extends StatefulWidget {
  const ListStudentWidget({super.key});

  @override
  State<ListStudentWidget> createState() => _ListStudentWidgetState();
}

class _ListStudentWidgetState extends State<ListStudentWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (context, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = studentList[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    File(
                      data.photo,
                    ),
                  ),
                ),
                title: Text(data.name),
                trailing: Wrap(
                  spacing: 12,
                  children: <Widget>[
                    IconButton(
                      onPressed: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) {
                              return EditStudent(
                                  name: data.name,
                                  age: data.age,
                                  address: data.address,
                                  number: data.phnNumber,
                                  index: index,
                                  image: data.photo,
                                  photo: '');
                            }),
                          ),
                        );

                        // if (data.id != null) {
                        //   deleteStudent(data.id!);
                        // } else {
                        //   print('student id is null, unable to delelte');
                        // }
                      }),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      tooltip: 'Edit',
                    ),
                    IconButton(
                      onPressed: (() {
                        showDialog(
                          context: context,
                          builder: ((context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: AlertDialog(
                                title: const Text(
                                  'Alert!',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                content: const Text(
                                  "Do you want to delete this student",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: (() {
                                      popoutfuction(context);
                                      deleteStudent(index);
                                    }),
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                      onPressed: (() {
                                        popoutfuction(context);
                                      }),
                                      child: const Text('No'))
                                ],
                              ),
                            );
                          }),
                        );
                      }),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      tooltip: 'delete',
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return DisplayStudent(
                          name: data.name,
                          age: data.age,
                          address: data.address,
                          number: data.phnNumber,
                          index: index,
                          photo: data.photo,
                        );
                      }),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: studentList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        );
      },
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
