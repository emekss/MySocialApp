import 'package:flutter/material.dart';
import 'package:social/component/custom_button.dart';
import 'package:social/component/custom_circle_indicator.dart';
import 'package:social/component/custom_text.dart';
import 'package:social/component/custom_textfield.dart';
import 'package:social/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // auth service
  final _auth = AuthService();

  // text controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async {
    //show loading circle
    showLoadingCirlce(context);

    //attempt login
    try {
      await _auth.loginEmailPassword(
          emailController.text, passwordController.text);

      // finished loading
      if (mounted) hideLoadingCircle(context);
    }
    // catch error
    catch (e) {
      // finished loading
      if (mounted) hideLoadingCircle(context);

      //let user know of error
      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: CustomText(
                    text: e.toString(),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
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
                    text: 'Welcome Back, you\'ve been missed.',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 25),
                CustomTextfield(
                    controller: emailController,
                    hintText: 'Enter email',
                    obscureText: false),
                const SizedBox(height: 10),
                CustomTextfield(
                    controller: passwordController,
                    hintText: 'Enter password',
                    obscureText: true),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'Forgot Password?',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 25),
                CustomButton(
                  onTap: login,
                  text: 'Login',
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Not a Member?',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: CustomText(
                        text: ' Register now',
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
