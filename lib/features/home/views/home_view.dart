import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quickshop/core/components/custom_drawer.dart';
import 'package:quickshop/core/constants/app_constatnts.dart';
import 'package:quickshop/features/auth/view_model/auth_bloc.dart';

class HomeViewWrapper extends StatelessWidget {
  const HomeViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.add(LogoutEvent());
                Navigator.pushNamed(context, '/login');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          children: [
            InkResponse(
              onTap: () {
                Navigator.pushNamed(context, '/product_list');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: colorScheme.tertiary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(defaultPadding)),
                child: Center(child: Text('Products')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
