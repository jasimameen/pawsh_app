import 'package:get_it/get_it.dart';

import 'data/datasources/remote_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_all_users.dart';
import 'domain/usecases/search_users.dart';
import 'presentation/contacts/bloc/contact_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> initInjection() async {
  // blocs
  sl.registerFactory(() => ContactBloc(sl(), sl()));

  // usecases
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => SearchUsers(sl()));

  // repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(const UserRemoteDataSourceImpl()));

  // datasources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => const UserRemoteDataSourceImpl());
}
