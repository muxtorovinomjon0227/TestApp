import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/service/routes/routes_name.dart';
import 'package:test_app/src/constants/colors_const.dart';
import 'package:test_app/src/extension/context_extensions.dart';
import 'package:test_app/src/utils/app_utils.dart';
import 'package:test_app/src/widgets/app_text_widgets/small_text.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../src/constants/font_and_size_const.dart';
import '../../src/controllers/enter_number_cont.dart';
import '../../src/widgets/app_text_widgets/big_text.dart';
import '../../src/widgets/text_filed_w/text_filed.dart';

class AuthPage extends StatefulWidget {
 final AppStreamController controller;
  const AuthPage({super.key, required this.controller});

  @override
  State<AuthPage> createState() => _AuthpageState();
}

class _AuthpageState extends State<AuthPage> {
  // final _emileTextCont = TextEditingController(text: "muxtorovinomjon0227@gmail.com");
  // final _passwordTextCont = TextEditingController(text: "Inomjon");
  final _emileTextCont = TextEditingController(text: "maripbekoff@gmail.com");
  final _passwordTextCont = TextEditingController(text: "adminadmin");

  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(AuthFetchEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConst.appBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(text: "Авторизация",color: ColorConst.bleackColor),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthSuccsessState){
            Navigator.pushReplacementNamed(context, MainRoutes.MainPage);
          } else if(state is AuthDioErrorState){
            AppUtils.errorDialog(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthInitialState) {
            return Center(child: AppUtils.buttonLoaderColor);
          }
          if (state is AuthLoadedState) {
            return buildUi();
          }
          if (state is AuthExceptionState) {
            return const Center(child: SmallText(text: 'Something wrong'));
          }
          return const Center(child: Text("AloVoice"));
        },
      ),
    );
  }
  Widget buildUi(){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.h*0.2),
          TextFiledWidget(lableName: 'Логин или почта', textEditingController: _emileTextCont),
          Container(
            color: ColorConst.whiteColor,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: ColorConst.appDividerColor,
            ),
          ),
          TextFiledWidget(lableName: 'Пароль', textEditingController: _passwordTextCont),
          SizedBox(height: context.h*0.1),
          buildButtonLogin(),
          SizedBox(height: context.h*0.02),
          buildButtonAuth(),
        ],
      ),
    );
  }
  Widget buildButtonLogin() {
    return StreamBuilder(
        stream: widget.controller.outputLoadingBool,
        initialData: false,
        builder: (BuildContext context, snapshot){
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorConst.appButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () async {
          if(_emileTextCont.text.isNotEmpty && _passwordTextCont.text.isNotEmpty){
            widget.controller.controllerLogin.add(true);
            authBloc.add(AuthLoginEvent(
              controller: widget.controller,
                emile: _emileTextCont.text,
                password: _passwordTextCont.text
            ));
          }else{
            AppUtils.showSnackBar(context, "Fill in all the lines");
          }

        },
        child: SizedBox(
          width: 343,
          height: 64,
          child: Center(
            child: snapshot.data == false
                ? BigText(
                text: "Войти",
                fontWidget: WeightsConst.kMediumWeight700,
                color: ColorConst.whiteColor,
                size: SizeConst.kMediumFont16
            )
                : AppUtils.buttonLoader,
          ),
        ),
      );
    });
  }

  Widget buildButtonAuth() {
    return StreamBuilder(
        stream: widget.controller.outputLoadingBoolAuth,
        initialData: false,
        builder: (BuildContext context, snapshot){
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorConst.appButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () async {
          if(_emileTextCont.text.isNotEmpty && _passwordTextCont.text.isNotEmpty){
            widget.controller.controllerAuth.add(true);
            authBloc.add(AuthLoginEvent(
                controller: widget.controller,
                emile: _emileTextCont.text,
                password: _passwordTextCont.text
            ));
          }else{
          AppUtils.showSnackBar(context, "Fill in all the lines");
          }
        },
        child: SizedBox(
          width: 343,
          height: 64,
          child: Center(
            child: snapshot.data == false
                ? BigText(
                text: "Зарегистрироваться",
                fontWidget: WeightsConst.kMediumWeight700,
                color: ColorConst.whiteColor,
                size: SizeConst.kMediumFont16
            )
                : AppUtils.buttonLoader,
          ),
        ),
      );
    });
  }
}
