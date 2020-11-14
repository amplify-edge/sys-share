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
        boxShadows: [BoxShadow(blurRadius: 4)],
        barrierBlur: 3.0,
        barrierColor: Colors.black38,
        barrierDismissible: true,
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        position: FlashPosition.top,
        child: FlashBar(
          leftBarIndicatorColor: error ? Colors.red[500] : Colors.green[500],
          message: Text(message),
          primaryAction: IconButton(
            icon: Icon(Icons.close_rounded),
            onPressed: () => controller.dismiss(),
          ),
        ),
      );
    },
  );
}
