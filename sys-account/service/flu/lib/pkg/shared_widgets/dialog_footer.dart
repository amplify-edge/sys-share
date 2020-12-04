import 'package:flutter/material.dart';
import 'package:sys_share_sys_account_service/pkg/i18n/sys_account_localization.dart';

class SharedDialogFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            SysAccountLocalizations.of(context).translate('byProceeding'),
            maxLines: 2,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.subtitle2.color.withOpacity(0.85),
              fontSize: 14,
              fontWeight: FontWeight.w300,
              // letterSpacing: 3,
            ),
          ),
        ),
      ],
    );
  }
}
