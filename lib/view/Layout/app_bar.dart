import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';

Widget customAppBar() => Padding(
  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
  child:   Row(
    children: [
      Container(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            height: 50,
          )),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 8.0, right: 13.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10, 10, 30, 10),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 30.0, color: secondaryColor,),
                ),
              ),
              hintText: 'عن ماذا تبحث؟',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
        ),
      ),
      Container(
        width: 38.0,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: (){},
              icon: Icon(
                Icons.notifications_none_outlined,
                color: secondaryColor,
                size: 38.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 9.0,
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);