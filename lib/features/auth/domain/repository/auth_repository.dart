import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habimatch/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserCredential>> googleSignIn();
  Future<Either<Failure, String>> logout();
}
