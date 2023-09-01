import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<void> login() async {
    print('start login');
    setLogged(true);
    await Future.delayed(const Duration(seconds: 2));
    print('log in done');
  }

  Future<bool> getLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('userLogged') ?? false;
  }

  void setLogged(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userLogged', state);
  }
}
