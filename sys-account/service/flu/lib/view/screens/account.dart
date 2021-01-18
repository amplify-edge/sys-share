import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/view/screens/account_view.dart';
import 'package:sys_share_sys_account_service/view/widgets/nav_rail.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/auth_nav_view_model.dart';

import '../../pkg/pkg.dart';

class AccountModule extends ChildModule {
  static String baseRoute;
  final LinkedHashMap<String, TabItem> tabs;
  final Widget body;

  AccountModule(String baseRoute, {@required this.tabs, @required this.body}) {
    if (baseRoute == '/') {
      baseRoute = '';
    }
    assert(baseRoute != null);
    AccountModule.baseRoute = baseRoute;
  }

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Paths(baseRoute)),
        Bind.lazySingleton((i) => AuthRepo()),
        Bind.singleton((i) => AuthNavViewModel())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/accounts/login',
          child: (_, args) => AccountView(
            tabs: tabs ?? LinkedHashMap<String, Widget>(),
            body: body ?? Container(height: 10, width: 10),
          ),
        ),
      ];

  static Inject get to => Inject<AccountModule>();
}
