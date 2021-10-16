import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasata/model/ads_model.dart';
import 'package:wasata/model/article_model.dart';

class HomeController extends GetxController {

  List<Widget> adsImages = [
    Image(
      image: AssetImage('assets/images/slider_1.png'),
    ),
  ];

  var deptPageController = PageController();

  List<Widget> depts = [
    Image(
      image: AssetImage('assets/images/dept_1.png'),
    ),
    Image(
      image: AssetImage('assets/images/dept_2.png'),
    ),
    Image(
      image: AssetImage('assets/images/dept_2.png'),
    ),
  ];

  List<AdsModel> ads = [
    AdsModel(
      id: 0,
      image: 'assets/images/ads_1.png',
      title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
      price: '1,500,000 SAR',
      isFavorite: true,
    ),
    AdsModel(
        id: 1,
        image: 'assets/images/ads_2.png',
        title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        isFavorite: false),
    AdsModel(
        id: 2,
        image: 'assets/images/ads_3.png',
        title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        isFavorite: false),
    AdsModel(
        id: 3,
        image: 'assets/images/ads_4.png',
        title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        isFavorite: false),
    AdsModel(
        id: 4,
        image: 'assets/images/ads_5.png',
        title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        isFavorite: true),
    AdsModel(
        id: 5,
        image: 'assets/images/ads_6.png',
        title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        isFavorite: false),
  ];

  List<ArticleModel> articles = [
    ArticleModel(
      id: 0,
      isFavorite: false,
      image: 'assets/images/art_1.png',
      title:
          'لجنة معالجة أخطاء تسجيل الملكية العقارية " ملكية " تستقبل 4056 اعتراضاً خلال عام 2020',
    ),
    ArticleModel(
      id: 1,
      isFavorite: false,
      image: 'assets/images/art_2.png',
      title:
          'لجنة معالجة أخطاء تسجيل الملكية العقارية " ملكية " تستقبل 4056 اعتراضاً خلال عام 2020',
    ),
  ];

  void makeAdsFavorite(int id)
  {
    ads[id].isFavorite = !ads[id].isFavorite;
    update();
  }

  void makeArtFavorite(int id)
  {
    articles[id].isFavorite = !articles[id].isFavorite;
    update();
  }



}
