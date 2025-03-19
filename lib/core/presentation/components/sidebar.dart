import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:duodo/core/presentation/components/user_image_letter.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    // final userProfile = sl.get<FirebaseAuth>().currentUser?.photoURL;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: Hero(
              tag: 'profile-pic-name',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const UserImageOrLetter(
                    imageUrl: null,
                    name: 'Guest',
                    radius: 45,
                  ),
                  const Gap(8),
                  Text(
                    'Guest',
                    style: context.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          // ListTile(
          //   title: const Text('Profile'),
          //   trailing: const Icon(Icons.person),
          //   onTap: () {
          //     // context
          //     //   ..maybePop()
          //     //   ..pushRoute(const ProfileRoute());
          //   },
          // ),
          ListTile(
            title: const Text('Settings'),
            trailing: const Icon(Icons.settings),
            onTap: () {
              context
                ..maybePop()
                ..pushRoute(const SettingsRoute());
            },
          ),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.logout),
            onTap: () async {
              await authProvider.logout();
            },
          ),
        ],
      ),
    );
  }
}
