part of 'second_screen_bloc.dart';

abstract class SecondScreenEvent extends Equatable {
  const SecondScreenEvent();

  @override
  List<Object> get props => [];
}

class SetSelectedUser extends SecondScreenEvent {
  final String name;

  const SetSelectedUser(this.name);

  @override
  List<Object> get props => [name];
}
