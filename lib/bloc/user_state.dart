part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserSelected extends UserState {
  final String userName;

  const UserSelected(this.userName);

  @override
  List<Object> get props => [userName];
}