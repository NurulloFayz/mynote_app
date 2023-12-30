import '../exporting_libs/exporting_libs.dart';
class ProfilePage extends StatefulWidget {
  static const String id = 'profilepage';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.indigo,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(70),
                          topLeft: Radius.circular(70),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height/10,),
                          Text('${Auth.currentUserEmail()}',style: GoogleFonts.cuprum(
                            fontSize: MediaQuery.of(context).size.height/30,
                            color: Colors.indigo
                          ),),
                          SizedBox(height: MediaQuery.of(context).size.height/10,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Auth.SignOutUser(context);
                                Navigator.pushReplacementNamed(context, AuthPage.id);
                              });
                            },
                            child: Text('Logout',style: GoogleFonts.cuprum(
                              fontSize: MediaQuery.of(context).size.height/30,
                              color: Colors.red,fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 20,
                    left: MediaQuery.of(context).size.width / 2 - 70,
                    right: MediaQuery.of(context).size.width / 2 - 70,
                    child: Center(
                      child: Image.asset('images/user (6).png',height: MediaQuery.of(context).size.height/3,),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



