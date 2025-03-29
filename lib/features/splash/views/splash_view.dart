import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickshop/core/constants/app_constatnts.dart';
import 'package:quickshop/features/auth/view_model/auth_bloc.dart';

class SplashViewWrapper extends StatelessWidget {
  const SplashViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckLoginStatusEvent()),
      child: SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is UnAuthenticatedState) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        body: Container(
          color: colorScheme.tertiary,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: defaultPadding * 5,
              ),
              Image.asset(
                'assets/images/splash.png',
                height: 350,
                width: 350,
              ),
              SizedBox(
                height: defaultPadding,
              ),
              Text(
                'QuickShop',
                style: textTheme.headlineMedium
                    ?.copyWith(color: colorScheme.surface),
              )
            ],
          ),
        ),
      ),
    );
  }
}
