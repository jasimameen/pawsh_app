// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/type_defs.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SearchUsers implements UseCase<List<User>, SearchParams> {
  final UserRepository repository;

  SearchUsers(this.repository);

  @override
  FutureEither<List<User>> call(SearchParams params) async {
    return await repository.searchUsers(params.query);
  }
}

class SearchParams {
  final String query;

  SearchParams({
    required this.query,
  });

}
