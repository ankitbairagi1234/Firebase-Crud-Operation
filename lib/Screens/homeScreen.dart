import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Custom%20Widgets/customNoteCard.dart';
import 'package:note_app/Screens/addNoteScreen.dart';
import 'package:note_app/Screens/edit_note.dart';
import 'package:note_app/firestoreDatabase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNoteScreen());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Notes",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
                "${FirebaseFirestore.instance.collection('note').snapshots().length.toString()}"),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 400,
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('note').snapshots(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot note =
                              snapshot.data!.docs[index];
                          return CustomNoteCard(
                              onEditTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditNote(id: note.id.toString()),
                                    ));
                              },
                              onDeletTap: () {
                                FirestoreDatabase.deleteNote(
                                    "${note['documentId'].toString()}");
                              },
                              time: "${note['date'].toString()}",
                              title: "${note['title'].toString()}",
                              content: "${note['content'].toString()}");
                          //   Card(
                          //   child: Column(
                          //     children: [
                          //       Text('${note['title'].toString()}'),
                          //       Text('${note['content'].toString()}'),
                          //       Text('${note['date']  }')
                          //     ],
                          //   ),
                          // );
                        });
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
