import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomad_codes_project/authentification/login/login_view.dart';
import 'package:nomad_codes_project/home/home_view.dart';

import 'auth_view_model.dart';


class AuthCheckerView extends ConsumerWidget {
  const AuthCheckerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authProvider);

    return isLoggedIn ? const HomeView() : const LoginView();
  }
}
