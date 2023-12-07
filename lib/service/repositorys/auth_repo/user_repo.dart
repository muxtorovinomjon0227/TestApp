import 'package:dio/dio.dart';
import 'package:test_app/src/utils/app_utils.dart';
import '../../../app_models/user_model.dart';
import '../../../src/constants/api_constants/api_const.dart';

class UserRepository {
  static final UserRepository _singleton = UserRepository._internal();
  UserRepository._internal();
  static UserRepository getInstance() {
    return _singleton;
  }
  Dio dio = Dio();

  Future<dynamic> userLogin({String? emile, String? password}) async {
    try {
      Map<String, dynamic> body = {
        "email": emile,
        "password": password
      };
      Response response = await dio.post(BaseApi.SIGN_IN,
        data: body,
      );
      if(response.statusCode == 200){
        AppUtils.userModel = UserModel.fromJson(response.data);
        return response.statusCode;
      } else{
        return response.statusCode;
      }
    } on DioError catch (e) {
      return "DIO_ERROR";
    }
  }


}
