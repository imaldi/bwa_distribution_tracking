import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:bwa_distribution_tracking/core/resources/consts/strings.dart';
import 'package:bwa_distribution_tracking/data/datasources/local/auth_local_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/auth_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/current_location_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/datasources/remote/qr_scan_remote_data_source.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/auth/token.dart';
import 'package:bwa_distribution_tracking/data/models/auth/user_model.dart';
import 'package:bwa_distribution_tracking/data/models/surat_jalan/surat_jalan_response.dart';
import 'package:bwa_distribution_tracking/data/repositories/api_wilayah_indonesia_repository.dart';
import 'package:bwa_distribution_tracking/data/repositories/auth_repository_impl.dart';
import 'package:bwa_distribution_tracking/data/repositories/geolocator_repository_impl.dart';
import 'package:bwa_distribution_tracking/data/repositories/scan_repository_impl.dart';
import 'package:bwa_distribution_tracking/domain/repositories/api_wilayah_indonesia.dart';
import 'package:bwa_distribution_tracking/domain/repositories/auth_repository.dart';
import 'package:bwa_distribution_tracking/domain/repositories/geolocator_repository.dart';
import 'package:bwa_distribution_tracking/domain/repositories/scan_repository.dart';
import 'package:bwa_distribution_tracking/domain/repositories/single_scan_repository.dart';
import 'package:bwa_distribution_tracking/domain/repositories/surat_jalan_repository.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/check_user_login_status.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/user_login.dart';
import 'package:bwa_distribution_tracking/domain/usecases/auth/user_logout.dart';
import 'package:bwa_distribution_tracking/domain/usecases/geolocator/get_current_position.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/bulk_qr_scan.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/get_all_scan_history.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/get_user_scan_history.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/scan_dus/send_reques_store_selesai_use_case.dart';
import 'package:bwa_distribution_tracking/domain/usecases/scan_qr/send_qr_scan.dart';
import 'package:bwa_distribution_tracking/domain/usecases/surat_jalan/get_surat_jalan_per_page.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/auth/auth_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/history_scan/history_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/internet_connection/internet_connection_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/bulk_scan/bulk_scan_screen_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/scan/qr_scan_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/blocs/single_scan_screen_bloc/single_scan_screen_bloc.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/single_scan_screen/single_scan_screen_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/surat_jalan/surat_jalan_cubit.dart';
import 'package:bwa_distribution_tracking/presentation/state_management/cubits/wilayah_indonesia/wilayah_indonesia_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;

import 'data/datasources/remote/single_scan_remote_data_source.dart';
import 'data/datasources/remote/surat_jalan_remote_data_source.dart';
import 'data/repositories/single_scan_repository_impl.dart';
import 'data/repositories/surat_jalan_repository_impl.dart';


final sl = GetIt.instance;

// TODO use encrypted box
// TODO use injectable
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Features - Number Trivia
  //Bloc
  /// only Auth login will be initialized as singleton
  sl.registerLazySingleton(
    () => AuthBloc(
      userLogin: sl(),
      checkUserLoginStatusUseCase: sl<CheckUserLoginStatusUseCase>(),
      userLogout: sl(),
    ),
  );
  sl.registerFactory(
    () => QRScanBloc(sl<BulkQRScanUseCase>(), sl<SendScanUseCase>()),
  );

  sl.registerFactory(
        () => HistoryScanBloc(sl<GetUserScanHistoryUseCase>(),sl<GetAllScanHistoryUseCase>()),
  );

  sl.registerFactory(
        () => SingleScanScreenBloc(sl<SendRequesStoreSelesaiUseCase>()),
  );

  sl.registerFactory(
    () => InternetConnectionCubit(
      sl<NetworkInfo>(),
    ),
  );

  sl.registerFactory(
    () => BulkScanScreenCubit(
      sl<GetCurrentPositionUseCase>(),
    ),
  );

  sl.registerFactory(
    () => SingleScanScreenCubit(sl<SingleScanRepository>()
    ),
  );

  sl.registerFactory(
    () => WilayahIndonesiaCubit(sl()
    ),
  );

  sl.registerFactory(() => SuratJalanCubit(sl<GetSuratJalanPerPageUseCase>()));

  /// Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(authBox: sl<Box<LoginResponse>>()),
  );

  sl.registerLazySingleton<QRScanRemoteDataSource>(
    () => QRScanRemoteDataSourceImpl(
        client: sl(), authBox: sl<Box<LoginResponse>>()),
  );

  sl.registerLazySingleton<CurrentLocationRemoteDataSource>(
    () => CurrentLocationRemoteDataSourceImpl(),
  );

  sl.registerFactory<SuratJalanRemoteDataSource>(() => SuratJalanRemoteDataSourceImpl(sl(), sl<Box<LoginResponse>>()));
  sl.registerFactory<SingleScanRemoteDataSource>(() => SingleScanRemoteDataSourceImpl(sl<Box<LoginResponse>>()));


  /// Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: sl(),
      authRemoteDataSource: sl(),
      authLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ScanRepository>(
    () => ScanRepositoryImpl(
      networkInfo: sl(),
      qrScanRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<GeolocatorRepository>(
    () => GeolocatorRepositoryImpl(
      networkInfo: sl(),
      currentLocationRemoteDataSource: sl<CurrentLocationRemoteDataSource>(),
    ),
  );
  sl.registerFactory<SuratJalanRepository>(() => SuratJalanRepositoryImpl(sl<SuratJalanRemoteDataSource>(), sl<NetworkInfo>()));
  sl.registerFactory<SingleScanRepository>(() => SingleScanRepositoryImpl(sl<SingleScanRemoteDataSource>(), sl<NetworkInfo>()));
  sl.registerFactory<ApiWilayahIndonesiaRepository>(() => ApiWilayahIndonesiaRepositoryImpl());



  /// Usecase
  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  sl.registerLazySingleton(() => CheckUserLoginStatusUseCase(sl()));
  sl.registerLazySingleton(() => UserLogoutUseCase(sl()));
  sl.registerLazySingleton(() => BulkQRScanUseCase(sl()));
  sl.registerLazySingleton(() => SendScanUseCase(sl()));
  sl.registerLazySingleton(() => GetUserScanHistoryUseCase(sl()));
  sl.registerLazySingleton(() => GetAllScanHistoryUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentPositionUseCase(sl()));
  sl.registerLazySingleton(() => SendRequesStoreSelesaiUseCase(sl()));
  sl.registerFactory<GetSuratJalanPerPageUseCase>(() => GetSuratJalanPerPageUseCase(sl()));

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  /// Kalau ada problem disini habis generate, rollback aja file2 ini:
  /// user_model.g.dart
  /// login_response.g.dart
  /// token.g.dart
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  Hive.registerAdapter<LoginResponse>(LoginResponseAdapter());
  Hive.registerAdapter<Token>(TokenAdapter());
  final authBox = await Hive.openBox<LoginResponse>(authBoxKey);
  final userBox = await Hive.openBox<UserModel>(userBoxKey);
  sl.registerLazySingleton<Box<LoginResponse>>(() => authBox);
  sl.registerLazySingleton<Box<UserModel>>(() => userBox);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  /// Permission
  var statusCamera = await Permission.camera.status;
  var statusStorage = await Permission.storage.status;
  var statusLocation = await Permission.locationWhenInUse.status;

  if (statusLocation.isDenied) await Permission.locationWhenInUse.request();
  if (statusLocation.isPermanentlyDenied) openAppSettings();
  if (statusCamera.isDenied) await Permission.camera.request();
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
