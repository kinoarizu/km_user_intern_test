import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_intern_test_app/bloc/second_screen_bloc.dart';
import 'package:suitmedia_intern_test_app/bloc/third_screen_bloc.dart';
import 'package:suitmedia_intern_test_app/ui/widgets/user_tile.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ThirdScreenBloc>().add(FetchUser());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _onRefresh() async {
    context.read<ThirdScreenBloc>().add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Third Screen',
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
      body: BlocBuilder<ThirdScreenBloc, ThirdScreenState>(
        builder: (context, state) {
          switch (state.status) {
            case UserStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case UserStatus.success:
              return RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  itemCount: state.hasReachedMax
                    ? state.users.length
                    : state.users.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.users.length
                      ? const BottomLoader()
                      : InkWell(
                        child: UserTile(state.users[index]),
                        onTap: () {
                          context.read<SecondScreenBloc>()
                            .add(SetSelectedUser('${state.users[index].firstName} ${state.users[index].lastName}'));
                          Navigator.of(context).pop();
                        },
                      );
                  },
                ),
              );
            case UserStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}