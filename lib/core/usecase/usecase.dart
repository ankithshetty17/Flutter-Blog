import 'package:blog/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserCase<Successtype,Params> {
  Future<Either<Failures,Successtype>> call(Params params);
}