import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/utils/shared_pref.dart';
import 'package:hydra_sip/utils/water_intake_calc/water_intake_calc.dart';
import 'package:meta/meta.dart';

part 'introduction_event.dart';

part 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {

  HeightMetrics heightMetric = HeightMetrics.feet;
  WeightMetrics weightMetrics = WeightMetrics.kg;
  Activity activity = Activity.moderately;
  Climate climate = Climate.hotAndDry;

  IntroductionBloc() : super(IntroductionInitial()) {
    /// To get the saved index of the latest page.
    on<GetCurrentPageEvent>((event, emit) {
      emit(LoadingPageState());
      int index = _getCurrentIndex();
      emit (GetPageIndexState(index: index));
    });

    /// To save the current index of the page locally.
    on<UpdateCurrentIndex>((event, emit) async {
      emit(UpdateIndexState(index: event.index));
      await _updateCurrentIndex(event.index);
    });

    /// To toggle the metrics.
    on<ToggleMetricsEvent>((event, emit) {
      switch (event.metric.runtimeType) {
        case HeightMetrics:
          heightMetric = event.metric;
          break;
        case WeightMetrics:
          weightMetrics = event.metric;
          break;
        case Climate:
          climate = event.metric;
          break;
        case Activity:
          activity = event.metric;
          break;
      }
      emit(MetricsToggledState());
    });
  }

  int _getCurrentIndex() {
    return SharedPref.instance.getInt(KeyConstants.pageIndex) ?? 0;
  }

  Future<bool?> _updateCurrentIndex(int i) async {
    return await SharedPref.instance.setValue(i, KeyConstants.pageIndex);
  }
}
