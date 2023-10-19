import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_bloc.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_event.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_state.dart';
import '../../widgets/joke_widget.dart';

class Jokes extends StatelessWidget {
  const Jokes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'UnLimit Jokes',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _buildBody() {
    return BlocListener<JokeBloc, JokeState>(listener: (context, state) {
      if (state is JokeStateDone) {
        Future.delayed(const Duration(seconds: 60), () {
          context.read<JokeBloc>().add(GetJokeEvent(state.jokeList));
        });
      }
    }, child: BlocBuilder<JokeBloc, JokeState>(
      builder: (context, state) {
        if (state is JokeStateLoading) {
          return const Center(
              child: CupertinoActivityIndicator(
            radius: 20,
            color: Colors.black,
          ));
        }
        if (state is JokeStateError) {
          return  Center(child: Text(state.error!.message));
        }
        if (state is JokeStateDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final currentColor = context.read<JokeBloc>().jokeColorList[
                  (index % context.read<JokeBloc>().jokeColorList.length)];
              final nextColor = index ==
                      context.read<JokeBloc>().jokeColorList.length - 1
                  ? Colors.white
                  : context.read<JokeBloc>().jokeColorList[(index + 1) % 10];
              return JokeWidget(
                joke: state.jokeList![index],
                currentColor: currentColor,
                nextColor: nextColor,
              );
            },
            itemCount: state.jokeList?.length,
          );
        }
        return const SizedBox();
      },
    ));
  }
}
