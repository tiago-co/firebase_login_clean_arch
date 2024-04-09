import 'package:clean_test/core/modules/login/domain/entities/logged_user_info.dart';
import 'package:clean_test/core/modules/login/domain/entities/login_credential.dart';
import 'package:clean_test/core/modules/login/domain/errors/errors.dart';
import 'package:clean_test/core/modules/login/domain/infra/repositories/login_repository.dart';
import 'package:clean_test/core/modules/login/presenter/usecases/login_with_email_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginWithEmailUsecaseImpl implements LoginWithEmailUsecase {
  final LoginRepository repository;

  LoginWithEmailUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
    LoginCredential credential,
  ) async {
    if (!credential.isValidEmail) {
      return Left(
          ErrorLoginEmail(message: 'Desculpe, mas este e-mail é inválido!'));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail(message: 'Senha inválida'));
    }
    return await repository.loginEmail(
      email: credential.email!,
      password: credential.password!,
    );
  }
}
