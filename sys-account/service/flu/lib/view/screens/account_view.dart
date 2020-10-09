import 'package:flutter/material.dart';
import 'package:sys_share_sys_account_service/view/widgets/auth_dialog.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext bcontext) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: RaisedButton(
          child: Text('Test Auth Dialog'),
          autofocus: false,
          clipBehavior: Clip.none,
          onPressed: () => showDialog(
            context: bcontext,
            builder: (context) => AuthDialog(),
          ),
        ),
      ),
    );
  }
}
