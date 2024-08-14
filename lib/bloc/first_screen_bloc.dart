import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'first_screen_event.dart';
part 'first_screen_state.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
  FirstScreenBloc() : super(FirstScreenInitial()) {
    on<CheckPalindrome>((event, emit) {
      final isPalindrome = _isPalindrome(event.sentence);
      if (isPalindrome) {
        emit(PalindromeState());
      } else {
        emit(NotPalindromeState());
      }
    });

    on<ResetPalindrome>(
      (event, emit) => emit(FirstScreenInitial()),
    );
  }

  bool _isPalindrome(String text) {
    String cleaned = text.replaceAll(RegExp(r"[^a-zA-Z0-9\\s]+"), "").toLowerCase();
    String t = cleaned.split('').reversed.join('');
    return cleaned == t;
  }
}
