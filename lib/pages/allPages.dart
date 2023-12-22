import 'package:flutter/material.dart';

import 'home_page.dart';

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
          HomePage()
        ],
      ),
    );
  }
}
