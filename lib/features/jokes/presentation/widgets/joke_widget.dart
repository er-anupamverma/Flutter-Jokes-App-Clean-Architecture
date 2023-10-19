import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/joke.dart';

class JokeWidget extends StatelessWidget {
  final JokeEntity? joke;
  final Color? currentColor;
  final Color? nextColor;

  const JokeWidget({
    Key? key,
    this.joke,
    this.currentColor,
    this.nextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: currentColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 80.0,
          bottom: 50,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                joke!.joke.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}
