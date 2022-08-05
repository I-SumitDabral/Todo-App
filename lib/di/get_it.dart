import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elred/data/core/clients/firebase_auth_client.dart';
import 'package:elred/data/core/clients/firebase_client.dart';
import 'package:elred/data/core/clients/social_auth_client.dart';
import 'package:elred/data/dataSource/remote_data_source.dart';
import 'package:elred/data/repositories/auth_repository_impl.dart';
import 'package:elred/data/repositories/todo_data_repository_impl.dart';
import 'package:elred/di/modules/injectable_modules.dart';
import 'package:elred/domain/entities/usecases/addTodo_usecase.dart';
import 'package:elred/domain/entities/usecases/current_user_usecase.dart';
import 'package:elred/domain/entities/usecases/deletetodo_usecase.dart';
import 'package:elred/domain/entities/usecases/fetch_todos_usecase.dart';
import 'package:elred/domain/entities/usecases/login_usescase.dart';
import 'package:elred/domain/entities/usecases/logout_usecase.dart';
import 'package:elred/domain/entities/usecases/updatetodo_usecase.dart';
import 'package:elred/domain/repositories/auth_repository.dart';
import 'package:elred/domain/repositories/todo_data_repository.dart';
import 'package:elred/presentation/addNewTodo/add_new_todo_viewmodel.dart';
import 'package:elred/presentation/home/home_viewmodel.dart';
import 'package:elred/presentation/loading/loading_viewmodel.dart';
import 'package:elred/presentation/login/login_viewmodel.dart';
import 'package:elred/presentation/splash/splash_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GetIt getItInstance = GetIt.I;

Future init() async {
  if (kDebugMode) {
    print('integration worked');
  }
  final injecableModules = InjectableModulesImpl();

  getItInstance
      .registerLazySingleton<GoogleSignIn>(() => injecableModules.googleSignIn);
  getItInstance
      .registerLazySingleton<FirebaseAuth>(() => injecableModules.firebaseAuth);
  getItInstance.registerLazySingleton<FirebaseFirestore>(
      () => injecableModules.firebaseFireStore);
  getItInstance
      .registerLazySingleton<LoadingViewModel>(() => LoadingViewModel());
  getItInstance.registerLazySingleton<LoginViewModel>(
      () => LoginViewModel(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<SplashViewModel>(
      () => SplashViewModel(getItInstance()));
  getItInstance.registerFactory<HomeViewModel>(
      () => HomeViewModel(getItInstance(), getItInstance(), ));
  getItInstance.registerLazySingleton<AddNewTodoViewModel>(() =>
      AddNewTodoViewModel(
          getItInstance(), getItInstance(), getItInstance(), getItInstance()));
  getItInstance
      .registerLazySingleton<LoginUseCase>(() => LoginUseCase(getItInstance()));
  getItInstance.registerLazySingleton<UpdateTodoUseCase>(
      () => UpdateTodoUseCase(getItInstance()));
  getItInstance.registerLazySingleton<AddTodoUseCase>(
      () => AddTodoUseCase(getItInstance()));
  getItInstance.registerLazySingleton<DeleteTodoUseCase>(
      () => DeleteTodoUseCase(getItInstance()));
  getItInstance.registerLazySingleton<FetchTodosUseCase>(
      () => FetchTodosUseCase(getItInstance()));
  getItInstance.registerLazySingleton<CurrentUserUseCase>(
      () => CurrentUserUseCase(getItInstance()));
  getItInstance.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<TodoDataRepository>(
      () => TodoDataRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<FirebaseRemoteDataSouce>(() =>
      FirebaseRemoteDataSouceImpl(
          getItInstance(), getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<SocialAuthClient>(
      () => SocialAuthClient(googleSignIn: getItInstance()));
  getItInstance.registerLazySingleton<FirebaseClient>(
      () => FirebaseClient(firebaseFirestore: getItInstance()));
  getItInstance.registerLazySingleton<FirebaseAuthClient>(
      () => FirebaseAuthClient(getItInstance()));
}
