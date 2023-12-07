import 'package:flutter/material.dart';
import 'package:test_app/src/constants/colors_const.dart';
import 'package:test_app/src/widgets/app_text_widgets/small_text.dart';

import '../../src/controllers/enter_number_cont.dart';

class AuthPage extends StatefulWidget {
 final AppStreamController controller;
  const AuthPage({super.key, required this.controller});

  @override
  State<AuthPage> createState() => _AuthpageState();
}

class _AuthpageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConst.appBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(text: "Авторизация",color: ColorConst.bleackColor),
      ),
      body: buildUi(),
    );
  }
  Widget buildUi(){
    return Container();
  }
}
