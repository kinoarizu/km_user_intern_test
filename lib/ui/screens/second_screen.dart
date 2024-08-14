import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_intern_test_app/bloc/second_screen_bloc.dart';
import 'package:suitmedia_intern_test_app/ui/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  final String name;

  const SecondScreen(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Second Screen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 22,
            color: Colors.deepPurple,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: BlocBuilder<SecondScreenBloc, SecondScreenState>(
                builder: (context, state) {
                  String selectedUser = '';
                  if (state is SelectedUser) {
                    selectedUser += state.name;
                  }
                  return Center(
                    child: Text(
                      selectedUser,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final selectedName = await Navigator.of(context).push<String>(
                    MaterialPageRoute(
                      builder: (_) => const ThirdScreen(),
                    ),
                  );
                  if (selectedName != null) {
                    // ignore: use_build_context_synchronously
                    context.read<SecondScreenBloc>().add(SetSelectedUser(selectedName));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A6171),
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Choose a User",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
