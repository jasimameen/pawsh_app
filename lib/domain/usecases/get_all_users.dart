import '../../../../core/type_defs.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetAllUsers implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetAllUsers(this.repository);

  @override
  FutureEither<List<User>> call(NoParams params) async {
    return await repository.getAllUsers();
  }
}