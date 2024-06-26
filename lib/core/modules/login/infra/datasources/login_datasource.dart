
import 'package:clean_test/core/modules/login/infra/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> loginPhone({required String phone});
  Future<UserModel> loginEmail(
      {required String email, required String password});
  Future<UserModel> validateCode(
      {required String verificationId, required String code});

  Future<UserModel> currentUser();

  Future<void> logout();
}
