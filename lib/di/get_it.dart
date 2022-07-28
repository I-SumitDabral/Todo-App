import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elred/data/core/clients/firebase_auth_client.dart';
import 'package:elred/data/core/clients/firebase_client.dart';
import 'package:elred/data/core/clients/social_auth_client.dart';
import 'package:elred/data/dataSource/remote_data_source.dart';
import 'package:elred/data/repositories/auth_repository_impl.dart';
import 'package:elred/di/modules/injectable_modules.dart';
import 'package:elred/domain/entities/usecases/login_usescase.dart';
import 'package:elred/domain/repositories/auth_repository.dart';
import 'package:elred/presentation/loading/loading_viewmodel.dart';
import 'package:elred/presentation/login/login_viewmodel.dart';
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
  getItInstance.registerLazySingleton<FirebaseFirestore>(
      () => injecableModules.firebaseFireStore);
  getItInstance
      .registerLazySingleton<FirebaseAuth>(() => injecableModules.firebaseAuth);
  getItInstance
      .registerLazySingleton<LoadingViewModel>(() => LoadingViewModel());
  getItInstance.registerLazySingleton<LoginViewModel>(
      () => LoginViewModel(getItInstance()));
  getItInstance
      .registerLazySingleton<LoginUseCase>(() => LoginUseCase(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance()));
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
