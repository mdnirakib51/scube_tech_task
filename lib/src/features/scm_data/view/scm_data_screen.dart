import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/widget/global_appbar.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../components/semi_circular_progress_painter.dart';
import 'tab/scm_today_daa_tab.dart';

class ScmDataScreen extends StatefulWidget {
  const ScmDataScreen({super.key});

  @override
  State<ScmDataScreen> createState() => _ScmDataScreenState();
}

class _ScmDataScreenState extends State<ScmDataScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedTabIndex = 0;
  int selectedSubTabIndex = 0;
  String selectedSource = 'Source';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorRes.appBackGroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: GlobalAppBar(
          titleText: "SCM",
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 35),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ColorRes.appDataBorderColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.grey.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [

                  sizedBoxH(80),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CustomPaint(
                          painter: SemiCircularProgressPainter(
                            progress: 0.75,
                            backgroundColor: ColorRes.grey.withValues(alpha: 0.15),
                            progressColor: ColorRes.appCircleColor,
                            strokeWidth: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GlobalText(
                              str: "55.00",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.appThiTextColor,
                            ),
                            GlobalText(
                              str: "kWh/Sqft",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorRes.appThiTextColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  sizedBoxH(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Today Data Radio Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSubTabIndex = 0;
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio<int>(
                                    value: 0,
                                    groupValue: selectedSubTabIndex,
                                    activeColor: ColorRes.appColor,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedSubTabIndex = value!;
                                      });
                                    },
                                  ),
                                  GlobalText(
                                    str: "Today Data",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: selectedSubTabIndex == 0
                                        ? ColorRes.appColor
                                        : ColorRes.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Custom Date Data Radio Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSubTabIndex = 1;
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio<int>(
                                    value: 1,
                                    groupValue: selectedSubTabIndex,
                                    activeColor: ColorRes.appColor,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedSubTabIndex = value!;
                                      });
                                    },
                                  ),
                                  GlobalText(
                                    str: "Custom Date Data",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: selectedSubTabIndex == 1
                                        ? ColorRes.appColor
                                        : ColorRes.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  IndexedStack(
                    index: selectedSubTabIndex,
                    children: [
                      ScmTodayDaaTab()
                    ],
                  ),


                ],
              ),
            ),

            // Top Radio Buttons (Data View / Revenue View)
            Container(
              margin: EdgeInsets.only(top: 10, left: 25, right: 25),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorRes.appDataBorderColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.grey.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Data View Radio Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = 0;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<int>(
                              value: 0,
                              groupValue: selectedTabIndex,
                              activeColor: ColorRes.appColor,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              onChanged: (value) {
                                setState(() {
                                  selectedTabIndex = value!;
                                });
                              },
                            ),
                            GlobalText(
                              str: "Data View",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: selectedTabIndex == 0
                                  ? ColorRes.appColor
                                  : ColorRes.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Revenue View Radio Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = 1;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<int>(
                              value: 1,
                              groupValue: selectedTabIndex,
                              activeColor: ColorRes.appColor,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              onChanged: (value) {
                                setState(() {
                                  selectedTabIndex = value!;
                                });
                              },
                            ),
                            GlobalText(
                              str: "Revenue View",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: selectedTabIndex == 1
                                  ? ColorRes.appColor
                                  : ColorRes.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}