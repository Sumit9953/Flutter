import 'package:flutter/material.dart';
import 'package:flutter_learn/views/home_view.dart';

// stateless widgets is a widget that does not require mutable state
// statelull widgets is a widget require mutable state "dynamic color changes example"

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //it is used for rendring
    return const MaterialApp(
        title: 'Flutter Lean',
        home:  HomeView()
        );
  }
}
