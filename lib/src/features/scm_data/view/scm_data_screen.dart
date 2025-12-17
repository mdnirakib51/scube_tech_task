
import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/widget/global_appbar.dart';
import 'package:scube_technologies_task/src/global/widget/global_sized_box.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_text.dart';
import 'tab/data_view_tab.dart';
import 'tab/revenue_view_tab.dart';

class ScmDataScreen extends StatefulWidget {
  const ScmDataScreen({super.key});

  @override
  State<ScmDataScreen> createState() => _ScmDataScreenState();
}

class _ScmDataScreenState extends State<ScmDataScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedTabIndex = 0;
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
      body: Stack(
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
            child: selectedTabIndex == 0 ? DataViewTab() : RevenueViewTab(),
          ),

          // Top Radio Buttons (Data View / Revenue View)
          Container(
            margin: EdgeInsets.only(top: 10, left: 25, right: 25),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
                          // Custom Radio Button
                          Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedTabIndex == 0
                                    ? ColorRes.appColor
                                    : ColorRes.grey,
                                width: 1,
                              ),
                            ),
                            child: selectedTabIndex == 0
                                ? Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorRes.appColor,
                                ),
                              ),
                            )
                                : null,
                          ),

                          sizedBoxW(6),
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
                          Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedTabIndex == 1
                                      ? ColorRes.appColor
                                      : ColorRes.grey,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedTabIndex == 1
                                        ? ColorRes.appColor : ColorRes.grey,
                                  ),
                                ),
                              )
                          ),

                          sizedBoxW(6),
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
    );
  }
}