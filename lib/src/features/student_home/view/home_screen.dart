import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/src/global/widget/global_appbar.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../../student_quick_access/view/student_quick_access_screen.dart';
import '../../../global/widget/custom_interactive_scrollbar_widget.dart';
import 'widget/triple_tab_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedTabIndex = 0;
  double totalPower = 5.53;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Tab Container with white background
              Container(
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(12),
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
                    // Triple Tab
                    TripleTabContainer(
                      currentIndex: selectedTabIndex,
                      firstText: "Summary",
                      secondText: "SLD",
                      thirdText: "Data",
                      onChange: (index) {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                    ),

                    sizedBoxH(10),

                    // Electricity Label
                    GlobalText(
                      str: "Electricity",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.appSecTextColor,
                    ),

                    sizedBoxH(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(height: 1, color: ColorRes.appSecTextColor),
                    ),
                    sizedBoxH(30),

                    // Power Circle
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 25,
                            backgroundColor: ColorRes.grey.withValues(alpha: 0.15),
                            valueColor: AlwaysStoppedAnimation<Color>(ColorRes.appCircleColor),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GlobalText(
                              str: "Total Power",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorRes.appThiTextColor,
                            ),
                            GlobalText(
                              str: "$totalPower kw",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.black,
                            ),
                          ],
                        ),
                      ],
                    ),

                    sizedBoxH(20),

                    // Source/Load Toggle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.appTabBackColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildToggleButton(
                                text: "Source",
                                isSelected: selectedSource == 'Source',
                                onTap: () {
                                  setState(() {
                                    selectedSource = 'Source';
                                  });
                                },
                              ),
                            ),
                            sizedBoxW(12),
                            Expanded(
                              child: _buildToggleButton(
                                text: "Load",
                                isSelected: selectedSource == 'Load',
                                onTap: () {
                                  setState(() {
                                    selectedSource = 'Load';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    sizedBoxH(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(height: 1, color: ColorRes.appSecTextColor),
                    ),
                    sizedBoxH(10),

                    // Data Cards - FIXED: Wrapped in SizedBox with fixed height
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 300, // Fixed height to prevent layout issues
                          child: CustomScrollbarList(
                            children: [
                              _buildDataCard(
                                icon: Images.electricityIcon,
                                title: "Data View",
                                badge: "Active",
                                badgeColor: ColorRes.appColor,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),
                              sizedBoxH(12),
                              _buildDataCard(
                                icon: Images.solarIcon,
                                title: "Data Ismail",
                                badge: "Active",
                                badgeColor: ColorRes.green,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),
                              sizedBoxH(12),
                              _buildDataCard(
                                icon: Images.waterIcon,
                                title: "Data Type 3",
                                badge: "Inactive",
                                badgeColor: ColorRes.red,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),

                              sizedBoxH(12),
                              _buildDataCard(
                                icon: Images.waterIcon,
                                title: "Data Type 3",
                                badge: "Inactive",
                                badgeColor: ColorRes.red,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),

                              sizedBoxH(12),
                              _buildDataCard(
                                icon: Images.waterIcon,
                                title: "Data Type 3",
                                badge: "Inactive",
                                badgeColor: ColorRes.red,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),

                              sizedBoxH(12),
                              _buildDataCard(
                                icon: Images.waterIcon,
                                title: "Data Type 3",
                                badge: "Inactive",
                                badgeColor: ColorRes.red,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),

                              sizedBoxH(12),
                              _buildDataCard(
                                icon: Images.waterIcon,
                                title: "Data Type 3",
                                badge: "Inactive",
                                badgeColor: ColorRes.red,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),

                              sizedBoxH(12),
                              _buildDataCard(
                                icon: Images.waterIcon,
                                title: "Data Type 3",
                                badge: "Inactive",
                                badgeColor: ColorRes.red,
                                data: [
                                  {"label": "Data 1", "value": "55505.63"},
                                  {"label": "Data 2", "value": "58805.63"},
                                ],
                              ),
                            ],
                          ),
                        )
                    ),

                    sizedBoxH(20),
                  ],
                ),
              ),

              sizedBoxH(16),

              // Quick Access Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3.2,
                children: [
                  _buildQuickAccessCard(
                    icon: Images.analysisIcon,
                    title: "Analysis Pro",
                  ),
                  _buildQuickAccessCard(
                    icon: Images.generatorIcon,
                    title: "G. Generator",
                  ),
                  _buildQuickAccessCard(
                    icon: Images.plantIcon,
                    title: "Plant Summary",
                  ),
                  _buildQuickAccessCard(
                    icon: Images.gasIcon,
                    title: "Natural Gas",
                  ),
                  _buildQuickAccessCard(
                    icon: Images.dGeneratorIcon,
                    title: "D. Generator",
                  ),
                  _buildQuickAccessCard(
                    icon: Images.waterProcessIcon,
                    title: "Water Process",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? ColorRes.appColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: GlobalText(
            str: text,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? ColorRes.white : ColorRes.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildDataCard({
    required String icon,
    required String title,
    required String badge,
    required Color badgeColor,
    required List<Map<String, String>> data,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorRes.appDataBackColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: ColorRes.appDataBorderColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Center(
                child: GlobalImageLoader(
                  imagePath: icon,
                  height: 24,
                  width: 24,
                ),
              ),

              sizedBoxW(10),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            color: ColorRes.appColor,
                          ),

                          sizedBoxW(4),
                          GlobalText(
                            str: title,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.appThiTextColor,
                          ),

                          sizedBoxW(8),
                          GlobalText(
                            str: "($badge)",
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: badgeColor,
                          ),
                        ],
                      ),

                      sizedBoxH(5),
                      ...data.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Row(
                          children: [
                            GlobalText(
                              str: "${item["label"]!}  : ",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.appFourTextColor,
                            ),
                            GlobalText(
                              str: item["value"]!,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black,
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),

              Icon(
                Icons.chevron_right,
                color: ColorRes.textTertiary,
                size: 20,
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildQuickAccessCard({
    required String icon,
    required String title,
  }) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> StudentQuickAccessScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorRes.appBorderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: ColorRes.grey.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Center(
              child: GlobalImageLoader(
                imagePath: icon,
                height: 24,
                width: 24 ,
              ),
            ),
            sizedBoxW(8),
            Expanded(
              child: GlobalText(
                str: title,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorRes.black,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}