import 'package:flutter/material.dart';
import 'package:meat_shop/app/common/snackbar_common.dart';
import 'package:meat_shop/app/routes/app_routes.dart';

import '../app/common/common_textfield.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isVisible = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48),
                    Text(
                      "B-Shop ",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "Create an Account",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 50),
                    CustomTextField(
                      controller: usernameController,
                      hintText: "Username",
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.text,
                      validator: ValidateSignUp.usernameValidate,
                    ),
                    const SizedBox(height: 17),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email Address",
                      prefixIcon: Icons.email_rounded,
                      keyboardType: TextInputType.emailAddress,
                      validator: ValidateSignUp.emailValidate,
                    ),
                    const SizedBox(height: 17),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "Enter password",
                      prefixIcon: Icons.lock_clock_rounded,
                      keyboardType: TextInputType.text,
                      validator: ValidateSignUp.password,
                      isPassword: true,
                    ),
                    const SizedBox(height: 17),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      prefixIcon: Icons.lock_clock_rounded,
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          ValidateSignUp.confirmPasswordValidator(
                        passwordController.text,
                        value,
                      ),
                      isPassword: true,
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              showSnackbar(context, "register success",
                                  color: Colors.green);
                              // Form is valid, proceed with your navigation logic
                              Navigator.pushNamed(
                                  context, AppRoute.homePageRoute);
                            }
                          },
                          child: const Text(
                            "Sign Up",
                          )),
                    ),
                    const SizedBox(height: 12),
                    _buildLoginLink(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.loginRoute);
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}

class ValidateSignUp {
  static String? usernameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Please confirm your password";
    }
    if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }
}
