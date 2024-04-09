
import 'package:clean_test/core/modules/login/domain/entities/logged_user_info.dart';
import 'package:clean_test/core/modules/login/domain/errors/errors.dart';
import 'package:clean_test/core/modules/login/domain/infra/repositories/login_repository.dart';
import 'package:clean_test/core/modules/login/infra/datasources/login_datasource.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() {
    // TODO: implement loggedUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail({
    required String email,
    required String password,
  }) async {
    try {
      var user = await dataSource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(
        ErrorLoginEmail(message: 'Erro ao realizar login com E-mail!'),
      );
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginPhone({required String phone}) {
    // TODO: implement loginPhone
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> verifyPhoneCode(
      {required String verificationId, required String code}) {
    // TODO: implement verifyPhoneCode
    throw UnimplementedError();
  }
}
