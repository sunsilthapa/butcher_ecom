import 'package:flutter/material.dart';

import '../app/routes/app_routes.dart';
import '../utils/app_fonts.dart';
import '../utils/custom_widgets.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                    Text(
                      "B-Shop",
                      style: AppFonts.decorative(),
                    ),
                    const SizedBox(height: 68),
                    Text(
                      "Welcome to B-Shop",
                      style: AppFonts.headingText(fontSize: 40),
                    ),
                    const SizedBox(height: 20),
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
                    _buildForgotPasswordLink(),
                    const SizedBox(height: 25),
                    CustomButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.homePageRoute);
                        },
                        width: MediaQuery.of(context).size.width),
                    const SizedBox(height: 15),
                    CustomButton(
                      text: "Sign in with Google",
                      onPressed: () {},
                      width: MediaQuery.of(context).size.width,
                      leadingIcon: Image.asset(
                        "assets/images/google.webp",
                        width: 25,
                        height: 25,
                      ),
                    ),
                    const SizedBox(height: 6),
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
          style: AppFonts.bodyText(),
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
