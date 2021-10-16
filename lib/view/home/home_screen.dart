import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasata/controller/home_controller.dart';
import 'package:wasata/model/ads_model.dart';
import 'package:wasata/model/article_model.dart';
import 'package:wasata/view/Layout/app_bar.dart';

import '../constant.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                  minimum: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      customAppBar(),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: CarouselSlider(
                                  items: controller.adsImages,
                                  options: CarouselOptions(
                                    height: 200.0,
                                    viewportFraction: 1.0,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 4),
                                    autoPlayAnimationDuration:
                                        Duration(seconds: 1),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    scrollDirection: Axis.horizontal,
                                    reverse: false,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20.0, bottom: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'الأقسام',
                                          style: TextStyle(
                                            fontFamily: 'IBMPlex',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: secondaryColor,
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'عرض الكل',
                                              style: TextStyle(
                                                  fontFamily: 'IBMPlex',
                                                  fontSize: 11.0),
                                            ))
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10.0),
                                      height: 130.0,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            controller.depts[index],
                                        itemCount: controller.depts.length,
                                        separatorBuilder:
                                            (context, index) => SizedBox(
                                          width: 10.0,
                                        ),
                                        controller:
                                            controller.deptPageController,
                                      ),
                                    ),
                                    SmoothPageIndicator(
                                      controller:
                                          controller.deptPageController,
                                      count: controller.depts.length,
                                      effect: ScrollingDotsEffect(
                                        dotColor: Colors.grey,
                                        activeDotColor: secondaryColor,
                                        dotHeight: 3,
                                        dotWidth: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        'أحدث الإعلانات',
                                        style: TextStyle(
                                          fontFamily: 'IBMPlex',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                    GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 1.0,
                                              mainAxisSpacing: 1.0,
                                              childAspectRatio: 1 / 1.35),
                                      itemBuilder: (context, index) =>
                                          buildAdsItem(
                                              context, controller.ads[index], controller),
                                      itemCount: controller.ads.length,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'أحدث المقالات',
                                          style: TextStyle(
                                            fontFamily: 'IBMPlex',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: secondaryColor,
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'عرض الكل',
                                              style: TextStyle(
                                                  fontFamily: 'IBMPlex',
                                                  fontSize: 11.0),
                                            ))
                                      ],
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          buildArticleItem(
                                              context, controller.articles[index], controller),
                                      itemCount: controller.articles.length,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 30.0),
                                  child: Text(
                                      'جميع الحقوق محفوظة © وساطة عقارية 2021',
                                    style: TextStyle(
                                        fontFamily: 'IBMPlex',
                                      color: Colors.black54
                                        ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ));
  }
}

Widget buildAdsItem(context, AdsModel model, HomeController controller) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    clipBehavior: Clip.antiAlias,
    elevation: 2.0,
    child: Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(
                  model.image,
                ),
                height: 165.0,
                fit: BoxFit.cover,
              ),
              IconButton(
                iconSize: 40.0,
                onPressed: () {
                  controller.makeAdsFavorite(model.id);
                },
                icon: CircleAvatar(
                  backgroundColor: model.isFavorite? Colors.white : Colors.blue,
                  radius: 30.0,
                  child: Icon(Icons.favorite_border),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      height: 1.4,
                      fontSize: 13.0,
                      fontFamily: 'IBMPlex',
                      color: secondaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    model.price,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'IBMPlex',
                        fontWeight: FontWeight.w600,
                        color: secondaryColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));


Widget buildArticleItem(context, ArticleModel model, HomeController controller) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    clipBehavior: Clip.antiAlias,
    elevation: 2.0,
    child: Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(
                  model.image,
                ),
                height: 165.0,
                fit: BoxFit.cover,
              ),
              IconButton(
                iconSize: 40.0,
                onPressed: () {
                  controller.makeArtFavorite(model.id);
                },
                icon: CircleAvatar(
                  backgroundColor: model.isFavorite? Colors.white : Colors.blue,
                  radius: 30.0,
                  child: Icon(Icons.favorite_border),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      height: 1.6,
                      fontSize: 15.0,
                      fontFamily: 'IBMPlex',
                      color: secondaryColor),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 35.0,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'قراءة الـمـزيد',
                        style: TextStyle(
                            fontFamily: 'IBMPlex',
                            fontSize: 11.0),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    ));

