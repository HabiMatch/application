import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:habimatch/features/auth/data/datasources/auth_firebase_data.dart';
import 'package:habimatch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:habimatch/features/auth/domain/repository/auth_repository.dart';
import 'package:habimatch/features/auth/domain/repository/user_sign_up.dart';
import 'package:habimatch/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  await Firebase.initializeApp();
}

void _initAuth() {
  serviceLocator.registerFactory<AuthFirebaseDataSource>(
    () => AuthFirebaseDataSourceImpl(),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));

  serviceLocator.registerLazySingleton(
    () => AuthBloc(userSignUp: serviceLocator()),
  );
}
