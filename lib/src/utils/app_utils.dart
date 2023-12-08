import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/app_models/user_model.dart';
import '../constants/colors_const.dart';


class AppUtils {
  static  Widget buttonLoader = SizedBox(
    width: 30,
    height: 30,
    child: CircularProgressIndicator(
      strokeWidth: 3,
      color: ColorConst.whiteColor,
    ),
  );
  static  Widget buttonLoaderColor = SizedBox(
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
          fontSize: 16,),
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
          title: const Text('Unsuccessful'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static UserModel userModel = UserModel();
}

