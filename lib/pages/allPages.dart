import '../exporting_libs/exporting_libs.dart';

class allPages extends StatefulWidget {
  static const String id = 'allpages';
  const allPages({Key? key}) : super(key: key);

  @override
  State<allPages> createState() => _allPagesState();
}

class _allPagesState extends State<allPages> {
  PageController? controller;
  int selected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (int index){
          setState(() {
            selected = index;
          });
        },
        children: [
          HomePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_filled,color: Colors.indigo,),
              icon: Icon(Icons.home_filled,color: Colors.black,),label: ''),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person,color: Colors.indigo,),
              icon: Icon(Icons.person,color: Colors.black,),label: ''),
        ],
        currentIndex: selected,
        onTap: (int index){
          setState(() {
            selected  = index;
            controller?.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
