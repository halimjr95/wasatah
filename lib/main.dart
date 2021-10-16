import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasata/controller/binding.dart';
import 'package:wasata/view/main_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primaryTextTheme: TextTheme(
          //
          //   // title: TextStyle(color: Colors.white),
          // )),
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.grey[50],
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.grey[50],
            elevation: 0.0,
          )),
      initialBinding: Binding(),
      home: MainSplashScreen(),
    );
  }
}
