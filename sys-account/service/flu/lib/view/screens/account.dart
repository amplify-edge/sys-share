import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/view/screens/account_view.dart';

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
