
import 'package:clean_test/core/modules/login/domain/entities/logged_user_info.dart';
import 'package:clean_test/core/modules/login/domain/entities/login_credential.dart';
import 'package:clean_test/core/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class LoginWithEmailUsecase {
  Future<Either<Failure, LoggedUserInfo>> call(
    LoginCredential credential,
  );
}
