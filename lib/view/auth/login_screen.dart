import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasata/controller/auth_controller.dart';
import 'package:wasata/view/Layout/layout_screen.dart';
import 'package:wasata/view/auth/register_screen.dart';
import 'package:wasata/view/components.dart';
import 'package:wasata/view/constant.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         Get.back();
              //       },
              //       icon: Icon(
              //         Icons.arrow_forward_outlined,
              //         color: secondaryColor,
              //         size: 35.0,
              //       )),
              // ],
              ),
          body: Container(
            margin: const EdgeInsets.only(top: 30.0),
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(child: SvgPicture.asset('assets/images/logo.svg')),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      'تسجيل دخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IBMPlex',
                          color: secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultTextFormField(
                        type: TextInputType.name,
                        controller: controller.loginName,
                        validate: (value) {},
                        prefix: Icons.account_circle_rounded,
                        hintText: 'اسم المستخدم ',
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultTextFormField(
                          type: TextInputType.visiblePassword,
                          controller: controller.loginPassword,
                          validate: (value) {},
                          prefix: Icons.lock,
                          suffix: controller.suffix,
                          hintText: 'كلمة المرور',
                          isPassword: controller.isPassword,
                          suffixPressed: controller.changePasswordVisibility)),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          fillColor:
                              MaterialStateProperty.all(Colors.grey[400]),
                          onChanged: (value) {
                            controller.changeCheckboxValue(value);
                          },
                          value: controller.chekBox,
                        ),
                        Text(
                          'تذكرني',
                          style: TextStyle(
                              color: secondaryColor, fontFamily: 'IBMPlex'),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'هل نسيت كلمة المرور؟',
                              style: TextStyle(
                                  color: secondaryColor, fontFamily: 'IBMPlex'),
                            )),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultButton(
                        text: 'دخول',
                        function: () {
                          controller.rememberMe();
                          Get.to(() => LayoutScreen());
                        },
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultButton(
                        color: secondaryColor,
                        text: 'تسجيل جديد',
                        function: () {
                          Get.to(() => RegisterScreen());
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
