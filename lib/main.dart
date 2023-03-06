import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:so_close_task/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => AnimatedSplashScreen(
              splashIconSize: double.infinity,
              splash: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'asset/images/Splash_logo.jpg',
                      width: Get.width,
                      height: Get.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              nextScreen: const HomePage(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
            ),
      },
    );
  }
}
