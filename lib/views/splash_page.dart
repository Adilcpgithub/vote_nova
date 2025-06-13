import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vote_nova/core/navigation/navigation.dart';
import 'package:vote_nova/core/utility/media_query.dart';
import 'package:vote_nova/views/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> gotohome() async {
    log('navigation called');
    Future.delayed(Duration(milliseconds: 2700), () {
      // ignore: use_build_context_synchronously
      CustomNavigation.pushAndRemoveUntil(context, MyHome());
    });
  }

  @override
  void initState() {
    gotohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight(context),
        decoration: BoxDecoration(
          color: Color(0xFF004aad),
          image: DecorationImage(
            image: AssetImage('asset/splash_image.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
