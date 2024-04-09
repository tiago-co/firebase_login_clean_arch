import 'package:clean_test/core/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  // TODO: implement imports
  List<Module> get imports => [
        LoginModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.add(
      ModuleRoute(
        Modular.initialRoute,
        module: LoginModule(),
      ),
    );
    super.routes(r);
  }
}
