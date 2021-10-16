import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasata/controller/on_boarding_controller.dart';
import 'package:wasata/model/on_boarding_model.dart';
import 'package:wasata/view/components.dart';
import 'package:wasata/view/constant.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              leadingWidth: 80.0,
              leading: TextButton(
                  onPressed: () {
                    controller.submitOnboarding();
                  },
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: 'IBMPlex'),
                  )),
            ),
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildBoardItem(controller.boarding[index], context),
                      itemCount: controller.boarding.length,
                      controller: controller.boardingController,
                      onPageChanged: (index) {
                        print(index);
                        if (index == controller.boarding.length - 1) {
                          controller.makeLastPage();
                        }
                      }),
                ),
                SmoothPageIndicator(
                  controller: controller.boardingController,
                  count: controller.boarding.length,
                  effect: ScrollingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: secondaryColor,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                Spacer(),
                if (controller.lastPage)
                  DefaultButton(
                      text: 'ابدأ الآن',
                      width: MediaQuery.of(context).size.width / 1.3,
                      function: () {
                        controller.submitOnboarding();
                      }),
                Spacer(),
              ],
            )));
  }
}

Widget buildBoardItem(OnBoardingModel model, context) => Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50.0),
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0,
                color: secondaryColor,
                fontFamily: 'IBMPlex',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Container(child: SvgPicture.asset(model.image)),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            child: Text(
              model.body,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontFamily: 'IBMPlex',
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
