import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app_clean_architecture/config/routes/routes.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_bloc.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_event.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/pages/home/jokes.dart';
import 'config/theme/app_themes.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokeBloc>(
      create: (context) {
        return sl()..add(GetJokeEvent([]));
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const Jokes()),
    );
  }
}
