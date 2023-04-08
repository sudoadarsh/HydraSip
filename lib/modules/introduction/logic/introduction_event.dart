part of 'introduction_bloc.dart';

@immutable
abstract class IntroductionEvent {}

class GetCurrentPageEvent extends IntroductionEvent {}

class SaveCurrentIndexEvent extends IntroductionEvent {
  final int index;
  SaveCurrentIndexEvent({required this.index});
}