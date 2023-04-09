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