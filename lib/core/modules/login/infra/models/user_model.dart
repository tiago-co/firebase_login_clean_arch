import 'package:clean_test/core/modules/login/domain/entities/logged_user.dart';
import 'package:clean_test/core/modules/login/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  const UserModel({
    required String name,
    required String email,
    required String phoneNumber,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
        );

  LoggedUser toLoggedUser() => this;
}
