// ignore_for_file: non_constant_identifier_names, empty_catches, avoid_print



class UserRepository {
  static final UserRepository _singleton = UserRepository._internal();
  UserRepository._internal();
  static UserRepository getInstance() {
    return _singleton;
  }

}
