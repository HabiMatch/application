import 'package:fpdart/fpdart.dart';
import 'package:habimatch/core/error/failures.dart';
import 'package:habimatch/core/usecase/usecase.dart';
import 'package:habimatch/features/auth/domain/repository/auth_repository.dart';

class UserLogout implements UseCase<String, UserLogoutParams> {
  final AuthRepository authrepository;
  const UserLogout(this.authrepository);
  @override
  Future<Either<Failure, String>> call(UserLogoutParams params) async {
    return await authrepository.logout();
  }
}

class UserLogoutParams {}
