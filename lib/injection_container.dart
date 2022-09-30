import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:bwa_distribution_tracking/data/models/user_model.bv.dart';
import 'package:bwa_distribution_tracking/data/repositories/auth_repository_impl.dart';
import 'package:bwa_distribution_tracking/domain/repositories/auth_repository.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/check_user_login_status.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/user_login.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/user_logout.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Features - Number Trivia
  //Bloc
  /// only Auth login will be initialized as singleton
  sl.registerLazySingleton(
      () => AuthBloc(
      userLogin: sl(),
      checkUserLoginStatusUseCase: sl(),
      userLogout: sl(),
    ),
  );
  // sl.registerFactory(
  //       () => AuthBloc(
  //     userLogin: sl(),
  //   ),
  // );

  /// Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(authBox: sl<Box<LoginResponse>>()),
  );

  /// Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemoteDataSource: sl(),
      authLocalDataSource: sl(),
    ),
  );

  /// Usecase
  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  sl.registerLazySingleton(() => CheckUserLoginStatusUseCase(sl()));
  sl.registerLazySingleton(() => UserLogoutUseCase(sl()));

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(LoginResponseAdapter());
  Hive.registerAdapter(TokenAdapter());
  final authBox = await Hive.openBox<LoginResponse>(authBoxKey);
  sl.registerLazySingleton(() => authBox);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

  /// Permission
  var statusCamera = await Permission.camera.status;
  var statusStorage = await Permission.storage.status;
  if (statusCamera.isDenied) {
    await Permission.camera.request();
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
  }
  if (await Permission.camera.isPermanentlyDenied) {
    openAppSettings();
  }
  if (statusStorage.isDenied) {
    await Permission.storage.request();
  }

  if (await Permission.manageExternalStorage.status.isDenied ||
      await Permission.manageExternalStorage.isPermanentlyDenied) {
    await Permission.manageExternalStorage.request();
  }
}
