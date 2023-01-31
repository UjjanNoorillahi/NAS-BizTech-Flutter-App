import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/image_strings.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';
import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              /* -- Section-1 -- */
              children: [
                Image(
                  image: const AssetImage(nasLogo), // NAS Logo
                  height: size.height * 0.2,
                ),
                Text(
                  tLoginTitle, // String "Welcome Back"
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: tFormHeight - 20),
                Text(
                  tLoginSubTitle, // String "Please Sign in to continue"

                  style: Theme.of(context).textTheme.bodySmall,
                  selectionColor: const Color(0xFF888383),
                ),

                /* -- /.end -- */

                /* -- Section-2 -- */
                const LoginForm(),
                const LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
