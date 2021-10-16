import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasata/controller/auth_controller.dart';
import 'package:wasata/view/auth/success_screen.dart';
import 'package:wasata/view/components.dart';
import 'package:wasata/view/constant.dart';

class RegisterScreen extends StatelessWidget {
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
            margin: const EdgeInsets.only(top: 5.0),
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(child: SvgPicture.asset('assets/images/logo.svg')),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultTextFormField(
                        type: TextInputType.name,
                        // controller: controller.loginName,
                        validate: (value) {},
                        hintText: 'اسم المستخدم',
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultTextFormField(
                        type: TextInputType.emailAddress,
                        // controller: controller.loginName,
                        validate: (value) {},
                        hintText: 'البريد الالكتروني "أختياري"',
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultTextFormField(
                        type: TextInputType.phone,
                        // controller: controller.loginName,
                        validate: (value) {},
                        hintText: 'رقم الجوال',
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, left: 20.0, right: 50.0),
                      child: Row(
                        children: [
                          Text('السجل التجاري'),
                          Spacer(),
                          MaterialButton(
                            onPressed: () {
                              controller.getImage();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.grey,
                            // minWidth: MediaQuery.of(context).size.width / 4,
                            height: 40.0,
                            child: Text(
                              'ارفاق صورة',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                        ),
                        hintText: ' المدينة',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                      onChanged: (dynamic value) {
                        controller.changeCityValue(value);
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text('القاهرة'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('المنصورة'),
                          value: 2,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                        ),
                        hintText: ' نوع المستخدم  ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                      onChanged: (dynamic value) {
                        controller.changeUserTypeValue(value);
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text('test1'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('test2'),
                          value: 2,
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultTextFormField(
                          type: TextInputType.visiblePassword,
                          controller: controller.registerPassword,
                          validate: (value) {},
                          suffix: controller.suffix,
                          hintText: 'كلمة المرور',
                          isPassword: controller.isPassword,
                          suffixPressed: controller.changePasswordVisibility)),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultTextFormField(
                          type: TextInputType.visiblePassword,
                          controller: controller.confirmRegisterPassword,
                          validate: (value) {},
                          suffix: controller.suffix,
                          hintText: 'تأكيد كلمة المرور',
                          isPassword: controller.isPassword,
                          suffixPressed: controller.changePasswordVisibility)),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DefaultButton(
                        text: 'تسجيل',
                        function: () {
                          Get.to(() => SuccessScreen());
                        },
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      children: [
                        Text(
                          'تسجيلك لدينا يعني موافقتك على',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 0,
                            fontSize: 14.0,
                            fontFamily: 'IBMPlex',
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'شروط الإستخدام وسياسة الخصوصية',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 0,
                                fontSize: 14.0,
                                fontFamily: 'IBMPlex',
                                color: primaryColor
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
