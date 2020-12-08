import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'guardian_view_model.dart';

class GuardianWidget extends StatelessWidget {
  final Widget widget;

  const GuardianWidget({@required this.widget});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => GuardianViewModel(),
      onModelReady: (GuardianViewModel model) async {
        model.getPermissions(
            context: context, widget: widget, grantAccessFunction: null);
      },
      builder: (BuildContext context, GuardianViewModel model, child) {
        return Container();
      },
    );
  }
}
