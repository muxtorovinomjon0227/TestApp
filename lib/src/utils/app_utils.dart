import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/app_models/user_model/user_model.dart';
import '../constants/app_const/app_text_const.dart';
import '../constants/app_const/colors_const.dart';
import '../constants/app_const/font_and_size_const.dart';


class AppUtils {
  static  Widget buttonLoader = const SizedBox(
    width: 30,
    height: 30,
    child: CircularProgressIndicator(
      strokeWidth: 3,
      color: ColorConst.whiteColor,
    ),
  );
  static  Widget buttonLoaderColor = const SizedBox(
    width: 30,
    height: 30,
    child: CircularProgressIndicator(
      strokeWidth: 3,
      color: ColorConst.appButtonColor,
    ),
  );

  static void showSnackBar(BuildContext context, String message) {
    final snackdemo = SnackBar(
      content:
      Center(child: Text(message,
        style: GoogleFonts.manrope(
          textStyle: Theme.of(context).textTheme.bodyMedium,
          color: ColorConst.whiteColor,
          fontSize: SizeConst.kMediumFont16),
        textAlign: TextAlign.center,
      ),),
      backgroundColor: ColorConst.appButtonColor,
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(50),
      duration: const Duration(milliseconds: 600),
      shape: const StadiumBorder(),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }


  static errorDialog(BuildContext context, String message){
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(TextConst.unsuccessful),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(TextConst.ok),
            ),
          ],
        );
      },
    );
  }

  static UserModel userModel = UserModel();
}

