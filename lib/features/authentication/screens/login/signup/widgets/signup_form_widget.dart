import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nas_biztech/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/auth_provider.dart';

class SignUpFormWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
    ValueNotifier<bool> circularIndicator = ValueNotifier<bool>(false);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey, // form key to validate the cradientails
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  border: OutlineInputBorder()),
              validator: (value) {
                // validator to check full name
                if (value!.isEmpty) {
                  return 'Enter full name';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder()),
              validator: (value) {
                // validator to check email
                if (value!.isEmpty) {
                  return 'Enter email';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder()),
              validator: (value) {
                // validator to check phone number
                if (value!.isEmpty) {
                  return 'Enter phone number';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            // password

            ValueListenableBuilder(
                valueListenable: toggle,
                builder: ((context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.fingerprint),
                      labelText: tPassword,
                      // hintText: tPassword,
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
                    validator: (value) {
                      // validator to check password
                      if (value!.isEmpty) {
                        return 'Enter password';
                      } else {
                        return null;
                      }
                    },
                  );
                })),

            const SizedBox(height: tFormHeight - 20),

            // TextFormField(
            //   decoration: const InputDecoration(
            //       label: Text(tConfirmPassword),
            //       prefixIcon: Icon(Icons.lock),
            //       border: OutlineInputBorder()),
            // ),

            ValueListenableBuilder(
                valueListenable: toggle,
                builder: ((context, value, child) {
                  return TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: tConfirmPassword,
                      // hintText: tPassword,
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
                    validator: (value) {
                      // validator to confirm password
                      if (value!.isEmpty) {
                        return 'Enter password';
                      } else {
                        return null;
                      }
                    },
                  );
                })),
            const SizedBox(height: tFormHeight - 20),
            ValueListenableBuilder(
                valueListenable: circularIndicator,
                builder: (context, value, child) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        circularIndicator.value = true;
                        if (_formKey.currentState!.validate()) {
                          //circularIndicator.value = false;
                          _auth
                              .createUserWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString(),
                          )
                              .then((value) {
                            circularIndicator.value = false;
                            debugPrint(value.toString() + 'Debug Value....');
                          }).onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                            circularIndicator.value = false;
                          });
                        }
                      },
                      child: circularIndicator.value == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(tSignup.toUpperCase()),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
