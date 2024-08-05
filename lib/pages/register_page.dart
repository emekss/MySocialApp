import 'package:flutter/material.dart';
import 'package:social/component/custom_button.dart';
import 'package:social/component/custom_circle_indicator.dart';
import 'package:social/component/custom_text.dart';
import 'package:social/component/custom_textfield.dart';

import '../services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // auth service
  final _auth = AuthService();

  // text controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  //register button tapped
  void register() async {
    // passwords match -> create user
    if (passwordController.text == confirmPwController.text) {
      // show loading circle
      showLoadingCirlce(context);

      //attempt to register user
      try {
        // trying to register
        await _auth.registerEmailPassword(
          emailController.text,
          passwordController.text,
        );

        //finished loading
        if (mounted) showLoadingCirlce(context);
      }
      //catch error
      catch (e) {
        //finished loading
        if (mounted) showLoadingCirlce(context);

        // let user know of the error
        if (mounted) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      e.toString(),
                    ),
                  ));
        }
      }
    }

    // passwords dont match -> show error
    else {
      // let user know of the error
      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: CustomText(
                    text: 'Passwords don\'t match!!!',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.red,
                  ),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock_open_outlined,
                  size: 72,
                ),
                const SizedBox(height: 50),
                CustomText(
                    text: 'Let\'s create an account for you.',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 25),
                CustomTextfield(
                    controller: nameController,
                    hintText: 'Enter Name',
                    obscureText: false),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: emailController,
                    hintText: 'Enter email',
                    obscureText: true),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: passwordController,
                    hintText: 'Enter password',
                    obscureText: true),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: confirmPwController,
                    hintText: 'Confirm password',
                    obscureText: true),
                const SizedBox(height: 25),
                CustomButton(
                  onTap: register,
                  text: 'Register',
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Already a Member?',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: CustomText(
                        text: 'Login now',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
