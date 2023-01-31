import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/image_strings.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';
import 'package:nas_biztech/routes/route_names.dart';

import '../signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(nasFacebookLogoImage),
                width: 20.0,
              ),
              onPressed: () {},
              label: const Text(tSignInWithFacebook)),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(nasGoogleLogoImage),
                width: 20.0,
              ),
              onPressed: () {},
              label: const Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: tFormHeight - 20.0,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.signUpScreen);
            },
            child: Text.rich(TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(
                    text: tSignup,
                    style: TextStyle(color: Colors.blue),
                  )
                ])))
      ],
    );
  }
}
