import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:wasata/view/Layout/layout_screen.dart';
import 'package:wasata/view/auth/login_screen.dart';
import 'package:wasata/view/on_boarding/on_boarding_screen.dart';

class MainSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget startScreen;

    bool? onboarding = GetStorage().read('onBoarding');
    bool? rememberMe = GetStorage().read('rememberMe');

    // print('onbarding == $onboarding');

    if(onboarding != null){
      print('remeber == $rememberMe ');
      if(rememberMe != null && rememberMe) startScreen = LayoutScreen();
      else startScreen = LoginScreen();
    }
    else startScreen = OnBoardingScreen();

    return Scaffold(
      body: SplashScreenView(
        navigateRoute: startScreen,
        duration: 5000,
        // imageSize: 500,
        imageSrc: "assets/images/splash.png",
        imageSize: 300,
        // text: "Splash Screen",
        // textType: TextType.ColorizeAnimationText,
        // textStyle: TextStyle(
        //   fontSize: 40.0,
        // ),
        // colors: [
        //   Colors.purple,
        //   Colors.blue,
        //   Colors.yellow,
        //   Colors.red,
        // ],
        backgroundColor: Colors.grey[50],
      )
    );
  }
}
