import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/logic/theme/theme_cubit.dart';
import 'package:hydra_sip/utils/routing/generate_route.dart';
import 'package:hydra_sip/utils/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
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
          int? index = SharedPref.getInt(KeyConstants.pageIndex);
          return MaterialApp(
            theme: state.appTheme ? ThemeC.lightTheme : ThemeC.darkTheme,
            onGenerateRoute: GenerateRoute.generate,
            initialRoute: index == 4 ? RouteC.home : RouteC.intro,
          );
        },
      ),
    );
  }
}
