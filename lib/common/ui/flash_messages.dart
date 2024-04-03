import 'package:flutter/material.dart';
import 'package:mobile/common/ui/constant.dart';

SnackBar flashError(BuildContext context, String message) {
  return SnackBar(
    content: Container(
      height: 30, // Adjust the height as needed
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    ),
    backgroundColor: kButtonColor,
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: 'X',
      textColor: Colors.white,
      backgroundColor: Colors.black,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
}
