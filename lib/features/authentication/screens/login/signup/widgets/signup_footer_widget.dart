import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/image_strings.dart';
import 'package:nas_biztech/constants/text_string.dart';

import '../../../../../../constants/sizes.dart';
import '../../../../../../routes/route_names.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight - 15),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(nasGoogleLogoImage),
              width: 20.0,
            ),
            label: Text(tSignInWithGoogle.toUpperCase()),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(nasFacebookLogoImage),
                width: 20.0,
              ),
              onPressed: () {},
              label: Text(tSignInWithFacebook.toUpperCase())),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.loginScreen);
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: tLogin.toUpperCase())
          ])),
        )
      ],
    );
  }
}
