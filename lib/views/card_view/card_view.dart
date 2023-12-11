import 'package:flutter/material.dart';import '../../src/constants/app_const/app_text_const.dart';import '../../src/constants/app_const/colors_const.dart';import '../../src/widgets/app_text_widgets/small_text.dart';class CardPage extends StatelessWidget {  const CardPage({super.key});  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: ColorConst.appBackgroundColor,      appBar: AppBar(        centerTitle: true,        title: SmallText(text: TextConst.cardText, color: ColorConst.bleackColor),      ),      body: buildBody(context),    );  }  Widget buildBody(BuildContext context){    return  Center(        child: SmallText(text: TextConst.cardText)    );  }}