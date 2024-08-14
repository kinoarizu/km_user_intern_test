import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:suitmedia_intern_test_app/models/user_model.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:suitmedia_intern_test_app/repositories/user_repository.dart';

part 'third_screen_event.dart';
part 'third_screen_state.dart';

const _userLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ThirdScreenBloc extends Bloc<ThirdScreenEvent, ThirdScreenState> {
  final UserRepository userRepository;

  ThirdScreenBloc(this.userRepository) : super(const ThirdScreenState()) {
    on<FetchUser>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onPostFetched(FetchUser event, Emitter<ThirdScreenState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == UserStatus.initial) {
        final users = await userRepository.getUsers();
        return emit(state.copyWith(
          status: UserStatus.success,
          users: users,
          hasReachedMax: false,
        ));
      }
      final page = (state.users.length / _userLimit).ceil() + 1;
      final users = await userRepository.getUsers(page: page, perPage: _userLimit);
      emit(
        users.isEmpty ? state.copyWith(hasReachedMax: true) : state.copyWith(
          status: UserStatus.success,
          users: List.of(state.users)..addAll(users),
          hasReachedMax: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
}
