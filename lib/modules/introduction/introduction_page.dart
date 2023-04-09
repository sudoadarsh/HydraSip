import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydra_sip/modules/introduction/logic/introduction_bloc.dart';
import 'package:hydra_sip/modules/introduction/widgets/intro_page_widgets.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  /// The page view controller.
  late PageController _pageViewController;

  /// The Introduction page bloc.
  late final IntroductionBloc _introductionBloc;

  /// The TextEditingControllers.
  late final TextEditingController _weightController;
  late final TextEditingController _heightController;

  @override
  void initState() {
    super.initState();
    _introductionBloc = IntroductionBloc();
    _introductionBloc.add(GetCurrentPageEvent());
    _weightController = TextEditingController();
    _heightController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _introductionBloc.close();
    _weightController.dispose();
    _heightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          buildWhen: (prev, current) => prev != current,
          bloc: _introductionBloc,
          builder: (context, state) {
            if (state is LoadingPageState || state is IntroductionInitial) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is GetPageIndexState) {
              _pageViewController = PageController(initialPage: state.index);
            }
            return PageView(
              controller: _pageViewController,
              children: [
                GetStartedPage(onGetStarted: _getStarted),
                HwPage(
                  weightController: _weightController,
                  heightController: _heightController,
                  bloc: _introductionBloc,
                  onHWContinue: _onHWContinue,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // --------------------------- Class methods ---------------------------------

  void _getStarted() {
    _introductionBloc.add(UpdateCurrentIndex(index: 1));
  }

  void _onHWContinue() {
    _introductionBloc.add(UpdateCurrentIndex(index: 2));
  }
}
