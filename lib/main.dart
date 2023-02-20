import 'package:flutter/material.dart';
import 'package:nas_biztech/provider/theme_changer_provider.dart';
import 'package:nas_biztech/routes/route_names.dart';
import 'package:nas_biztech/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nas_biztech/features/authentication/screens/login/login_screen.dart';
import 'package:nas_biztech/features/authentication/screens/login/signup/signup_screen.dart';
import 'package:nas_biztech/utils/theme/widget_themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          home: const LoginScreen(),

          initialRoute: RouteName.loginScreen,
          // initialize the routes with onGenerateRoute:
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );

    // return GetMaterialApp(
    //   // title: 'Flutter Demo',
    //   theme: TAppTheme.lightTheme,
    //  darkTheme: TAppTheme.darkTheme,
    //   themeMode: ThemeMode.system,
    //   home: const LoginScreen(),
    // );
  }
}
