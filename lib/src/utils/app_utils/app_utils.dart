import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/app_models/user_model/user_model.dart';
import 'package:test_app/src/widgets/app_text_widgets/big_text.dart';
import 'package:test_app/src/widgets/app_text_widgets/small_text.dart';
import '../../../service/routes/routes_name.dart';
import '../../constants/app_const/app_text_const.dart';
import '../../constants/app_const/colors_const.dart';
import '../../constants/app_const/font_and_size_const.dart';
import '../hive_utils/hive_utils.dart';

class AppUtils {
  static Widget buttonLoader = const CupertinoActivityIndicator(
    radius: 20,
    color: ColorConst.whiteColor,
  );
  static Widget buttonLoaderColor = const CupertinoActivityIndicator(
    radius: 30,
    color: ColorConst.appButtonColor,
  );

  static void showSnackBar(BuildContext context, String message) {
    final snackdemo = SnackBar(
      content: Center(
        child: Text(
          message,
          style: GoogleFonts.manrope(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              color: ColorConst.whiteColor,
              fontSize: SizeConst.kMediumFont16),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: ColorConst.appButtonColor,
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(50),
      duration: const Duration(milliseconds: 600),
      shape: const StadiumBorder(),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }

  static errorDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: BigText(
              text: TextConst.unsuccessful,
              fontWidget: WeightsConst.kMediumWeight700,
              color: ColorConst.appButtonColor),
          content: SmallText(text: message),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: SmallText(text: TextConst.ok),
            ),
          ],
        );
      },
    );
  }

  static logOutDialog(BuildContext ctxFromPage) {
    showCupertinoDialog(
      context: ctxFromPage,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: BigText(
            text: "${TextConst.logOut}?",
            fontWidget: WeightsConst.kMediumWeight700,
            color: ColorConst.appButtonColor),
        content: SmallText(text: TextConst.logOutContent),
        actions: [
          CupertinoDialogAction(
            child: SmallText(text: TextConst.cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: SmallText(
                text: TextConst.logOut, color: ColorConst.appRedColor),
            onPressed: () {
              Navigator.pushReplacementNamed(ctxFromPage, MainRoutes.AuthPage);
              Navigator.pop(context);
              HiveUtils.box.delete(HiveUtils.isRegisterdKey);
              HiveUtils.box.delete(HiveUtils.userModelKey);
            },
          ),
        ],
      ),
    );
  }

  static UserModel userModel = UserModel();
}
