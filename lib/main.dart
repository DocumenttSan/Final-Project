import 'package:appnedic/screens/quiz/home.dart';
import 'package:appnedic/screens/splashscreen.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 10));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nedic',
      theme: ThemeData(
        primaryColor: const Color(0xff0874E6),
      ),
      // home: SplashScreen(),
      home: Home(),
    );
  }
}
