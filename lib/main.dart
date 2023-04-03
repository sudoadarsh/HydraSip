import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/logic/theme/theme_cubit.dart';
import 'package:hydra_sip/modules/dashboard/dashboard.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.appTheme ? ThemeC.lightTheme : ThemeC.darkTheme,

          );
        },
      ),
    );
  }
}
