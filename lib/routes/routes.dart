import 'package:flutter/material.dart';
import 'package:nas_biztech/features/authentication/screens/login/login_screen.dart';
import 'package:nas_biztech/features/authentication/screens/login/signup/signup_screen.dart';
import 'package:nas_biztech/features/dashboard/dashboard.dart';
import 'package:nas_biztech/routes/route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (context) => const Dashboard());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
