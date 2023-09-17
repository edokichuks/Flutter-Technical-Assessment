import 'package:flutter/cupertino.dart';
import 'package:kooha_task/src/core/routers/routes_exports.dart';



class RouteGenerator {
  const RouteGenerator._();
 static const kLoginScreen = 'login_screen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kLoginScreen:
        return CupertinoPageRoute(
          builder: (context) =>  LoginScreen(),
        );
        default:
        throw UnimplementedError('Route not found');
    }
  }
}
