import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickshop/core/components/custom_header_text.dart';
import 'package:quickshop/core/components/custom_sizedbox.dart';
import 'package:quickshop/core/components/custom_submit_button.dart';
import 'package:quickshop/core/components/custom_textformfield.dart';
import 'package:quickshop/core/constants/app_constatnts.dart';
import 'package:quickshop/features/auth/view_model/auth_bloc.dart';

class LoginViewWrapper extends StatelessWidget {
  const LoginViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return CircularProgressIndicator();
        }
        if (state is AuthenticatedState) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
          );
        }
        return Scaffold(
          body: Container(
              padding: EdgeInsets.all(defaultPadding),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeaderText(text: 'Login'),
                  CustomSizedbox(),
                  CustomTextformfield(
                      controller: emailController, hintText: 'Email'),
                  CustomSizedbox(),
                  CustomTextformfield(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  CustomSizedbox(),
                  CustomButton(
                      function: () {
                        authBloc.add(LoginEvent(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()));
                      },
                      text: 'Login'),
                  CustomSizedbox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        //onTap: widget.togglePages,
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}
