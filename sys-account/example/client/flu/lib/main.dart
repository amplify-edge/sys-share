import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/i18n/sys_account_localization.dart';

// import 'package:intl/intl.dart';
import 'package:sys_share_sys_account_service/sys_share_sys_account_service.dart';

void main() => runApp(ModularApp(module: AppModule()));

class AppModule extends MainModule {
  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  // here will be the routes of your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter("/",
            module: AccountModule("/",
                body: Container(width: 10, height: 10),
                navigatorKey: Modular.navigatorKey,
                tabs: [])),
      ];

// add your main widget here
  @override
  Widget get bootstrap => App();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
      localizationsDelegates: [
        SysAccountLocalizationsDelegate(Locale('en')),
      ],
    );
  }
}
