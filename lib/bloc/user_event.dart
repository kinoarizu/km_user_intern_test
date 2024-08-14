part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}
class SetUser extends UserEvent {
  final String userName;

  const SetUser(this.userName);

  @override
  List<Object> get props => [userName];
}