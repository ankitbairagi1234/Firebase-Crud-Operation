


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/Model/NoteModel.dart';

class FirestoreDatabase {

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static addNote(NoteModel noteModel) async{
    await firebaseFirestore.collection('note').add({
      'date' : noteModel.date.toString(),
      'title' : noteModel.title,
      'content' : noteModel.content
    });
  }

  static deleteNote(String documentId) async {
    await firebaseFirestore.collection('note').doc(documentId).delete();
  }

}