import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kooha_task/src/core/routers/route_generator.dart';
import 'package:kooha_task/src/feature/auth/presenation/pages/login_screen.dart';
import 'package:kooha_task/src/theme/theme_helper.dart';

import 'src/core/services/local_database/hive_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox(HiveKeys.appBox);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kooha',
      theme: theme,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      darkTheme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
