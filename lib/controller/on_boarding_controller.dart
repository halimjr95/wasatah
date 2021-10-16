import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasata/model/on_boarding_model.dart';
import 'package:wasata/view/auth/login_screen.dart';

class OnBoardingController extends GetxController
{

  bool lastPage = false;
  var boardingController = PageController();

  void makeLastPage()
  {
    lastPage = true;
    update();
  }

  void submitOnboarding() async
  {
    await GetStorage().write('onBoarding', true);
    Get.to(LoginScreen());
  }

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      image: 'assets/images/repeat_grid_1.svg',
      title: 'نقدم لك خدمات التسويق العقاري الشاملة',
      body: 'منصة متخصصة في بيع وشراء وتاجير العقارات لحساب الغير',
    ),
    OnBoardingModel(
      image: 'assets/images/repeat_grid_2.svg',
      title: 'مستشارك العقاري الخاص',
      body: 'استشارات عقارية متوافقه مع الانظمة الصادرة من الهيئة العامة العقار',
    ),
    OnBoardingModel(
      image: 'assets/images/repeat_grid_3.svg',
      title: 'إعلانات مبوبة من جميع مناطق المملكة',
      body: 'لا تشيل هم الوساطة، نقدملك إعلانات تغطي جميع إحتياجاتك',
    ),
  ];

}