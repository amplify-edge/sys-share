import 'package:flutter/material.dart';
import 'package:sys_share_sys_account_service/view/widgets/view_model/org_sidebar_view_model.dart';
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

    return ViewModelBuilder<OrgProjViewModel>.reactive(
      viewModelBuilder: () => OrgProjViewModel(),
      builder: (context, model, child) => AccountNavRail(
        //rebuild here on every platform change
        //unique keys would lead to rerender on every pixel change when resizing
        // the window
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
          TabItem(
            title: Text('Sign In'),
            icon: Icon(Icons.chat),
            onTap: () => showDialog(
                context: context, builder: (context) => AuthDialog()),
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
