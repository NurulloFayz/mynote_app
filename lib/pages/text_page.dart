import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPage extends StatefulWidget {
  static const String id = 'textpage';
  TextPage(this.doc,{Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/20,),
                Text(widget.doc['title'],style: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/30,
                fontWeight: FontWeight.bold,color: Colors.indigo
                ),)
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/45,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/20,),
                Text(widget.doc['time'],style: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/40,
                color: Colors.grey
                ),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
              left: MediaQuery.of(context).size.width/30,
              ),
                child: Text(widget.doc['text'],style: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/30),)),
          ],
        ),
      ),
    );
  }
}
