import 'package:auto_route/auto_route.dart';
import 'package:duodo/config/router.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class ContinueAsGuestCTA extends StatelessWidget {
  const ContinueAsGuestCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
        ),
        onPressed: () async {
          if (context.mounted) {
            authProvider.guest();
            context.replaceRoute(const HomeRoute());
          }
        },
        child: Text(
          'Continue as Guest',
          style: context.bodyMediumBold,
        ),
      ),
    );
  }
}
