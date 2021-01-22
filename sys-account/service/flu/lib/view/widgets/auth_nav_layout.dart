import 'dart:collection';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:sys_share_sys_account_service/pkg/i18n/sys_account_localization.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/auth_nav_view_model.dart';
import 'nav_rail.dart';
import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/view/widgets/auth_dialog.dart';

class AuthNavLayout extends StatefulWidget {
  final Widget body;
  final LinkedHashMap<String, Widget> adminTabs;
  final LinkedHashMap<String, Widget> tabs;

  const AuthNavLayout({
    Key key,
    @required this.body,
    @required this.adminTabs,
    @required this.tabs,
  }) : super(key: key);

  @override
  _AuthNavLayoutState createState() => _AuthNavLayoutState();
}

class _AuthNavLayoutState extends State<AuthNavLayout> {
  @override
  Widget build(BuildContext context) {
    String platform = "phone";
    if (isTablet(context)) platform = "tablet";
    if (isDesktop(context)) platform = "desktop";

    return ViewModelProvider<AuthNavViewModel>.withConsumer(
      viewModelBuilder: () => Modular.get<AuthNavViewModel>(),
      disposeViewModel: true,
      onModelReady: (AuthNavViewModel model) async {
        await model.isUserLoggedIn();
        if (model.isLoggedIn) {
          await model.getSubscribedOrgs();
        }
        model.setupTabItems(widget.tabs, widget.adminTabs, context);
      },
      builder: (ctx, model, child) {
        return AccountNavRail(
          //rebuild here on every platform change
          //unique keys would lead to rerender on every pixel change when resizing
          // the window
          isDense: false,
          key: ValueKey(platform),
          currentIndex: model.currentNavIndex,
          drawerHeader: Container(height: 74, child: Text("")),
          body: widget.body,
          bottomNavigationBarSelectedColor:
              (Theme.of(ctx).brightness == Brightness.dark)
                  ? Colors.tealAccent[200]
                  : Theme.of(ctx).primaryColor,
          bottomNavigationBarUnselectedColor: Colors.grey,
          tabs: [
            model.isLoggedIn
                ? TabItem(
                    title: Text(SysAccountLocalizations.of(context)
                        .translate('signOut')),
                    icon: Icon(Icons.logout),
                    onTap: () async {
                      await model.logOut();
                      // reset navigation stack
                      Modular.to.navigate("/");
                    },
                  )
                : TabItem(
                    title: Text(SysAccountLocalizations.of(context)
                        .translate('signIn')),
                    icon: Icon(Icons.login),
                    onTap: () => asuka.showDialog(
                      builder: (context) => AuthDialog(
                        callback: () async {
                          Navigator.of(context).pop();
                          await model.isUserLoggedIn();
                          if (model.isLoggedIn) {
                            await model.getSubscribedOrgs();
                            model.setCurrentNavIndex(model.previousNavIndex);
                            Modular.to.navigate(
                                model.getTabRoute(model.currentNavIndex));
                          }
                        },
                      ),
                    ),
                  ),
            if (model.isSuperuser)
             ...widget.adminTabs.values,
            ...model.widgetList,
          ],
          onPressed: (index) {
            model.setPreviousNavIndex(model.currentNavIndex);
            model.setCurrentNavIndex(index);
          },
        );
      },
    );
  }
}
