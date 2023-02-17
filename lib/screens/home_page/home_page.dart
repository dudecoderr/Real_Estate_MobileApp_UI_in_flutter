import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_flutterui/constant/color_constant.dart';
import 'package:real_estate_flutterui/constant/list_constant.dart';
import 'package:real_estate_flutterui/constant/string_constant.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../constant/image_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
          child: Container(
            decoration: BoxDecoration(color: kGreyBlueColor, borderRadius: BorderRadius.circular(20.r)),
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: SalomonBottomBar(
                currentIndex: _currentIndex,
                onTap: (i) => setState(() => _currentIndex = i),
                items: [
                  /// Home
                  SalomonBottomBarItem(
                      icon: Icon(Icons.home),
                      title: Text(
                        "Home",
                      ),
                      selectedColor: kGreenColor,
                      unselectedColor: kWhiteColor),

                  /// Likes
                  SalomonBottomBarItem(
                      icon: Icon(Icons.chat_bubble_outline_rounded), title: Text("Likes"), selectedColor: Colors.pink, unselectedColor: kWhiteColor),

                  /// Search
                  SalomonBottomBarItem(
                      icon: Icon(Icons.favorite_border_outlined), title: Text("Search"), selectedColor: Colors.orange, unselectedColor: kWhiteColor),

                  /// Profile
                  SalomonBottomBarItem(icon: Icon(Icons.person), title: Text("Profile"), selectedColor: Colors.teal, unselectedColor: kWhiteColor),
                ],
              ),
            ),
          ),
        ),
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
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.w, left: 30.w),
                child: Row(children: [
                  Text(
                    week1,
                    style: TextStyle(color: kWhiteColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 30.h),
                  ),
                  Text(
                    week,
                    style: TextStyle(color: kWhiteColor, fontFamily: "Mulish", fontWeight: FontWeight.w600, fontSize: 16.h),
                  ),
                ]),
              ),
              Stack(
                children: [
                  Container(color: Colors.yellow,
                    height: 250.h,
                    width: 700.w,
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                  Positioned(child: Wrap(
                    children: SelectPositionList.map(
                          (hobby) {
                        bool isSelected = false;
                        if (SelectPosition!.contains(hobby)) {
                          isSelected = true;
                        }
                        return GestureDetector(
                          onTap: () {
                            if (!SelectPosition!.contains(hobby)) {
                              if (SelectPosition!.length < 4) {
                                SelectPosition!.add(hobby);
                                setState(() {});
                                print(SelectPosition);
                              }
                            } else {
                              SelectPosition!.removeWhere(
                                      (element) => element == hobby);
                              setState(() {});
                              print(SelectPosition);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.greenAccent.shade100
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              padding: EdgeInsets.all(14),
                              child: Text(
                                hobby,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.sp),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),)
                ],
              ),
              //
            ],),
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
            showTitles:false,
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
