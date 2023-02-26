import '../entities/user.dart';
import 'package:pawsh_app/core/type_defs.dart';

abstract class UserRepository {
  FutureEither<List<User>> getAllUsers();

  FutureEither<List<User>> searchUsers(String searchQuery);
}