
import 'package:blog/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
 Future<Either<Failures,String>> signupWithEmailPassword({
   required String email,
   required String name,
   required String password,
});

Future<Either<Failures,String>> loginWithEmailPassword({
   required String email,
   required String password,
});

}