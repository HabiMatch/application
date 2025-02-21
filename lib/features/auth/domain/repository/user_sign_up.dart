import 'package:fpdart/fpdart.dart';
import 'package:habimatch/core/error/failures.dart';
import 'package:habimatch/core/usecase/usecase.dart';
import 'package:habimatch/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authrepository;
  const UserSignUp(this.authrepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authrepository.googleSignIn();
  }
}

class UserSignUpParams {}
