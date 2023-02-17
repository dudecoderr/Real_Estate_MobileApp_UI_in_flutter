import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:real_estate_flutterui/constant/color_constant.dart';
import 'package:real_estate_flutterui/constant/string_constant.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(indicator,
              style: TextStyle(
                fontSize: 25.sp,
                fontFamily: "Mulish",
                fontWeight: FontWeight.w700,
              )),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                height: 76.h,
                width: 155.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          education,
                          style: TextStyle(color: kGreyColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                        Text(
                          per3,
                          style: TextStyle(color: kBlackColor, fontFamily: "Mulish", fontSize: 21.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 25.0,
                          lineWidth: 5.0,
                          animation: true,
                          backgroundColor: Colors.indigo.shade200,
                          percent: 0.8,
                          center: const Icon(Icons.call_made),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.indigo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height: 76.h,
                width: 155.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          safety,
                          style: TextStyle(color: kGreyColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                        Text(
                          per4,
                          style: TextStyle(color: kBlackColor, fontFamily: "Mulish", fontSize: 21.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 25.0,
                          lineWidth: 5.0,
                          animation: true,
                          backgroundColor: Colors.orange.shade100,
                          percent: 0.7,
                          center: const Icon(Icons.call_made),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.orange.shade700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                height: 76.h,
                width: 155.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobGrowth,
                          style: TextStyle(color: kGreyColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                        Text(
                          per5,
                          style: TextStyle(color: kBlackColor, fontFamily: "Mulish", fontSize: 21.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 25.0,
                          lineWidth: 5.0,
                          animation: true,
                          backgroundColor: Colors.green.shade100,
                          percent: 0.7,
                          center: const Icon(Icons.call_made),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height: 76.h,
                width: 155.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scPermits,
                          style: TextStyle(color: kGreyColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                        Text(
                          per6,
                          style: TextStyle(color: kBlackColor, fontFamily: "Mulish", fontSize: 21.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 25.0,
                          lineWidth: 5.0,
                          animation: true,
                          backgroundColor: Colors.yellow.shade600,
                          percent: 0.2,
                          center: const Icon(Icons.call_made),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.yellow.shade800,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
