import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habimatch/core/error/exceptions.dart';
import 'package:habimatch/core/error/failures.dart';
import 'package:habimatch/features/auth/data/datasources/auth_firebase_data.dart';
import 'package:habimatch/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDataSource authFirebaseDataSource;
  const AuthRepositoryImpl(this.authFirebaseDataSource);
  @override
  Future<Either<Failure, String>> googleSignIn() async {
    try {
      final userId = await authFirebaseDataSource.googleSignIn();
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final response = await authFirebaseDataSource.logout();
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
