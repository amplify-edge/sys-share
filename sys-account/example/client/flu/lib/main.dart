import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/i18n/sys_account_localization.dart';

import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart';
import 'package:sys_share_sys_account_service/view/widgets/nav_rail.dart';

void main() => runApp(ModularApp(module: AppModule()));

class AppModule extends MainModule {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/",
            module: AccountModule("/",
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
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      localizationsDelegates: [
        SysAccountLocalizationsDelegate(),
      ],
    ).modular();
  }
}
