import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_flutterui/constant/color_constant.dart';
import 'package:real_estate_flutterui/constant/image_constant.dart';
import 'package:real_estate_flutterui/constant/string_constant.dart';
import 'package:real_estate_flutterui/screens/home_page/ocean_park_screen.dart';

class ListStock extends StatelessWidget {
  const ListStock({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children:  [
               StockList(
                function: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context,) =>  OceanParkPage(),
                    ),
                  );
                },
                titles: chateauResidences,
                subtitle: oct1,
                desc: price1,
                desc1: per1,
                image: img1,
              ),
              SizedBox(height: 10.h,),
               StockList(
                function: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context,) =>  OceanParkPage(),
                    ),
                  );
                },
                titles: park,
                subtitle: oct2,
                desc: price2,
                desc1: per2,
                image: img2,
              ),
              SizedBox(height: 10.h,),
               StockList(
                function: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context,) =>  OceanParkPage(),
                    ),
                  );
                },
                titles: clubHallandale,
                subtitle: oct3,
                desc: price3,
                desc1: per3,
                image: img3,
              ),
            ],
          );
        },
      ),
    );
  }
}

class StockList extends StatelessWidget {
  final String titles;
  final String subtitle;
  final String? desc;
  final String? desc1;
  final String? image;
  final Function? function;
  const StockList({Key? key, this.function, required this.titles, required this.subtitle, this.desc, this.image, this.desc1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 90.h,
            width: 500.w,
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      image.toString(),
                      height: 40.h,
                      width: 40.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h,left: 20.w ),
                      child: Container(
                        width:160.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(titles,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w700,fontFamily: "Mulish",color: kBlackColor)),
                            Text(subtitle,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,fontFamily: "Mulish",color: kGreyColor)),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 30.h, left: 20.w ),
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,children: [
                            Text(desc.toString(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,fontFamily: "Mulish",color: kBlackColor)),
                            Text(desc1.toString(),style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w700,fontFamily: "Mulish",color: kGreyColor)),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
