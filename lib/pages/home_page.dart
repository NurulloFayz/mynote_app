import '../exporting_libs/exporting_libs.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final Firestore firestore = Firestore();
  Future<void> delete(String documentId) async {
    var documentReference = FirebaseFirestore.instance.collection('notes').doc(documentId);
    await documentReference.delete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Notes',style: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/15),),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height/30,),
          Expanded(
            child:StreamBuilder<QuerySnapshot>(
              stream: firestore.getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading indicator or placeholder while waiting for data
                  return Text('');
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  // No data case
                  return Center(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/wirte.png',height: MediaQuery.of(context).size.height/5,),
                        SizedBox(height: MediaQuery.of(context).size.height/30,),
                        Text('No notes',style: GoogleFonts.cuprum(
                          fontSize: MediaQuery.of(context).size.height/30,
                          color: Colors.indigo,fontWeight: FontWeight.bold
                        ),)
                      ],
                    )
                  );
                } else {
                  return Column(
                    children: snapshot.data!.docs.map((note) => allNotes(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TextPage(note)));
                    }, note)).toList(),
                  );
                }
              },
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create_sharp,color: Colors.white,),
        backgroundColor: Colors.indigo,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
      ),
    );
  }
  Widget allNotes(Function()? onTap,QueryDocumentSnapshot doc){
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/10,
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
            left: MediaQuery.of(context).size.width/30
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.5)
            ),
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width/20,),
                Text(doc['title'],style: GoogleFonts.cuprum(
                  fontSize: MediaQuery.of(context).size.height/30,color: Colors.indigo
                )),
                Spacer(),
                GestureDetector(
                  onTap: ()async{
                    // FirebaseFirestore firestore = FirebaseFirestore.instance;
                    // DocumentReference doc = firestore.collection('notes').doc();
                    // await doc.delete();
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context,) {
                        return AlertDialog(
                          title:  Text('Deleting',style: GoogleFonts.cuprum(
                              fontSize: MediaQuery.of(context).size.height/35
                          )),
                          content: Text('Are you sure? ',style: GoogleFonts.cuprum(
                              fontSize: MediaQuery.of(context).size.height/35
                          ),),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: Theme.of(context).textTheme.labelLarge,
                              ),
                              child:  Text('No',style: GoogleFonts.cuprum(
                                  fontSize: MediaQuery.of(context).size.height/35
                              )),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: Theme.of(context).textTheme.labelLarge,
                              ),
                              child:  Text('Yes',style: GoogleFonts.cuprum(
                                  fontSize: MediaQuery.of(context).size.height/35,
                                  color: Colors.red
                              )),
                              onPressed: ()async {
                                Navigator.of(context).pop();
                                String docId = doc.id; // Get the document ID from QueryDocumentSnapshot
                                await delete(docId);

                              },
                            ),
                          ],
                        );
                      },
                    );

                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width/7,
                    decoration:BoxDecoration(
                        color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ) ,
                      child: Icon(Icons.delete_rounded,)

                  ),
                ),

              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/40,)
      ],
    );
  }
}
