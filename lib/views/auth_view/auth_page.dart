import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/service/routes/routes_name.dart';
import 'package:test_app/src/constants/app_const/colors_const.dart';
import 'package:test_app/src/extension/context_extensions.dart';
import 'package:test_app/src/utils/app_utils.dart';
import 'package:test_app/src/widgets/app_text_widgets/small_text.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../src/constants/app_const/app_text_const.dart';
import '../../src/controllers/stream_controller.dart';
import '../../src/widgets/elevaton_button_widget/elevaton_button_widget.dart';
import '../../src/widgets/exception_view/exception_view.dart';
import '../../src/widgets/text_filed_w/text_filed.dart';

class AuthPage extends StatefulWidget {
 final AppStreamController controller;
  const AuthPage({super.key, required this.controller});

  @override
  State<AuthPage> createState() => _AuthpageState();
}

class _AuthpageState extends State<AuthPage> {
  final _emileTextCont = TextEditingController(text: "maripbekoff@gmail.com");
  final _passwordTextCont = TextEditingController(text: "adminadmi");
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
        title: SmallText(text: TextConst.authorization,color: ColorConst.bleackColor),
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
            return buildBody(state.emileIsEmpty ?? false, state.passwordIsEmpty ?? false);
          }
          if (state is AuthExceptionState) {
            return  AppExceptionView(
              message: TextConst.appExceptionMes,
              onPressed: (){
                statseChenge(emile:false, password: false);
              },
              authName: MainRoutes.AuthPage,);
          }
          return const Center(child: Text("TestApp"));
        },
      ),
    );
  }
  Widget buildBody(bool emileIsEmpty, bool passwordIsEmpty){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.h*0.2),
         Container(
           color: ColorConst.whiteColor,
           child:  TextFiledWidget(lableName: TextConst.emileLableText,
               errorMessage: emileIsEmpty ?  TextConst.enterEmileMes : null,
               callback: (value){
             if(value!.isNotEmpty){
               statseChenge(emile: false,password: passwordIsEmpty);
             }
               },
               textEditingController: _emileTextCont),
         ),
          Container(
            color: ColorConst.whiteColor,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Divider(
              color: ColorConst.appDividerColor,
            ),
          ),
          TextFiledWidget(lableName: TextConst.passwordLableText,
              errorMessage: passwordIsEmpty ?  TextConst.enterPasswordMes : null,
              callback: (value){
                if(value!.isNotEmpty){
                  statseChenge(password: false,emile: emileIsEmpty);
                }
              },
              textEditingController: _passwordTextCont),
          SizedBox(height: context.h*0.1),
          buildButtonLogin(password: passwordIsEmpty,emile: emileIsEmpty),
          SizedBox(height: context.h*0.02),
          buildButtonAuth(password: passwordIsEmpty,emile: emileIsEmpty),
        ],
      ),
    );
  }

  void func(String funcName,bool emile,bool password){
    if(_emileTextCont.text.isNotEmpty && _passwordTextCont.text.isNotEmpty){
      funcName == "SIGNIN"
          ? widget.controller.inputLoadingBool.add(true)
          : widget.controller.inputLoadingBoolAuth.add(true);
      authBloc.add(AuthLoginEvent(
          controller: widget.controller,
          emile: _emileTextCont.text,
          password: _passwordTextCont.text
      ));
    }else{
       AppUtils.showSnackBar(context, TextConst.enterAppLine);
      if(_emileTextCont.text.isEmpty && _passwordTextCont.text.isEmpty ){
        statseChenge(emile:true, password: true);
      }else if(_passwordTextCont.text.isEmpty){
        statseChenge(emile: emile, password: true);
      } else{
        statseChenge(emile: true, password: password);
      }
    }
  }

  void statseChenge({bool? emile, bool? password}){
    authBloc.add(AuthPageStateChangeEvent(passwordIsEmpty: password,emileIsEmpty: emile));
  }

  Widget buildButtonLogin({bool? emile, bool? password}) {
    return StreamBuilder(
        stream: widget.controller.outputLoadingBool,
        initialData: false,
        builder: (BuildContext context, snapshot){
      return CustomButton(
        isLoading: snapshot.data ?? false,
        width: 343,
        height: 64,
        onPressed: () {
          func("SIGNIN",emile!,password!);
        },
        title: TextConst.comeApp,);
    });
  }

  Widget buildButtonAuth({bool? emile, bool? password}) {
    return StreamBuilder(
        stream: widget.controller.outputLoadingBoolAuth,
        initialData: false,
        builder: (BuildContext context, snapshot){
      return CustomButton(
        isLoading: snapshot.data ?? false,
        width: 343,
        height: 64,
        onPressed: () {
          func("SIGNUP",emile!,password!);
        },
        title: TextConst.register,);
    });
  }
}
