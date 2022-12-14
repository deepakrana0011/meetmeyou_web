import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:meetmeyou_web/constants/color_constants.dart';
import 'package:meetmeyou_web/extensions/all_extensions.dart';

class DialogHelper{
  static final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  );

  static Future showDialogWithTwoButtons(
      BuildContext context,
      String title,
      String content, {
        String positiveButtonLabel = "Yes",
        VoidCallback? positiveButtonPress,
        String negativeButtonLabel = "Cancel",
        VoidCallback? negativeButtonPress,
        barrierDismissible = true,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Text(content, textAlign: TextAlign.center),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(negativeButtonLabel).mediumText(
                  ColorConstants.primaryColor, 18, TextAlign.center),
              onPressed: () {
                if (negativeButtonPress != null) {
                  negativeButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            ),
            TextButton(
              child: Text(positiveButtonLabel).mediumText(
                  ColorConstants.primaryColor, 18, TextAlign.center),
              onPressed: () {
                if (positiveButtonPress != null) {
                  positiveButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            )
          ],
        );
      },
    );
  }

  static Future showDialogWithOneButton(
      BuildContext context,
      String title,
      String content, {
        String positiveButtonLabel = "Ok",
        VoidCallback? positiveButtonPress,
        barrierDismissible = true,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center)
              .semiBoldText(ColorConstants.colorBlack, 18, TextAlign.center),
          content: Text(content)
              .regularText(ColorConstants.colorBlack, 16, TextAlign.center),
          shape: border,
          actions: <Widget>[
            TextButton(
              child: Text(positiveButtonLabel).mediumText(
                  ColorConstants.primaryColor, 18, TextAlign.center),
              onPressed: () {
                if (positiveButtonPress != null) {
                  positiveButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            )
          ],
        );
      },
    );
  }

  static showMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: ColorConstants.primaryColor,
      duration: Duration(seconds: 2),
    ).show(context);
  }
}