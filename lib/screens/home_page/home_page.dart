import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:real_estate_flutterui/constant/color_constant.dart';
import 'package:real_estate_flutterui/constant/list_constant.dart';
import 'package:real_estate_flutterui/constant/string_constant.dart';
import '../../constant/image_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int timeIndexSelected = 1;

  final List<String> time = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUNE',
    'JULY',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  var _currentIndex = 0;
  void OnTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [kDarkGreenColor, kGreenColor, kWhiteColor, kWhiteColor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 45.h, right: 30.w, left: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r), image: const DecorationImage(image: AssetImage(profile), fit: BoxFit.fill)),
                    ),
                    Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(Icons.search, color: kGreyColor, size: 25.h),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.w, left: 30.w),
                child: Row(children: [
                  Text(
                    week1,
                    style: TextStyle(color: kWhiteColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 30.sp),
                  ),
                  Text(
                    week,
                    style: TextStyle(color: kWhiteColor, fontFamily: "Mulish", fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ]),
              ),
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 2),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: MediaQuery.of(context).size.width / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 250.h,
                            child: LineChart(
                              mainData(),
                            ),
                          ),
                          Positioned(
                            top: 240,
                            child: SizedBox(
                              height: 35.h,
                              width: 500,
                              child: ListView.builder(
                                itemCount: 12,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        timeIndexSelected = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9.w, right: 9.w),
                                      child: Container(
                                        height: 35.h,
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12.sp),
                                            border: Border.all(color: index == timeIndexSelected ? Colors.white : Colors.white),
                                            color: timeIndexSelected == index ? kBlackColor : Colors.transparent),
                                        child: Center(
                                            child: Text(time[index],
                                                style: TextStyle(
                                                    color: index == timeIndexSelected ? kWhiteColor : kBlackColor,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500))),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 3),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: MediaQuery.of(context).size.width / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      Stack(
                        children: [
                          AnimationLimiter(
                            child: Column(
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(seconds: 2),
                                childAnimationBuilder: (widget) => SlideAnimation(
                                  verticalOffset: MediaQuery.of(context).size.width / 2,
                                  child: FadeInAnimation(child: widget),
                                ),
                                children: [
                                  Container(
                                      height: 310.h,
                                      width: 500.w,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 20.w),
                                              child: Text(
                                                district,
                                                style: TextStyle(
                                                  fontFamily: "Mulish",
                                                  color: kBlackColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25.sp,
                                                ),
                                              ),
                                            ),
                                            AnimationLimiter(
                                              child: Column(
                                                children: AnimationConfiguration.toStaggeredList(
                                                  duration: const Duration(seconds: 1),
                                                  childAnimationBuilder: (widget) => SlideAnimation(
                                                    verticalOffset: MediaQuery.of(context).size.width / 2,
                                                    child: FadeInAnimation(child: widget),
                                                  ),
                                                  children: [
                                                    const ListStock(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: EdgeInsets.only(right:10.w, left: 10.w, top: 220.h),
                              child: Container(
                                  height: 65.h,
                                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                  decoration: BoxDecoration(color: kGreyBlueColor, borderRadius: BorderRadius.circular(20.r)),
                                  child: const GNav(
                                      tabBorderRadius: 15, // tab button border// tab button border
                                      curve: Curves.easeOutExpo, // tab animation curves
                                      duration: Duration(milliseconds: 900), // tab animation duration
                                      gap: 8, // the tab button gap between icon and text
                                      activeColor: kBlackColor, // selected icon and text color
                                      iconSize: 24, // ta button icon size
                                      tabBackgroundColor: kGreenColor,
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      tabs: [
                                        GButton(
                                          icon: Icons.bar_chart,
                                          text: 'Market',
                                          textStyle: TextStyle(  fontSize: 18,
                                            fontFamily: "Mulish",
                                            fontWeight: FontWeight.w800,
                                          ),
                                          iconColor: kWhiteColor,
                                        ),
                                        GButton(
                                          icon: Icons.chat,
                                          iconColor: kWhiteColor,
                                          textStyle: TextStyle(  fontSize: 18,
                                            fontFamily: "Mulish",
                                            fontWeight: FontWeight.w800,
                                          ),
                                          text: 'Chats',
                                        ),
                                        GButton(
                                          icon: Icons.favorite_border_outlined,
                                          text: 'Likes',
                                          iconColor: kWhiteColor,
                                          textStyle: TextStyle(
                                            fontFamily: "Mulish",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        GButton(
                                          icon: Icons.person,
                                          iconColor: kWhiteColor,
                                          textStyle: TextStyle(
                                            fontFamily: "Mulish",fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                          text: 'Profile',
                                        )
                                      ])),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }

  List<Color> gradientColors = [kWhiteColor, kDarkGreenColor, kGreyBlueColor];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('FEB', style: style);
        break;
      case 4:
        text = const Text('MAR', style: style);
        break;
      case 6:
        text = const Text('APR', style: style);
        break;
      case 8:
        text = const Text('MAY', style: style);
        break;
      case 10:
        text = const Text('JUN', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: kGreenColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: kWhiteColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 150,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: kWhiteColor),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          show: true,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,

            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.10)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
