import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/view/screens/account_view.dart';
import 'package:sys_share_sys_account_service/view/widgets/nav_rail.dart';

import '../../pkg/pkg.dart';

class AccountModule extends ChildModule {
  static String baseRoute;
  final LinkedHashMap<String, TabItem> tabs;
  final Widget body;
  final GlobalKey<NavigatorState> navigatorKey;

  AccountModule(String baseRoute,
      {@required this.tabs, @required this.body, @required this.navigatorKey}) {
    if (baseRoute == '/') {
      baseRoute = '';
    }
    assert(baseRoute != null);
    AccountModule.baseRoute = baseRoute;
  }

  @override
  List<Bind> get binds => [
    Bind((i) => Paths(baseRoute)),
    Bind((i) => AuthRepo())
  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/accounts/login',
          child: (_, args) => AccountView(
            tabs: tabs ?? LinkedHashMap<String, Widget>(),
            body: body ?? Container(height: 10, width: 10),
            navigatorKey: navigatorKey,
          ),
        ),
      ];

  static Inject get to => Inject<AccountModule>.of();
}
