import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Screens/home.dart';
import 'package:notes_app/database.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await SqfLiteDatabase.initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const HomeScreen(),
    );
  }
}

