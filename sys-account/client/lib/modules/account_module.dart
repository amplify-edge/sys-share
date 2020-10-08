import 'package:flutter_modular/flutter_modular.dart';
import 'package:auth_dialog/core/core.dart';
import 'package:auth_dialog/modules/account/view/account_view.dart';
// import 'package:auth_dialog/modules/signup/views/signup_view.dart';

class AccountModule extends ChildModule {
  static String baseRoute;

  AccountModule(String baseRoute) {
    if (baseRoute == '/') {
      baseRoute = '';
    }
    assert(baseRoute != null);
    AccountModule.baseRoute = baseRoute;
  }
  @override
  List<Bind> get binds => [Bind((i) => Paths(baseRoute))];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (_, args) => AccountView())];

  static Inject get to => Inject<AccountModule>.of();
}
