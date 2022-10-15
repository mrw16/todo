import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:todo/pages/forgot.dart';
import 'package:todo/pages/home/home.dart';
import 'package:todo/pages/sign_in.dart';
import 'package:todo/pages/sign_up.dart';
import 'package:todo/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign-up': (context) => const SignUp(),
        '/sign-in': (context) => const SignIn(),
        '/forgot-pw': (context) => const ForgotPassword(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
