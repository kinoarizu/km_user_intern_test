part of 'third_screen_bloc.dart';

sealed class ThirdScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchUser extends ThirdScreenEvent {}