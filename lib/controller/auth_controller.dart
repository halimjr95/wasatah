
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController
{
  TextEditingController loginName = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  TextEditingController registerPassword = TextEditingController();
  TextEditingController confirmRegisterPassword = TextEditingController();




  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    isPassword ? suffix = Icons.visibility_outlined : suffix = Icons.visibility_off_outlined;
    update();
  }



  bool? chekBox = false;
  void changeCheckboxValue(bool? value)
  {
    chekBox = value;
    update();
  }

  XFile? image;
  ImagePicker picker = ImagePicker();

  void getImage() async
  {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);
  }

  dynamic userType;
  void changeUserTypeValue(dynamic value)
  {
    userType = value;
    print(value);
    update();
  }

  dynamic city;
  void changeCityValue(dynamic value)
  {
    city = value;
    print(value);
    update();
  }


  void rememberMe()
  {
    GetStorage().write('rememberMe', chekBox);
  }

}