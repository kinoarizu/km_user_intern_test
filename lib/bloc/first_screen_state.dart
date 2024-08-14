part of 'first_screen_bloc.dart';

abstract class FirstScreenState extends Equatable {
  const FirstScreenState();

  @override
  List<Object> get props => [];
}

class FirstScreenInitial extends FirstScreenState {}

class PalindromeState extends FirstScreenState {}

class NotPalindromeState extends FirstScreenState {}
