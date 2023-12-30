import '../exporting_libs/exporting_libs.dart';

class Firestore{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String title,String text,String time){
    final userId = Auth.currentUserId();
    return notes.add({
      'userId' : userId,
      'title':title,
      'text':text,
      'time':time,
    });
  }
  Future<void> delNote(String docId){
    return notes.doc(docId).delete();
  }

  Stream<QuerySnapshot> getData(){
    final userId = Auth.currentUserId();
    final notesStream = notes.orderBy('time',descending: true).snapshots();
    return notes.where('userId', isEqualTo: userId).orderBy('time', descending: true).snapshots();
    return notesStream;
  }
  Stream<QuerySnapshot> fetchData(String userId) {
    return FirebaseFirestore.instance
        .collection('notes')
        .where(Auth.currentUserId(), isEqualTo: userId)
        .snapshots();
  }
}