import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key, this.id}) : super(key: key);

  final String? id;
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final firebaseFirestore = FirebaseFirestore.instance.collection('note');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Note'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('note')
              .where('id', isEqualTo: widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            var data = snapshot.data!.docs.first;
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: titleController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: contentController,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
