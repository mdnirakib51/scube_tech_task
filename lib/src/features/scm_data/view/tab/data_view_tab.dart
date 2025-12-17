import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../widget/semi_circular_progress_painter_widget.dart';
import 'scm_custom_date_data_tab.dart';
import 'scm_today_daa_tab.dart';

class DataViewTab extends StatefulWidget {
  const DataViewTab({super.key});

  @override
  State<DataViewTab> createState() => _DataViewTabState();
}

class _DataViewTabState extends State<DataViewTab> {
  int selectedSubTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedBoxH(80),
          SemiCircularProgressPainterWidget(
            title: "55.00",
            subTitle: "kWh/Sqft",
            progress: 0.55,
          ),
          sizedBoxH(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Today Data Custom Radio Button
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
                          // Custom Radio Button
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedSubTabIndex == 0
                                    ? ColorRes.appColor
                                    : ColorRes.grey,
                                width: 1,
                              ),
                            ),
                            child: selectedSubTabIndex == 0
                                ? Center(
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorRes.appColor,
                                ),
                              ),
                            )
                                : null,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: GlobalText(
                              str: "Today Data",
                              fontWeight: FontWeight.w600,
                              color: selectedSubTabIndex == 0
                                  ? ColorRes.appColor
                                  : ColorRes.grey,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Custom Date Data Custom Radio Button
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
                          // Custom Radio Button
                          Container(
                              width: 12,
                              height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedSubTabIndex == 1
                                    ? ColorRes.appColor
                                    : ColorRes.grey,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedSubTabIndex == 1
                                      ? ColorRes.appColor : ColorRes.grey,
                                ),
                              ),
                            )
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: GlobalText(
                              str: "Custom Date Data",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: selectedSubTabIndex == 1
                                  ? ColorRes.appColor
                                  : ColorRes.grey,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          sizedBoxH(20),
          selectedSubTabIndex == 0 ? ScmTodayDaaTab() : ScmCustomDateDataTab()
        ],
      ),
    );
  }
}