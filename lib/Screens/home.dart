import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Screens/AddNewNote.dart';
import 'package:notes_app/notesController.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
init: NotesController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("Notes App"),
          ),
          body: ListView.builder(
              itemCount: controller.notesList.length,
              itemBuilder: (context, index){
            return ListTile(
              leading: Icon(Icons.note_alt_sharp),
              title: Text(controller.notesList[index].title.toString()),
            subtitle: Text(controller.notesList[index].description.toString()),
              trailing: IconButton(onPressed: (){},icon: Icon(Icons.edit),),
            );
          }),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Get.to(()=>AddNewNote());
          },child: Icon(Icons.add),),
        );
      }
    );
  }
}