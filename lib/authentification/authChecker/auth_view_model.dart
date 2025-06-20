import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<bool> {
  AuthViewModel() : super(false);

  void login() => state = true;
  void logout() => state = false;
}

final authProvider = StateNotifierProvider<AuthViewModel, bool>(
      (ref) => AuthViewModel(),
);
