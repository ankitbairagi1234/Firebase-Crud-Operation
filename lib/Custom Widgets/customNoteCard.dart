import 'package:flutter/material.dart';

class CustomNoteCard extends StatelessWidget {
  final String time;
  final String title;
  final String content;
  final VoidCallback onEditTap;
  final VoidCallback onDeletTap;
  const CustomNoteCard(
      {Key? key,
      required this.time,
      required this.title,
      required this.content,
      required this.onEditTap,
      required this.onDeletTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width / 1,
        color: Colors.grey.shade300,
        height: 130,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              content,
              style: TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onEditTap,
                  child: Icon(Icons.edit),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: onDeletTap,
                  child: Icon(Icons.delete),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
