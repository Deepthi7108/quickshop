import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickshop/app_routes.dart';
import 'package:quickshop/core/services/theme_service.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            // decoration: BoxDecoration(
            //   color: Theme.of(context).primaryColor,
            // ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            // onTap: () => Navigator.pushNamed(context, AppRoutes.home),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            // onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
          ),

          // Divider(),

          // Switch(
          //     activeColor: Colors.green,
          //     trackOutlineColor:
          //         MaterialStateProperty.all((Colors.transparent)),
          //     value: Provider.of<ThemeProvider>(context).isDarkMode,
          //     inactiveTrackColor: Colors.blueGrey,
          //     inactiveThumbColor: Colors.black87,
          //     onChanged: (_) {
          //       Provider.of<ThemeProvider>(context, listen: false)
          //           .toggleTheme();
          //     }),

          // ✅ Fix: Use Consumer<ThemeProvider> properly
          SwitchListTile(
              activeColor: colorScheme.primary,
              trackOutlineColor:
                  MaterialStateProperty.all((Colors.transparent)),
              inactiveTrackColor: colorScheme.primary,
              inactiveThumbColor: colorScheme.secondary,
              title: Text("Dark Mode"),
              secondary: Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme()),

          //Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Navigator.pushNamedAndRemoveUntil(
              //     context, AppRoutes.login, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
