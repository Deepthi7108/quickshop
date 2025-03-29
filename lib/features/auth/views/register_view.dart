import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickshop/core/components/custom_header_text.dart';
import 'package:quickshop/core/components/custom_sizedbox.dart';
import 'package:quickshop/core/components/custom_submit_button.dart';
import 'package:quickshop/core/components/custom_textformfield.dart';
import 'package:quickshop/core/constants/app_constatnts.dart';
import 'package:quickshop/features/auth/models/user_model.dart';
import 'package:quickshop/features/auth/view_model/auth_bloc.dart';

class RegisterViewWrapper extends StatelessWidget {
  const RegisterViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthenticatedState) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          },
        );
      }
      return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.all(defaultPadding),
            height: double.infinity,
            width: double.infinity,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHeaderText(text: 'Register'),
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
                      CustomTextformfield(
                          controller: nameController, hintText: 'Name'),
                      CustomSizedbox(),
                      CustomTextformfield(
                          controller: phoneController, hintText: 'Phone'),
                      CustomSizedbox(),
                      CustomButton(
                          function: () {
                            UserModel user = UserModel(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text);
                            authBloc.add(SignupEvent(user: user));
                          },
                          text: 'Register'),
                      CustomSizedbox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            //onTap: widget.togglePages,
                            child: Text(
                              "Login now",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
