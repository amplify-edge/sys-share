import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:sys_share_sys_account_service/pkg/i18n/sys_account_localization.dart';

import 'package:sys_share_sys_account_service/view/widgets/auth_nav_layout.dart';
import 'package:sys_share_sys_account_service/view/widgets/nav_rail.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/auth_nav_view_model.dart';

void main() => runApp(ModularApp(module: AppModule()));

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind.singleton((i) => AuthNavViewModel())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, args) => AuthNavLayout(
                body: Container(width: 10, height: 10),
                tabs: LinkedHashMap.from(<String, Widget>{
                  "/settings": TabItem(
                    title: Text(
                      "bleh",
                      style: TextStyle(fontSize: 12),
                    ),
                    icon: Icon(Icons.settings, size: 30),
                    onTap: () {
                      print("IT TAPPED");
                    },
                  )
                }))),
      ];

  @override
  Widget get bootstrap => App();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => asuka.builder(context, child),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      localizationsDelegates: [
        SysAccountLocalizationsDelegate(),
      ],
    ).modular();
  }
}
