
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
            progress: 0.75,
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

          selectedSubTabIndex == 0 ? ScmTodayDaaTab() : ScmCustomDateDataTab()

          // IndexedStack(
          //   index: selectedSubTabIndex,
          //   children: [
          //     ScmTodayDaaTab(),
          //     ScmCustomDateDataTab(),
          //   ],
          // ),


        ],
      ),
    );
  }
}
