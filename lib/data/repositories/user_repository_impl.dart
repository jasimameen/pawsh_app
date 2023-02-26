import 'package:fpdart/fpdart.dart';
import 'package:pawsh_app/core/error/exceptions.dart';
import 'package:pawsh_app/core/error/failures.dart';

import '../../core/type_defs.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSourceImpl _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  FutureEither<List<User>> getAllUsers() async {
    try {
      return right(await _remoteDataSource.getAllUsers());
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  FutureEither<List<User>> searchUsers(String searchQuery) async {
    try {
      return right(await _remoteDataSource.searchUsers(searchQuery));
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
