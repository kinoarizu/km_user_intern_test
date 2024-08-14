import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_intern_test_app/bloc/first_screen_bloc.dart';
import 'package:suitmedia_intern_test_app/bloc/second_screen_bloc.dart';
import 'package:suitmedia_intern_test_app/bloc/third_screen_bloc.dart';
import 'package:suitmedia_intern_test_app/bloc/user_bloc.dart';
import 'package:suitmedia_intern_test_app/repositories/user_repository.dart';
import 'package:suitmedia_intern_test_app/ui/screens/first_screen.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FirstScreenBloc()),
        BlocProvider(create: (context) => SecondScreenBloc()),
        BlocProvider(create: (context) => ThirdScreenBloc(UserRepository())..add(FetchUser())),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const FirstScreen(),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}