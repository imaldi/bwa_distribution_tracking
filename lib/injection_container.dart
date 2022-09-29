import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.bv.dart';
import 'package:bwa_distribution_tracking/data/repositories/auth_repository_impl.dart';
import 'package:bwa_distribution_tracking/domain/repositories/auth_repository.dart';
import 'package:bwa_distribution_tracking/domain/usecases/user_login.dart';
import 'package:bwa_distribution_tracking/presentation/blocs/auth/auth_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;

Future<void> init() async {
  /// Features - Number Trivia
  //Bloc
  sl.registerFactory(
    () => AuthBloc(
      userLogin: sl(),
    ),
  );

  /// Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(authBox: sl()),
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

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External
  /// TODO ini bener2 perlu box type adapter kyknya
  final Box<LoginResponse> authBox = await Hive.openBox(authBoxKey);
  sl.registerLazySingleton(() => authBox);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

}
