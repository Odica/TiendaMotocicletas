import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tienda_online/firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

  // final prefs = await SharedPreferences.getInstance();
  // final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // runApp(MyApp(isLoggedIn: isLoggedIn));
  runApp(const MyApp(isLoggedIn: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required bool isLoggedIn});
  
  // final bool isLoggedIn;

  // const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final providers = [EmailAuthProvider()];

    void onSignedIn() {
      Navigator.pushReplacementNamed(context, '/profile');
    }

    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        '/sign-in': (context) {
          return SignInScreen(
            providers: providers,
            actions: [
              AuthStateChangeAction<UserCreated>((context, state) {
                Navigator.pushReplacementNamed(context, '/profile');
                
              }),
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacementNamed(context, '/profile');
                
              }),
            ],
          );
        },
        '/profile': (context) {
          return ProfileScreen(
            providers: providers,
            actions: [
              SignedOutAction((context) {
                Navigator.pushReplacementNamed(context, '/sign-in');
              }),
            ],
          );
        },
      },
    );
  }
}
