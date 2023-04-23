part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingHomeState extends HomeState {}

class SipsCalculatedS extends HomeState {
  final int sips;
  SipsCalculatedS({required this.sips});
}