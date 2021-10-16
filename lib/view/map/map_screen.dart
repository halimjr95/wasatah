import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasata/controller/map_controller.dart';
import 'package:wasata/model/map_model.dart';
import 'package:wasata/view/Layout/app_bar.dart';
import 'package:wasata/view/components.dart';
import 'package:wasata/view/constant.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
        builder: (controller) => Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: customAppBar(),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        buildGoogleMap(context, controller),
                        buildContainer(controller),
                        currentLocation(controller),
                        filterLocation(controller, context),
                      ],
                    ),
                  ),
                ],
              )),
            ));
  }
}

Widget buildGoogleMap(BuildContext context, MapController mycontroller) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition:
          CameraPosition(target: LatLng(24.637031, 46.712251), zoom: 9),
      onMapCreated: (GoogleMapController controller) {
        mycontroller.mapController = controller;
        print('successssssssssssssssss');
      },
      markers: mycontroller.markers,
    ),
  );
}

Widget buildContainer(MapController controller) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
        margin: EdgeInsets.symmetric(vertical: 40.0),
        height: 120.0,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                buildbox(controller.locations[index], controller),
            separatorBuilder: (context, index) => SizedBox(
                  width: 5.0,
                ),
            itemCount: controller.locations.length)),
  );
}

Widget currentLocation(MapController controller) {
  return Align(
    alignment: Alignment.topRight,
    child: Container(
      height: 80,
      width: 80,
      child: IconButton(
          icon: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.my_location_outlined,
                color: secondaryColor,
                size: 30.0,
              )),
          onPressed: () {
            controller.getCurrentPosition();
          }),
    ),
  );
}

Widget filterLocation(MapController controller, context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      height: 80,
      width: 80,
      child: IconButton(
          icon: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.filter_alt_outlined,
                color: secondaryColor,
                size: 30.0,
              )),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => buildSheet(context),
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))));
          }),
    ),
  );
}

Widget buildbox(MapModel model, MapController controller) => InkWell(
      onTap: () {
        controller.gotoLocation(model.lat, model.long);
      },
      child: Container(
        width: 380.0,
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 120.0,
                    width: 120.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image(
                      image: AssetImage(model.image),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 230.0,
                      height: 50.0,
                      child: Text(
                        model.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1.4,
                            fontSize: 14.0,
                            fontFamily: 'IBMPlex',
                            color: secondaryColor),
                      ),
                    ),
                    Spacer(),
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
        ),
      ),
    );

Widget buildSheet(context) => GetBuilder<MapController>(
  builder: (controller) =>Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      height: 600.0,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'فلترة البحث',
                style: TextStyle(
                  fontFamily: 'IBMPlex',
                  fontSize: 20.0,
                  color: secondaryColor,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: primaryColor,
                    size: 40.0,
                  ),
                  onPressed: () {
                    controller.checkBoxesReset();
                  }),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Divider(
            thickness: 1.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text('حسب القسم',style: TextStyle(
                        fontFamily: 'IBMPlex',
                        fontSize: 16.0,
                      ),),
                      // collapsedIconColor: primaryColor,
                      collapsedTextColor: secondaryColor,
                      iconColor: primaryColor,
                      textColor: primaryColor,
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox1 = value;
                                  controller.update();
                                  print(value);
                                },
                                value: controller.checkBox1,
                              ),
                              Text(
                                'شقق للبيع',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox2 = value;
                                  controller.update();
                                  print(value);
                                },
                                value: controller.checkBox2,
                              ),
                              Text(
                                'شقق للإيجار',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox3 = value;
                                  controller.update();
                                  print(value);
                                },
                                value: controller.checkBox3,
                              ),
                              Text(
                                'فلل للبيع',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox4 = value;
                                  controller.update();
                                },
                                value: controller.checkBox4,
                              ),
                              Text(
                                'فلل للإيجار',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox5 = value;
                                  controller.update();
                                  print(value);
                                },
                                value: controller.checkBox5,
                              ),
                              Text(
                                'أرض للبيع',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text('حسب السعر',style: TextStyle(
                        fontFamily: 'IBMPlex',
                        fontSize: 16.0,
                      ),),
                      // collapsedIconColor: primaryColor,
                      collapsedTextColor: secondaryColor,
                      iconColor: primaryColor,
                      textColor: primaryColor,
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox6 = value;
                                  controller.update();
                                },
                                value: controller.checkBox6,
                              ),
                              Text(
                                '100000 - 200000',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox7 = value;
                                  controller.update();
                                },
                                value: controller.checkBox7,
                              ),
                              Text(
                                '300000 - 400000',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox8 = value;
                                  controller.update();
                                  print(value);
                                },
                                value: controller.checkBox8,
                              ),
                              Text(
                                '500000 - 600000',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text('حسب',style: TextStyle(
                        fontFamily: 'IBMPlex',
                        fontSize: 16.0,
                      ),),
                      // collapsedIconColor: primaryColor,
                      collapsedTextColor: secondaryColor,
                      iconColor: primaryColor,
                      textColor: primaryColor,
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox9 = value;
                                  controller.update();
                                },
                                value: controller.checkBox9,
                              ),
                              Text(
                                '11111',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                fillColor:
                                MaterialStateProperty.all(Colors.grey[400]),
                                onChanged: (value) {
                                  controller.checkBox10 = value;
                                  controller.update();
                                  print(value);
                                },
                                value: controller.checkBox10,
                              ),
                              Text(
                                '222222',
                                style: TextStyle(
                                    color: secondaryColor, fontFamily: 'IBMPlex'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DefaultButton(
            text: "تم",
            color: primaryColor,
            function: () {
              Get.back();
            },
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    ),
  ),
);




