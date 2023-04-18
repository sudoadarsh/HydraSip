part of 'introduction_bloc.dart';

@immutable
abstract class IntroductionEvent {}

class GetCurrentPageEvent extends IntroductionEvent {}

class UpdateCurrentIndex extends IntroductionEvent {
  final int index;

  UpdateCurrentIndex({required this.index});
}

class ToggleMetricsEvent<T> extends IntroductionEvent {
  final T? metric;

  ToggleMetricsEvent({required this.metric});
}

class ValidateFormEvent extends IntroductionEvent {
  final List<TextEditingController> controllers;

  ValidateFormEvent({required this.controllers});
}

class GetCalcDmEvent extends IntroductionEvent {}

class UpdateCalcDmEvent extends IntroductionEvent {}
