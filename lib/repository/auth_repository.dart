class AuthRepository {
  Future<void> login() async {
    print('start login');
    await Future.delayed(const Duration(seconds: 2));
    print('log in done');
  }
}
