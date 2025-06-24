import 'package:flutter/material.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vote_nova/views/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}

class SS extends StatelessWidget {
  const SS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: AppColors.primayColor,
          secondRingColor: Colors.black,
          thirdRingColor: Colors.blueAccent,
          size: 50,
        ),
      ),
    );
  }
}
