import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_student_database/model/data_model.dart';

import 'Screens/Home_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  // if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScreenHome(),
    );
  }
}
