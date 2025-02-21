import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habimatch/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> googleSignIn();
  Future<Either<Failure, String>> logout();
}
