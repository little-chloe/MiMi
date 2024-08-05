import 'package:flutter/cupertino.dart';
import 'package:mimi/src/presentation/register/pages/register_page.dart';

abstract class AppRoutes {
  static const register = '/register';
  static const login = '/login';

  static Map<String, Widget Function(BuildContext context)> generateRoutes() {
    return {
      register: (context) => const RegisterPage(),
    };
  }
}
