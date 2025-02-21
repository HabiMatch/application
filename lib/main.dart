import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habimatch/core/theme/theme.dart';
import 'package:habimatch/features/auth/presentation/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habimatch',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SignupPage(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}
