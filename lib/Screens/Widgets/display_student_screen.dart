import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_student_database/Screens/Widgets/edit_student.dart';

class DisplayStudent extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String number;
  final String photo;
  final int index;

  const DisplayStudent(
      {super.key,
      required this.name,
      required this.age,
      required this.address,
      required this.number,
      required this.photo,
      required this.index,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Student Full Details',
                  style: TextStyle(fontSize: 25, color: Colors.amber),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(
                  File(
                    photo,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name:$name',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Age:$age',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Address:$address',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Number:$number',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              ElevatedButton.icon(
                  onPressed:(  () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) {
                      return EditStudent(
                          name: name,
                          age: age,
                          address: address,
                          number: number,
                          index: index,
                          image: photo,
                          photo: '');
                    })));
                  }),
                   
                   icon: const Icon(Icons.edit),
                   label: const Text('Edit'))
            ],
          ),
        ),
      ),
      ),
    );
  }
}
