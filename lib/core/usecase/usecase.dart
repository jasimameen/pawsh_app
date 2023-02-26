import '../type_defs.dart';

abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}

class NoParams {}