



import 'exporting_libs/exporting_libs.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'mynote_app',
      options: FirebaseOptions(
          apiKey: 'apiKey',
          appId: 'appId',
          messagingSenderId: 'messagingSenderId',
          projectId: 'projectId')
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: !Auth.isLoggedin() ? AuthPage() :SplashPage(),
      routes: {
        allPages.id:(context) => allPages(),
        HomePage.id:(context) => HomePage(),
        SplashPage.id:(context) => SplashPage(),
        ProfilePage.id:(context) => ProfilePage(),
        AuthPage.id:(context) => AuthPage(),
        SignIn.id:(context) => SignIn(),
      },
    );
  }
}
