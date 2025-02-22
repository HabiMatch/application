import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habimatch/core/theme/theme.dart';
import 'package:habimatch/features/auth/data/datasources/auth_firebase_data.dart';
import 'package:habimatch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:habimatch/features/auth/domain/repository/user_sign_up.dart';
import 'package:habimatch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habimatch/features/auth/presentation/pages/signup_page.dart';
import 'package:habimatch/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocator<AuthBloc>())],
      child: const MyApp(),
    ),
  );
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
