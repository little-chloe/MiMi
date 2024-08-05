import 'package:flutter/material.dart';
import 'package:mimi/src/core/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
}

class MiMiApp extends StatelessWidget {
  const MiMiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiMi',
      routes: AppRoutes.generateRoutes(),
    );
  }
}
