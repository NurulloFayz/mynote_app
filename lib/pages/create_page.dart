import '../exporting_libs/exporting_libs.dart';

class CreatePage extends StatefulWidget {
  static const String id = 'createPage';
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var title = TextEditingController();
  var text = TextEditingController();
  static var times = DateTime.now();
  static var year = '${times.year}';
  static var month = '${times.month}';
  static var day = '${times.day}';
  static var hour = '${times.hour}';
  static var minute = '${times.minute}';
  String date = '$day-$month-$year, $hour:$minute';
  final Firestore firestore = Firestore();
  getNote(){

    if(title.text.isEmpty || text.text.isEmpty){
      showToast(context);
      return;
    }else{
      firestore.addNote(title.text, text.text,date);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
              left: MediaQuery.of(context).size.width/30
              ),
              child: TextField(
                controller: title,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(25)
                ],
                style: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/30,color: Colors.indigo),
                decoration: InputDecoration(
                  hintText: 'title',
                  hintStyle: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/20,
                  color: Colors.indigo
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.6)
              ),
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                  left: MediaQuery.of(context).size.width/30
              ),
              child: TextField(
                controller: text,
                maxLines: null,
                style: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/30),
                decoration: InputDecoration(
                    hintText: 'text',
                    hintStyle: GoogleFonts.cuprum(fontSize: MediaQuery.of(context).size.height/20),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/15,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done,color: Colors.white,),
        backgroundColor: Colors.indigo,
        onPressed: ()async{
          getNote();
        },
      ),
    );
  }
}
