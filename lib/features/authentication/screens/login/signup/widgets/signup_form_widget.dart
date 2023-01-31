import 'package:flutter/material.dart';
import 'package:nas_biztech/constants/sizes.dart';
import 'package:nas_biztech/constants/text_string.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            // password

            ValueListenableBuilder(
                valueListenable: toggle,
                builder: ((context, value, child) {
                  return TextFormField(
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
                  );
                })),
            const SizedBox(height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
