import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/auth_nav_view_model.dart';
import 'nav_rail.dart';
import 'package:stacked/stacked.dart';
import 'package:sys_core/sys_core.dart';
import 'package:sys_share_sys_account_service/view/widgets/auth_dialog.dart';

class AuthNavLayout extends StatefulWidget {
  final Widget body;

  const AuthNavLayout({Key key, this.body}) : super(key: key);

  @override
  _AuthNavLayoutState createState() => _AuthNavLayoutState();
}

class _AuthNavLayoutState extends State<AuthNavLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String platform = "phone";
    if (isTablet(context)) platform = "tablet";
    if (isDesktop(context)) platform = "desktop";

    return ViewModelBuilder<AuthNavViewModel>.reactive(
      viewModelBuilder: () => AuthNavViewModel(),
      onModelReady: (AuthNavViewModel model) async {
        await model.isUserLoggedIn();
        if (model.isLoggedIn) {
          await model.getSubscribedOrgs();
        }
      },
      builder: (context, model, child) => AccountNavRail(
        //rebuild here on every platform change
        //unique keys would lead to rerender on every pixel change when resizing
        // the window
        isDense: false,
        key: ValueKey(platform),
        currentIndex: _currentIndex,
        drawerHeader: Container(height: 74, child: Text("")),
        body: widget.body,
        bottomNavigationBarSelectedColor:
            (Theme.of(context).brightness == Brightness.dark)
                ? Colors.tealAccent[200]
                : Theme.of(context).primaryColor,
        bottomNavigationBarUnselectedColor: Colors.grey,
        tabs: [
          for (var org in model.subscribedOrgs) ...[
            TabItem(
              icon: ClipOval(
                child: Image.memory(
                  Uint8List.fromList(org.logo),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(org.name, style: TextStyle(fontSize: 12)),
              onTap: () {
                print(org.id);
              },
            )
          ],
          model.isLoggedIn
              ? TabItem(
                  title: Text('Sign Out'),
                  icon: Icon(Icons.logout),
                  onTap: () async => await model.logOut(),
                )
              : TabItem(
                  title: Text('Sign In'),
                  icon: Icon(Icons.login),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AuthDialog(
                      callback: () async {
                        await model.isUserLoggedIn();
                        if (model.isLoggedIn) {
                          await model.getSubscribedOrgs();
                        }
                      },
                    ),
                  ),
                ),
        ],
        onPressed: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
