part of 'introduction_bloc.dart';

@immutable
abstract class IntroductionState {}

class IntroductionInitial extends IntroductionState {}

class LoadingPageState extends IntroductionState {}

class GetPageIndexState extends IntroductionState {
  final int index;
  GetPageIndexState({required this.index});
}