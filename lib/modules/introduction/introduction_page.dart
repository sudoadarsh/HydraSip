import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/models/calc_dm.dart';
import 'package:hydra_sip/modules/introduction/logic/introduction_bloc.dart';
import 'package:hydra_sip/modules/introduction/widgets/intro_page_widgets.dart';
import 'package:hydra_sip/utils/routing/generate_route.dart';
import 'package:hydra_sip/utils/water_intake_calc/water_intake_calc.dart';

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
  late final TextEditingController _inchController;

  /// The form key.
  late final GlobalKey<FormState> _globalKey;

  /// To validate the HW page.
  late bool proceed;

  @override
  void initState() {
    super.initState();
    _introductionBloc = IntroductionBloc();
    _introductionBloc.add(GetCurrentPageEvent());
    _weightController = TextEditingController();
    _heightController = TextEditingController();
    _inchController = TextEditingController();
    proceed = false;
    _globalKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _introductionBloc.close();
    _weightController.dispose();
    _heightController.dispose();
    _inchController.dispose();
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
            } else if (state is UpdateIndexState) {
              _pageViewController.animateToPage(
                state.index,
                duration: DateTimeC.cd500ms,
                curve: Curves.easeIn,
              );
            } else if (state is FormValidationState) {
              proceed = state.proceed;
            } else if (state is CalcDmLoadedState) {
              _prefillData(state);
            }
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              children: [
                // 0. The get started page.
                GetStartedPage(onGetStarted: _getStarted),
                // 1. Height and weight page.
                HwPage(
                  weightController: _weightController,
                  heightController: _heightController,
                  bloc: _introductionBloc,
                  inchController: _inchController,
                  onHWContinue: _onHWContinue,
                  proceed: proceed,
                  formKey: _globalKey,
                ),
                // 2. Activity page.
                ActivityPage(
                  bloc: _introductionBloc,
                  onActivityContinue: _onActivityContinue,
                  onActivityBack: _onActivityBack,
                ),
                // 3. Climate Page.
                ClimatePage(
                  bloc: _introductionBloc,
                  onClimateBack: _climateBack,
                  onClimateContinue: _climateContinue,
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

  void _onHWContinue() async {
    FocusScope.of(context).unfocus();
    _introductionBloc.add(UpdateCurrentIndex(index: 2));

    // Murican metrics.
    _introductionBloc.calcDm = _introductionBloc.calcDm.copyWith(
      height: Height(
        inch: _inchController.text,
        cm: _heightController.text,
        foot: _heightController.text,
        murican: _inchController.text.isNotEmpty,
      ),
      weight: Weight(
        kg: _weightController.text,
        lbs: _weightController.text,
        innit: _introductionBloc.weightMetrics == WeightMetrics.lbs,
      ),
    );
    _introductionBloc.add(UpdateCalcDmEvent());
  }

  void _onActivityContinue() {
    _introductionBloc.add(UpdateCurrentIndex(index: 3));
    _introductionBloc.calcDm = _introductionBloc.calcDm
        .copyWith(activity: _introductionBloc.activity.factor.round());
    _introductionBloc.add(UpdateCalcDmEvent());
  }

  void _onActivityBack() {
    _introductionBloc.add(UpdateCurrentIndex(index: 1));
  }

  void _climateContinue() {
    _introductionBloc.add(UpdateCurrentIndex(index: 4));
    _introductionBloc.calcDm = _introductionBloc.calcDm
        .copyWith(climate: _introductionBloc.climate.factor.round());
    _introductionBloc.add(UpdateCalcDmEvent());
    Navigator.of(context).pushNamedAndRemoveUntil(RouteC.home, (route) {
      return false;
    });
  }

  void _climateBack() {
    _introductionBloc.add(UpdateCurrentIndex(index: 2));
  }

  void _prefillData(CalcDmLoadedState state) {
    if (state.calcDm.height?.murican ?? false) {
      _heightController.text = state.calcDm.height?.foot ?? '';
      _inchController.text = state.calcDm.height?.inch ?? '';
    } else {
      _heightController.text = state.calcDm.height?.cm ?? '';
      _introductionBloc.heightMetric = HeightMetrics.cm;
    }
    if (state.calcDm.weight?.innit ?? false) {
      _introductionBloc.weightMetrics = WeightMetrics.lbs;
      _weightController.text = state.calcDm.weight?.lbs ?? '';
    }
    _weightController.text = state.calcDm.weight?.kg ?? '';
    _introductionBloc.activity = Activity.values[state.calcDm.activity ?? 0];
    _introductionBloc.climate = Climate.values[state.calcDm.climate ?? 0];
  }
}
