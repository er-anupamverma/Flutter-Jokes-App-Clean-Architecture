import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app_clean_architecture/core/resources/data_state.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/entities/joke.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/usecases/get_joke.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_event.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_state.dart';
import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final GetJokeUseCase _getArticleUseCase;
  List<Color> jokeColorList = [
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
  ];

  JokeBloc(this._getArticleUseCase) : super(JokeStateLoading()) {
    on<GetJokeEvent>(onGetArticles);
  }

  void onGetArticles(GetJokeEvent event, Emitter<JokeState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('jokes') != null)
        event.jokeList = convertToListOfObjects(
            jsonDecode(prefs.getString('jokes').toString()));
      if (event.jokeList!.length >= 10) {
        event.jokeList?.removeAt(0);
      }
      event.jokeList?.add(dataState.data!);
      await prefs.setString(
          'jokes',
          jsonEncode(event.jokeList
              ?.map((element) => {
                    'joke': element.joke,
                  })
              .toList()));
      emit(JokeStateDone(event.jokeList!));
    }
    if (dataState is DataFailed) {
      emit(JokeStateError(dataState.error!));
    }
  }

  List<JokeEntity> convertToListOfObjects(List<dynamic> listOfMaps) {
    List<JokeEntity> result = [];
    for (dynamic map in listOfMaps) {
      result.add(JokeEntity(joke: map["joke"]));
    }
    return result;
  }
}
