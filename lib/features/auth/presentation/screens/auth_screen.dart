import 'package:auto_route/auto_route.dart';
import 'package:duodo/core/extensions/context_ext.dart';
import 'package:duodo/features/auth/presentation/components/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              _Title(),
              Spacer(),
              ContinueAsGuestCTA(),
              // ContinueWithGoogleCTA(),
              Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Text(
      'DuoDo',
      style: context.headlineLarge,
    );
  }
}
