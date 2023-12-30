


import '../exporting_libs/exporting_libs.dart';

void showToast(BuildContext context) {
  FToast fToast;
  fToast = FToast();
  // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  fToast.init(context);
  fToast.showToast(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,9),
                  blurRadius: 20,
                  blurStyle: BlurStyle.normal,
                  color: Colors.black.withOpacity(0.2),
                )
              ]
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/15,
          child: Center(
              child: Text("empty text & title",style: GoogleFonts.share(fontSize: MediaQuery.of(context).size.height/40,color: Colors.white),)),),
      ),
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 25.0,
          left: MediaQuery.of(context).size.width/3-90,
          right: MediaQuery.of(context).size.width/3-90,
          child: child,
        );
      });
}
void warningAuth(BuildContext context) {
  FToast fToast;
  fToast = FToast();
  // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  fToast.init(context);
  fToast.showToast(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,9),
                  blurRadius: 20,
                  blurStyle: BlurStyle.normal,
                  color: Colors.black.withOpacity(0.2),
                )
              ]
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/15,
          child: Center(
              child: Text("enter email & password",style: GoogleFonts.share(fontSize: MediaQuery.of(context).size.height/40,color: Colors.white),)),),
      ),
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 25.0,
          left: MediaQuery.of(context).size.width/3-90,
          right: MediaQuery.of(context).size.width/3-90,
          child: child,
        );
      });
}