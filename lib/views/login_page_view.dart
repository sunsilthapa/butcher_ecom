import 'package:flutter/material.dart';
import 'package:meat_shop/app/common/snackbar_common.dart';

import '../app/common/common_textfield.dart';
import '../app/routes/app_routes.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    const SizedBox(height: 58),
                    Text(
                      "Welcome to ",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 18),
                    Text(" B-Shop",
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 60),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Email Address",
                      prefixIcon: Icons.email_rounded,
                      keyboardType: TextInputType.emailAddress,
                      validator: ValidateLogin.emailValidate,
                    ),
                    const SizedBox(height: 17),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "Enter password",
                      prefixIcon: Icons.lock_clock_rounded,
                      keyboardType: TextInputType.text,
                      validator: ValidateLogin.password,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    _buildForgotPasswordLink(),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              showSnackbar(context, "login success",
                                  color: Colors.green);
                              // Form is valid, proceed with your navigation logic
                              Navigator.pushNamed(
                                  context, AppRoute.homePageRoute);
                            }
                          },
                          child: const Text(
                            "Login",
                          )),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Wrap(
                            children: [
                              const Text("Sign in with Google"),
                              const SizedBox(
                                width: 33,
                              ),
                              Image.asset(
                                "assets/images/google.webp",
                                width: 25,
                                height: 25,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(height: 16),
                    _buildSignUpLink(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Other functions remain the same
  Widget _buildForgotPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          // Add your forgot password logic or navigation here
        },
        child: Text(
          "Forgot Password?",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Are you new? Create an account",
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.signUpRoute);
          },
          borderRadius: BorderRadius.circular(30),
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}

class ValidateLogin {
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
}
