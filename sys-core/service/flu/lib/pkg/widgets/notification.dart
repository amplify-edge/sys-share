import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void notify({
  BuildContext context,
  String message,
  bool error,
  flashStyle = FlashStyle.floating,
}) {
  showFlash(
    context: context,
    duration: Duration(seconds: 3),
    builder: (context, controller) {
      return Flash(
        controller: controller,
        style: flashStyle,
        boxShadows: kElevationToShadow[4],
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        child: FlashBar(
          leftBarIndicatorColor: error ? Colors.red[500] : Colors.green[500],
          message: Text(message),
        ),
      );
    },
  );
}
