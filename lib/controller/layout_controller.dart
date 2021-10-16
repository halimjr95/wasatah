import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wasata/view/departments/dept_screen.dart';
import 'package:wasata/view/home/home_screen.dart';
import 'package:wasata/view/map/map_screen.dart';
import 'package:wasata/view/more/more_screen.dart';
import 'package:wasata/view/profile/profile_screen.dart';

class LayoutController extends GetxController
{
  int currentIndex = 2;

  void changeCurrentIndex(int index)

  {
    currentIndex = index;
    update();
  }

  List<Widget> screens = [
    MoreScreen(),
    DepartmentScreen(),
    HomeScreen(),
    MapScreen(),
    ProfileScreen(),
  ];
}