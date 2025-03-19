import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.color_lens_outlined),
            title: const Text('Theme'),
            onTap: () {
              context.router.push(const ThemeSettingsRoute());
            },
          ),
        ],
      ),
    );
  }
}
