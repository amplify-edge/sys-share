import 'package:flutter/material.dart';

class SharedDialogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'GCN',
            style: TextStyle(
              color: Theme.of(context).textTheme.headline1.color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ),
        SizedBox(height: 30)
      ],
    );
  }
}
