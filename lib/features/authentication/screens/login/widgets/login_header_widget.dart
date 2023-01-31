import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';

import '../../forget_password/forget_password_options/forget_password_button_widget.dart';

class LoginHeaderWidget extends StatelessWidget {
  LoginHeaderWidget({
    Key? key,
  }) : super(key: key);

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // E-mail TextField
      TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person_outline_outlined),
          labelText: tEmail,
          hintText: tEmail,
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: tFormHeight - 20),

      // Password TextField
      ValueListenableBuilder(
          valueListenable: toggle,
          builder: ((context, value, child) {
            return TextFormField(
              obscureText: toggle.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (() {
                    toggle.value = !toggle.value;
                  }),
                  icon: Icon(
                      toggle.value ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            );
          })),
      // const SizedBox(height: tFormHeight - 30),

      // TextButton "Forget Password"
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              builder: (context) => Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tForgetPasswordTitle,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      tForgetPasswordSubTitle,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ForgetPasswordwithBtnWidget(
                      onTap: () {},
                      title: tEmail,
                      subTitle: tResetViaEMail,
                      btnIcon: Icons.mail_outline_rounded,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ForgetPasswordwithBtnWidget(
                      onTap: () {},
                      title: tPhoneNo,
                      subTitle: tResetViaPhone,
                      btnIcon: Icons.mobile_friendly_outlined,
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Text(tForgetPassword),
        ),
      ),

      // Login Button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            tLogin.toUpperCase(),
          ),
        ),
      )
    ]);
  }
}
