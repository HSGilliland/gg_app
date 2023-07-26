//Main package Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Import Screens
import './screens/auth/auth_screen.dart';
import './screens/home/student_home_screen.dart';
import './screens/home/splash_screen.dart';

//Import Providers
import './providers/auth/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isSignedIn
              ? StudentHomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen()),
          routes: {
            '/student/home': (ctx) => StudentHomeScreen(),
          },
        ),
      ),
    );
  }
}
