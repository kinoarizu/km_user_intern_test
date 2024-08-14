part of 'third_screen_bloc.dart';

enum UserStatus { initial, success, failure }

final class ThirdScreenState extends Equatable {
  const ThirdScreenState({
    this.status = UserStatus.initial,
    this.users = const <User>[],
    this.hasReachedMax = false,
  });

  final UserStatus status;
  final List<User> users;
  final bool hasReachedMax;

  ThirdScreenState copyWith({
    UserStatus? status,
    List<User>? users,
    bool? hasReachedMax,
  }) {
    return ThirdScreenState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ThirdScreenState { status: $status, hasReachedMax: $hasReachedMax, users: ${users.length} }''';
  }

  @override
  List<Object> get props => [status, users, hasReachedMax];
}