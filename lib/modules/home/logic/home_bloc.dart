import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
  WeatherCondition condition = WeatherCondition.unknown;

  HomeBloc() : super(HomeInitial()) {

  }
}
