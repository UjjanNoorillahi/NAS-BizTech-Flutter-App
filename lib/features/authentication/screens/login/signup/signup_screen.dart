import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/image_strings.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import 'widgets/signup_footer_widget.dart';
import 'widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FormHeaderWidget(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  image: nasLogo,
                  textAlign: TextAlign.start,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.30,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
