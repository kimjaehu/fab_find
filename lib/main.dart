import 'package:flutter/material.dart';
import 'package:fab_find/services/auth_service.dart';
import 'package:fab_find/views/landing_page.dart';
import 'package:fab_find/widgets/provider_widget.dart';
import 'package:fab_find/views/sign_up_view.dart';
import 'package:fab_find/views/navigation_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Fab Find';

    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        // home: HomeController(), // with sign in anonymously
        home: SignUpView(
          authFormType: AuthFormType.signIn,
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
          '/signUp': (BuildContext context) => SignUpView(
                authFormType: AuthFormType.signUp,
              ),
          '/signIn': (BuildContext context) => SignUpView(
                authFormType: AuthFormType.signIn,
              ),
          '/anonymousSignIn': (BuildContext context) => SignUpView(
                authFormType: AuthFormType.anonymous,
              ),
          '/convertUser': (BuildContext context) => SignUpView(
                authFormType: AuthFormType.convert,
              ),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          // return signedIn ? MyHome() : LandingPage(); //with sign in anonymously
          return signedIn ? MyHome() : SignUpView(
                authFormType: AuthFormType.signIn,
              );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
