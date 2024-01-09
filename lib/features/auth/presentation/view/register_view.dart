import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:meat_shop/core/common/snackbar/my_snackbar.dart';
import 'package:meat_shop/features/auth/domain/entity/auth_entity.dart';
import 'package:meat_shop/features/auth/presentation/view_model/auth_view_model.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _gap = const SizedBox(height: 28);

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'user');
  final _lnameController = TextEditingController(text: 'user');
  final _emailController = TextEditingController(text: 'user@gmail.com');
  final _passwordController = TextEditingController(text: 'user123');
  final _confirmPasswordController = TextEditingController(text: 'user123');

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authState.showMessage) {
        showSnackBar(message: "User Registered", context: context);
        ref.read(authViewModelProvider.notifier).resetMessage(false);
      }
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/splash1.png'),
                      // backgroundImage: _img != null
                      //     ? FileImage(_img!)
                      //     : const AssetImage('assets/images/profile.png')
                      //         as ImageProvider,
                    ),
                  ),
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(LineIcons.user),
                      // labelText: 'First Name',
                      // labelStyle: Theme.of(context).textTheme.displayMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(LineIcons.user),
                      labelText: 'Last Name',
                      labelStyle: Theme.of(context).textTheme.displayMedium,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(LineIcons.mailBulk),
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.displayMedium,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isPasswordObscure,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(LineIcons.key),
                      labelText: 'Password',
                      labelStyle: Theme.of(context).textTheme.displayMedium,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText:
                        isConfirmPasswordObscure, // Add this line for the "Confirm Password" field
                    decoration: InputDecoration(
                      prefixIcon: const Icon(LineIcons.key),
                      labelText: 'Confirm Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isConfirmPasswordObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordObscure =
                                !isConfirmPasswordObscure;
                          });
                        },
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter confirm password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        AuthEntity user = AuthEntity(
                            firstName: _fnameController.text,
                            lastName: _lnameController.text,
                            email: _emailController.text,
                            password: _passwordController.text);

                        ref.read(authViewModelProvider.notifier).addUser(user);
                      }
                    },
                    child: const Text('SignUp'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
