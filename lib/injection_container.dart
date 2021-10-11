import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_full_project/features/random_number/presentation/bloc/bloc.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/random_number/data/datasource/random_number_local_data_source.dart';
import 'features/random_number/data/datasource/random_number_remote_data_source.dart';
import 'features/random_number/data/repository/random_number_repository_implementation.dart';
import 'features/random_number/domain/repository/random_number_repository.dart';
import 'features/random_number/domain/usecase/get_concrete_random_number.dart';
import 'features/random_number/domain/usecase/get_random_number.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RandomNumberBloc(
      getConcreteRandomNumber: sl(),
      getRandomNumber: sl(),
      inputConverter: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetConcreteRandomNumber(sl()));
  sl.registerLazySingleton(() => GetRandomNumber(sl()));

  // Repository
  sl.registerLazySingleton<RandomNumberRepository>(
        () => RandomNumberRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RandomNumberRemoteDataSource>(
        () => RandomNumberRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<RandomNumberLocalDataSource>(
        () => RandomNumberLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
