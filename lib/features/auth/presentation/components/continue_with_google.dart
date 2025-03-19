import 'package:duodo/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class ContinueWithGoogleCTA extends StatelessWidget {
  const ContinueWithGoogleCTA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
        ),
        onPressed: () async {
          // await sl<AuthService>().signInWithGoogle();
          // if (context.mounted) {
          //   context.pushRoute(const HomeRoute());
          // }
        },
        child: Text(
          'Continue with Google',
          style: context.bodyMediumBold,
        ),
      ),
    );
  }
}
