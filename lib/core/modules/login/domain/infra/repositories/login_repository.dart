import 'package:clean_test/core/modules/login/domain/entities/logged_user_info.dart';
import 'package:clean_test/core/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, LoggedUserInfo>> loginPhone({
    required String phone,
  });

  Future<Either<Failure, LoggedUserInfo>> verifyPhoneCode({
    required String verificationId,
    required String code,
  });

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
}
