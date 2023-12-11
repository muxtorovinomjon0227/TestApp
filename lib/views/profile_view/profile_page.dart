import 'package:flutter/material.dart';import 'package:test_app/src/constants/app_const/app_text_const.dart';import 'package:test_app/src/constants/app_const/colors_const.dart';import 'package:test_app/src/controllers/stream_controller.dart';import 'package:test_app/src/utils/app_utils/app_utils.dart';import 'package:test_app/src/widgets/app_text_widgets/big_text.dart';import '../../src/constants/app_const/font_and_size_const.dart';import '../../src/widgets/app_text_widgets/small_text.dart';class UserProfile extends StatelessWidget {  final AppStreamController controller;  const UserProfile({super.key, required this.controller});  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: ColorConst.appBackgroundColor,      appBar: AppBar(        centerTitle: true,        title: SmallText(text: TextConst.profileText, color: ColorConst.bleackColor),      ),      body: buildBody(context),    );  }  Widget buildBody(BuildContext context){    return Column(      crossAxisAlignment: CrossAxisAlignment.center,      children: [        const SizedBox(height: 64),       const Icon(Icons.account_circle_outlined,size: 100),        BigText(text: AppUtils.userModel.user?.nickname ?? "",            fontWidget: WeightsConst.kMediumWeight600,            size: 24),        const SizedBox(height: 12),        SmallText(text: AppUtils.userModel.user?.email ?? "",        color: ColorConst.appEmileTextColor,          fontWidget: WeightsConst.kSmallWeight400,          size: SizeConst.kMediumFont16,        ),        const SizedBox(height: 20),        GestureDetector(          onTap: (){            AppUtils.logOutDialog(context);          },          child:  Container(              color: ColorConst.whiteColor,              width: double.infinity,              height: 64,              child:  Padding(                padding: const EdgeInsets.only(left: 45, top: 18),                child: SmallText(text: TextConst.exitText,color: ColorConst.appRedColor,                    fontWidget: WeightsConst.kSmallWeight400,                    size: SizeConst.kMediumFont16),              )          ),        ),      ],    );  }}