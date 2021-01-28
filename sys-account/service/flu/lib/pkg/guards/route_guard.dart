import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/auth_nav_view_model.dart';

class NavRailGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    final navIdx =
        Modular.get<AuthNavViewModel>().getDynamicNavIndex(router.path);
    if (navIdx > 0) {
      Modular.get<AuthNavViewModel>().setCurrentNavIndex(navIdx);
    }
    return true;
  }
}
