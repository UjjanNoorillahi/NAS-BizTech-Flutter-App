import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';

import '../../../../../routes/route_names.dart';
import '../../../../../utils/utils.dart';
import '../../forget_password/forget_password_options/forget_password_button_widget.dart';

class LoginHeaderWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  LoginHeaderWidget({
    Key? key,
  }) : super(key: key);

  void login() {}

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
    ValueNotifier<bool> circularIndicator = ValueNotifier<bool>(false);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // E-mail TextField

      Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder(),
                ),
                // txt validator for Email
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: tFormHeight - 20),

              // Password TextField
              ValueListenableBuilder(
                  valueListenable: toggle,
                  builder: ((context, value, child) {
                    return TextFormField(
                      controller: passwordController,
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
                          icon: Icon(toggle.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      // txt validator for password
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter password';
                        } else {
                          return null;
                        }
                      },
                    );
                  })),
            ],
          )),

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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // circularIndicator = true as ValueNotifier<bool>;
              _auth
                  .signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text.toString())
                  .then((value) {
                Utils().toastMessage(value.user!.email.toString());
                Navigator.pushNamed(context, RouteName.dashboardScreen);
                // circularIndicator = false as ValueNotifier<bool>;
              }).onError((error, stackTrace) {
                debugPrint(error.toString());
                Utils().toastMessage(error.toString());

                // circularIndicator = false as ValueNotifier<bool>;
              });
            }
          },
          child: Text(
            tLogin.toUpperCase(),
          ),
        ),
      )
    ]);
  }
}
