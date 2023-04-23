import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/models/calc_dm.dart';
import 'package:hydra_sip/utils/shared_pref.dart';
import 'package:hydra_sip/utils/water_intake_calc/water_intake_calc.dart';

part 'home_event.dart';

part 'home_state.dart';

enum WeatherCondition {
  sunny(Icons.sunny),
  cloudy(Icons.cloud),
  rainy(Icons.cloudy_snowing),
  snowy(Icons.snowing),
  unknown(Icons.hourglass_empty);

  final IconData icon;

  const WeatherCondition(this.icon);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// The number of sips.
  int sips = 0;

  HomeBloc() : super(HomeInitial()) {
    on<CalculateSipsE>((event, emit) {
      emit(LoadingHomeState());
      int? sips = SharedPref.getInt(KeyConstants.sips);
      // Sips has not been calculated previously.
      if (sips == null) {
        // Load calc dm.
        String encoded = SharedPref.getString(KeyConstants.hydraSipTable) ?? '';
        CalcDm calcDm;
        if (encoded.isNotEmpty) {
          calcDm = CalcDm.fromJson(jsonDecode(encoded));

          double height;
          double weight;

          if (calcDm.height?.murican ?? false) {
            double heightInFeet = (double.tryParse(calcDm.height?.foot ?? '0') ??
                0) +
                    WaterIntakeCalc.inchToFeet(
                      double.tryParse(calcDm.height?.inch ?? '0') ?? 0,
                    );
            height = WaterIntakeCalc.feetToCm(heightInFeet);
          } else {
            height = double.tryParse(calcDm.height?.cm ?? '0') ?? 0;
          }

          if (calcDm.weight?.innit ?? false) {
            weight = WaterIntakeCalc.poundToKg(
                double.tryParse(calcDm.weight?.lbs ?? '0') ?? 0);
          } else {
            weight = double.tryParse(calcDm.weight?.kg ?? '0') ?? 0;
          }

          // Get the body surface area.
          double bsa = WaterIntakeCalc.bodySurfaceArea(
            height: height,
            weight: weight,
          );

          // Get the sips.
          double waterIntake = WaterIntakeCalc.waterIntake(
            bsa: bsa,
            activity: calcDm.activity ?? 0,
            climate: calcDm.climate ?? 0,
          );

          sips = WaterIntakeCalc.numberOfSip(liters: waterIntake);

          emit(SipsCalculatedS(sips: sips));
        } else {
          // Error event.
        }
      } else {
        emit(SipsCalculatedS(sips: sips));
      }
    });
  }
}
