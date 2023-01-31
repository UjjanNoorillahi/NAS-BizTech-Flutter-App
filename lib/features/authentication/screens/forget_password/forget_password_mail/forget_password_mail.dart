import 'package:flutter/material.dart';
import 'package:nas_biztech/common_widgets/form/form_header_widget.dart';
import 'package:nas_biztech/constants/image_strings.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(children: const [
          FormHeaderWidget(
            image: nasLogo,
            title: tForgetPassword,
            subTitle: tForgetPasswordSubTitle,
          ),
        ]),
      ),
    );
  }
}
