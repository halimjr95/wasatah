import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasata/controller/auth_controller.dart';
import 'package:wasata/view/auth/login_screen.dart';
import 'package:wasata/view/components.dart';
import 'package:wasata/view/constant.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'تسجيل حساب جديد',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'IBMPlex',
                color: secondaryColor,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: secondaryColor,
                  size: 35.0,
                )),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 60),
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Color.fromRGBO(51, 214, 215, 0.2),
                  child: Icon(Icons.check_outlined, color: primaryColor, size: 80.0,),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    'تم تسجيل حسابكم بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: secondaryColor,
                      fontFamily: 'IBMPlex',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Text(
                    'يمكنك الآن تسجيل الدخول إلى حسابكم والبدء بإستخدام خدمات وساطة عقارية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: secondaryColor,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: DefaultButton(
                      text: 'تسجيل دخول',
                      function: () {
                        controller.rememberMe();
                        Get.to(() => LoginScreen());
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
