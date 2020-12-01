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
    builder: (context, controller) {
      return Flash(
        controller: controller,
        style: flashStyle,
        boxShadows: [BoxShadow(blurRadius: 4)],
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
        barrierBlur: 3.0,
        barrierColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        barrierDismissible: true,
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        position: FlashPosition.top,
        child: FlashBar(
          leftBarIndicatorColor: error ? Colors.red[500] : Colors.green[500],
          message: Text(
            message,
            style: TextStyle(
              color: Theme.of(context).textTheme.subtitle2.color,
            ),
          ),
          primaryAction: IconButton(
            icon: Icon(Icons.close_rounded),
            onPressed: () => controller.dismiss(),
          ),
        ),
      );
    },
  );
}
