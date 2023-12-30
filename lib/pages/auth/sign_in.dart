
import '../../exporting_libs/exporting_libs.dart';

class SignIn extends StatefulWidget {
  static const String id = 'signin';
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var email = TextEditingController();
  var password = TextEditingController();

  signIn(){
    String email_controller = email.text.toString().trim();
    String password_controller = password.text.toString().trim();
    if(email_controller.isEmpty || password_controller.isEmpty){
      warningAuth(context);
      return;
    }else{
      Auth.SignInUser(email_controller, password_controller).then((value) => {
        responseIn(value)
      });
    }
  }

  void responseIn(User? fireUser)async {
    if (fireUser != null) {
      Navigator.pushReplacementNamed(context, allPages.id);
    }
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign in',style: GoogleFonts.cuprum(
              fontSize: MediaQuery.of(context).size.height/15,
            ),),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20,
                  left: MediaQuery.of(context).size.width/20
              ),
              child: TextField(
                style: GoogleFonts.cuprum(
                    fontSize: MediaQuery.of(context).size.height/35,color: Colors.black
                ) ,
                controller: email,
                decoration: InputDecoration(
                    hintText: 'email',
                    hintStyle: GoogleFonts.cuprum(
                        fontSize: MediaQuery.of(context).size.height/35,color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey)
                    )
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20,
                  left: MediaQuery.of(context).size.width/20
              ),
              child: TextField(
                style:  GoogleFonts.cuprum(
                    fontSize: MediaQuery.of(context).size.height/35,color: Colors.black
                ),
                controller: password,
                decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: GoogleFonts.cuprum(
                        fontSize: MediaQuery.of(context).size.height/35,color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.grey
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account",style: GoogleFonts.cuprum(
                  fontSize: MediaQuery.of(context).size.height/40,color: Colors.grey,
                )),
                SizedBox(width: MediaQuery.of(context).size.width/50,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AuthPage.id);
                  },
                  child: Text('Sign up',style: GoogleFonts.cuprum(
                    fontSize: MediaQuery.of(context).size.height/40,color: Colors.black,
                  )),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            GestureDetector(
              onTap: (){
                signIn();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.indigo
                ),
                height: MediaQuery.of(context).size.height/12,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20,
                    left: MediaQuery.of(context).size.width/20
                ),
                child: Center(
                  child: Text('Sign in',style: GoogleFonts.cuprum(
                      fontSize: MediaQuery.of(context).size.height/30,color: Colors.black
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
