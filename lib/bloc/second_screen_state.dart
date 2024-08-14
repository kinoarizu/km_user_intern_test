part of 'second_screen_bloc.dart';

abstract class SecondScreenState extends Equatable {
  const SecondScreenState();

  @override
  List<Object> get props => [];
}

class SecondScreenInitial extends SecondScreenState {}

class SelectedUser extends SecondScreenState {
  final String name;

  const SelectedUser(this.name);

  @override
  List<Object> get props => [name];
}
