import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellness_mobile/bloc/article_bloc/article_bloc.dart';
import 'package:wellness_mobile/widgets/bottom_nav.dart';

import '../bloc/mental_bloc/mental_bloc.dart';

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ArticleBloc(preferences)),
          BlocProvider(create: (_) => MentalBloc(preferences)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
                .copyWith(background: Colors.white),
          ),
          home: const BottomNav(),
        ));
  }
}
