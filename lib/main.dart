import 'package:flutter/material.dart';
import './features/rate_experience/rate_experience.dart';
import './features/rate_experience/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
    theme: ThemeData.light(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderedFoodCubit()..loadOrderedFood(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RateExperiencePage(),
      ),
    );
  }
}