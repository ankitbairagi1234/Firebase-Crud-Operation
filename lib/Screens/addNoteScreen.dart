import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Custom%20Widgets/customTextField.dart';
import 'package:note_app/Model/NoteModel.dart';
import 'package:note_app/firestoreDatabase.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){},
          child: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final noteModel = NoteModel(title: titleController.text, content: contentController.text, date: DateTime.now(), documentId: '');
          await FirestoreDatabase.addNote(noteModel);
          Get.snackbar('Done', "Note is saved in Firebase");
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.done, color: Colors.white,),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            CustomTextField(hintText: 'Title', controller: titleController,),
            Divider(color: Colors.black, thickness: 2),
            Expanded(child: CustomTextField(hintText: 'Content', controller:  contentController,)),
          ],
        ),
      ),
    ));
  }
}
