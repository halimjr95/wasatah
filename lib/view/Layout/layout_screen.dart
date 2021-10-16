import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasata/controller/layout_controller.dart';
import 'package:wasata/view/constant.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller) => Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Container(
                height: 65.0,
                width: 65.0,
                child: FloatingActionButton(
                  backgroundColor: primaryColor,
                  onPressed: () {
                    controller.changeCurrentIndex(2);
                  },
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  // elevation: 5.0,
                ),
              ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            shape: CircularNotchedRectangle(),
            notchMargin: 5.0,
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: Colors.transparent,
              height: 75.0,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  controller.changeCurrentIndex(index);
                },
                currentIndex: controller.currentIndex,
                iconSize: 30.0,
                selectedItemColor: primaryColor,
                unselectedItemColor: secondaryColor,
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'IBMPlex',
                ),
                selectedLabelStyle: TextStyle(
                  fontFamily: 'IBMPlex',
                ),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.more_horiz_rounded,
                      ),
                      label: 'الـمـزيد'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.grid_view,
                      ),
                      label: 'الأقسام'
                  ),
                  BottomNavigationBarItem(
                      icon: Text(''),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.map_outlined,
                      ),
                      label: 'مجاور لك'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person_outline_outlined,
                      ),
                      label: 'حسابي'
                  ),
                ],
              ),
            ),
          ),
              body: controller.screens[controller.currentIndex],
            ));
  }
}
