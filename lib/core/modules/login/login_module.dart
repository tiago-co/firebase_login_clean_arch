import 'package:clean_test/core/modules/login/data/datasource/firebase_datasource_impl.dart';
import 'package:clean_test/core/modules/login/domain/infra/repositories/login_repository.dart';
import 'package:clean_test/core/modules/login/domain/usecases/login_with_email_usecase_impl.dart';
import 'package:clean_test/core/modules/login/infra/datasources/login_datasource.dart';
import 'package:clean_test/core/modules/login/infra/repository/login_repository_impl.dart';
import 'package:clean_test/core/modules/login/presenter/controllers/login_with_email_store.dart';
import 'package:clean_test/core/modules/login/presenter/usecases/login_with_email_usecase.dart';
import 'package:clean_test/core/modules/login/ui/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.add<LoginDataSource>(FirebaseDatasourceImpl.new);
    i.add<LoginRepository>(LoginRepositoryImpl.new);
    i.add<LoginWithEmailUsecase>(LoginWithEmailUsecaseImpl.new);
    i.add(LoginWithEmailStore.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        Modular.initialRoute,
        child: (context) => const LoginPage(),
      ),
    );
    super.routes(r);
  }
}
