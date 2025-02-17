import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habimatch/core/error/exceptions.dart';

abstract interface class AuthFirebaseDataSource {
  Future<String> googleSignIn();
  Future<String> logout();
}

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();

  @override
  Future<String> googleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
          storeTokenAndData(userCredential);
          if (userCredential.user == null) {
            throw const ServerException("User is null");
          }
          return userCredential.user!.uid;
        } catch (e) {
          throw ServerException(e.toString());
        }
      } else {
        throw const ServerException("Not able to signin");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> logout() async {
    try {
      await _googleSignIn.signOut();
      await auth.signOut();
      storage.delete(key: "token");
      return "success";
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storage.write(
        key: "token", value: userCredential.credential?.token.toString());
    await storage.write(
        key: "userCredential", value: userCredential.credential.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  Future<String?> getCred() async {
    return await storage.read(
      key: "userCredential",
    );
  }

  Future<String?> getcreddata() {
    return storage.read(
      key: "userCredential",
    );
  }
}
