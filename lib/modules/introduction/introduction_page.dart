import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydra_sip/modules/introduction/logic/introduction_bloc.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  /// The page view controller.
  late final PageController _pageViewController;

  /// The Introduction page bloc.
  late final IntroductionBloc _introductionBloc;

  @override
  void initState() {
    super.initState();
    _introductionBloc = IntroductionBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _introductionBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          builder: (context, state) {
            if (state is LoadingPageState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return PageView(
              controller: _pageViewController,
              children: [Container()],
            );
          },
        ),
      ),
    );
  }
}
