import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomad_codes_project/authentificationView/View/login_view.dart';
import 'package:nomad_codes_project/homeView/View/home_view.dart';

import '../ViewModel/auth_view_model.dart';


class AuthCheckerView extends ConsumerWidget {
  const AuthCheckerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authProvider);

    return isLoggedIn ? const HomeView() : const LoginView();
  }
}
