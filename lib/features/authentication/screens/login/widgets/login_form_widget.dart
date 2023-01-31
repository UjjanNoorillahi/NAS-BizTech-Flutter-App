import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'login_header_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20.0),
        child: LoginHeaderWidget(),
      ),
    );
  }
}
