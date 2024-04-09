import 'dart:developer';

import 'package:clean_test/core/modules/login/domain/entities/login_credential.dart';
import 'package:clean_test/core/modules/login/presenter/usecases/login_with_email_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LoginWithEmailStore extends Store<LoginCredential> {
  late final LoginWithEmailUsecase usecase;

  LoginWithEmailStore(this.usecase)
      : super(
          LoginCredential.withEmailAndPassword(
            email: '',
            password: '',
          ),
        );

  Future<void> loginWithEmailAndPassword() async {
    setLoading(true);

    final result = await usecase(state);
    result.fold(
      (failure) => throw failure,
      (user) => log(
        user.toString(),
      ),
    );
    setLoading(false);
  }
}
