import 'package:flutter/material.dart';
import 'package:sys_share_sys_account_service/view/widgets/auth_nav_layout.dart';
import 'package:sys_share_sys_account_service/view/widgets/nav_rail.dart';

class AccountView extends StatelessWidget {
  final List<TabItem> tabs;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget body;

  const AccountView({Key key, @required this.tabs, @required this.body, @required this.navigatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthNavLayout(
      body: body,
      tabs: tabs,
      navigatorKey: navigatorKey,
    );
  }
}
