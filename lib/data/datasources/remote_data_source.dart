import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pawsh_app/core/error/exceptions.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  ///
  Future<List<User>> getAllUsers();

  /// Throws a [ServerException] for all error codes.
  ///
  Future<List<User>> searchUsers(String searchQuery);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl();

  @override
  Future<List<User>> getAllUsers() async {
    try {
      log('get all users');
      final fakeUserData =
          await rootBundle.loadString('assets/fake/fake_users.json');
      log(fakeUserData);
      final res = (json.decode(fakeUserData) as List)
          .map((map) => UserModel.fromMap(map).toEntity)
          .toList();

      log(res.toString());

      return res;
    } catch (e) {
      FlutterError.reportError(
          FlutterErrorDetails(exception: e, library: 'Get Contacts'));
      throw ServerException();
    }
  }

  @override
  Future<List<User>> searchUsers(String searchQuery) async {
    try {
      final fakeUserData =
          await rootBundle.loadString('assets/fake/fake_users.json');
      log(fakeUserData);
      final users = await getAllUsers();
      final res = users
          .where((user) => user.toString().toLowerCase().contains(searchQuery))
          .toList();

      log(res.toString());

      return res;
    } catch (e) {
      FlutterError.reportError(
          FlutterErrorDetails(exception: e, library: 'Get Contacts'));
      throw ServerException();
    }
  }
}
