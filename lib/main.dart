import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/firebase_options.dart';
import 'package:social/pages/home_page.dart';
import 'package:social/pages/login_page.dart';
import 'package:social/pages/register_page.dart';
import 'package:social/services/auth/auth_gate.dart';
import 'package:social/services/auth/login_or_register.dart';
import 'package:social/themes/theme_provider.dart';

void main() async {
//firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//run app
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
