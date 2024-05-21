import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/notesModel.dart';

class NotesController extends GetxController{
  final titleController = TextEditingController();
  final descController = TextEditingController();
  List<NotesModel> notesList = [];
  addNote()async{
    final map = {
      "title":titleController.text
      ,"description": descController.text,
      "time": DateTime.now().millisecondsSinceEpoch
    };
    var notesData = NotesModel.fromJson(map);
    notesList.add(notesData);
    print(notesList);
    await SqfLiteDatabase.insertData(notesData);
    titleController.clear();
    descController.clear();
    update();
  }

  insertData(NotesModel model)async{

  }
  getNotes()async{
   notesList = await SqfLiteDatabase.getDataFromDatabase();
   print(notesList.length);
update();
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotes();
  }

}