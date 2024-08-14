part of 'first_screen_bloc.dart';

abstract class FirstScreenEvent extends Equatable {
  const FirstScreenEvent();

  @override
  List<Object> get props => [];
}

class CheckPalindrome extends FirstScreenEvent {
  final String sentence;

  const CheckPalindrome(this.sentence);

  @override
  List<Object> get props => [sentence];
}

class ResetPalindrome extends FirstScreenEvent {
  @override
  List<Object> get props => [];
}
