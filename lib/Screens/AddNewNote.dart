import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/notesController.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NotesController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add New"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextFormField(
                  maxLines: 1,
                  controller: controller.titleController,
                  decoration: InputDecoration(hintText: "Title"),
                ),TextFormField(
                  controller: controller.descController,
                  maxLines: 4,
                  decoration: InputDecoration(hintText: "Description"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(child: Center(child: ElevatedButton(onPressed: (){
                  controller.addNote();
                  Get.back();
                },child: Text("Add"),),),)
              ],
            ),
          ),
        );
      }
    );
  }
}
