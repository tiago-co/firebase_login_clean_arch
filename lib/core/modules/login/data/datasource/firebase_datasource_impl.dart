import 'dart:developer';

import 'package:clean_test/core/modules/login/infra/datasources/login_datasource.dart';
import 'package:clean_test/core/modules/login/infra/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatasourceImpl implements LoginDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseDatasourceImpl();
  @override
  Future<UserModel> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginEmail({
    required String email,
    required String password,
  }) async {
    var result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    var user = result.user;
    var userModel = UserModel(
      name: user!.displayName ?? '',
      phoneNumber: '+55 (64) 98461-4339',
      email: user.email!,
    );
    log(userModel.toLoggedUser().toString());
    return userModel;
  }

  @override
  Future<UserModel> loginPhone({required String phone}) {
    // TODO: implement loginPhone
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserModel> validateCode(
      {required String verificationId, required String code}) {
    // TODO: implement validateCode
    throw UnimplementedError();
  }
}
