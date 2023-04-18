import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/utils/shared_pref.dart';
import 'package:hydra_sip/utils/water_intake_calc/water_intake_calc.dart';

import '../../../models/calc_dm.dart';

part 'introduction_event.dart';
part 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  HeightMetrics heightMetric = HeightMetrics.feet;
  WeightMetrics weightMetrics = WeightMetrics.kg;
  Activity activity = Activity.sedentary;
  Climate climate = Climate.temperate;
  bool formValidation = false;

  CalcDm calcDm = CalcDm(
    height: Height(),
    weight: Weight()
  );

  IntroductionBloc() : super(IntroductionInitial()) {
    /// Get the calc dm.
    on<GetCalcDmEvent>((event, emit) {
      String encoded = SharedPref.getString(KeyConstants.hydraSipTable) ?? '';
      if (encoded.isNotEmpty) {
        calcDm = CalcDm.fromJson(jsonDecode(encoded));
      }
      emit(CalcDmLoadedState(calcDm: calcDm));
    });

    /// To update the calc dm.
    on<UpdateCalcDmEvent>((event, emit) async {
      try {
        await SharedPref.setValue(
          jsonEncode(calcDm.toJson()),
          KeyConstants.hydraSipTable,
        );
      } catch (E) {
        debugPrint('Error while saving height data: ${E.toString()}');
      }
    });

    /// To get the saved index of the latest page.
    on<GetCurrentPageEvent>((event, emit) async {
      emit(LoadingPageState());
      int index = _getCurrentIndex();
      emit(GetPageIndexState(index: index));
      await Future.delayed(const Duration(milliseconds: 500));
      add(GetCalcDmEvent());
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

    /// To validate the HW form.
    on<ValidateFormEvent>((event, emit) {
      formValidation = true;
      for (TextEditingController controller in event.controllers) {
        if (controller.text.isEmpty) {
          formValidation = false;
          break;
        }
      }
      emit(FormValidationState(proceed: formValidation));
    });
  }

  int _getCurrentIndex() {
    return SharedPref.getInt(KeyConstants.pageIndex) ?? 0;
  }

  Future<bool?> _updateCurrentIndex(int i) async {
    return await SharedPref.setValue(i, KeyConstants.pageIndex);
  }
}
