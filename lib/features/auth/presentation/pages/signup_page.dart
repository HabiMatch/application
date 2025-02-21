import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:habimatch/core/theme/app_pallete.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:habimatch/core/widget/custom_snackbar.dart';
import 'package:habimatch/features/auth/data/datasources/auth_firebase_data.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  AuthFirebaseDataSourceImpl auth = AuthFirebaseDataSourceImpl();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/images/logoup3x.png'),
                ),
                SizedBox(height: 15),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.textColor,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    try {
                      String cred = await auth.googleSignIn();
                      print('User UID: $cred');

                      CustomSnackbar.show(
                        context,
                        title: 'Logged in',
                        message: 'User UID: $cred',
                        color: Colors.green,
                        contentType: ContentType.success,
                      );
                    } catch (e) {
                      print('Error during sign-in: $e');
                      CustomSnackbar.show(
                        context,
                        title: 'Error',
                        message: e.toString(),
                        color: Colors.red,
                        contentType: ContentType.failure,
                      );
                    }
                  },

                  child: Container(
                    width: screenWidth * 0.85,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppPallete.borderColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppPallete.textColor,
                            letterSpacing: 1,
                            wordSpacing: 1,
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Hassle-free roommate matching, just for you!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.textColor,
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
            Container(
              child: Text(
                'Powered by https://habimatch.co.in',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(192, 87, 87, 87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
