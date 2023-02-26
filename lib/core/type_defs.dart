import 'package:fpdart/fpdart.dart';

import 'error/failures.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;