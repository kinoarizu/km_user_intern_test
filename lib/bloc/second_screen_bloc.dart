import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'second_screen_event.dart';
part 'second_screen_state.dart';

class SecondScreenBloc extends Bloc<SecondScreenEvent, SecondScreenState> {
  SecondScreenBloc() : super(SecondScreenInitial()) {
    on<SetSelectedUser>(
      (event, emit) => emit(SelectedUser(event.name)),
    );
  }
}
