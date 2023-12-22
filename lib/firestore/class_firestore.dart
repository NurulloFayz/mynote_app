import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String title,String text,String time){
    return notes.add({
      'title':title,
      'text':text,
      'time':time,
    });
  }
  Future<void> delNote(String docId){
    return notes.doc(docId).delete();
  }

  Stream<QuerySnapshot> getData(){
    final notesStream = notes.orderBy('time',descending: true).snapshots();
    return notesStream;
  }
}