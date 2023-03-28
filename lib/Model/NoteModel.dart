import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {

  String? documentId;
  late String? title;
  late String? content;
  late DateTime date;

  NoteModel ({ required this.title, required this.content, required this.date, required this.documentId});

  NoteModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}){
    documentId = documentSnapshot.id;
    title = documentSnapshot['title'];
    content = documentSnapshot['content'];
    date = documentSnapshot['date'];
  }

}