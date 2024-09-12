import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_theme_bloc/blocs/bloc/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
          value: context.watch<ThemeBloc>().state.theme == MyTheme.light
              ? false
              : true,
          onChanged: (value) {
            context.read<ThemeBloc>().add(ToggleTheme(isDark: value));
          },
        ),
      ),
    );
  }
}
