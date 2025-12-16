
import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/widget/global_appbar.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
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
        child: Column(
          children: [
            // Tab Container
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: ColorRes.appBorderColor)
              ),
              child: Column(
                children: [
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
                  // Electricity Section
                  GlobalText(
                    str: "Electricity",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.appSecTextColor,
                  ),

                  sizedBoxH(20),

                  // Power Circle
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 18,
                            backgroundColor: ColorRes.grey.withValues(alpha: 0.15),
                            valueColor: AlwaysStoppedAnimation<Color>(ColorRes.appColor),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GlobalText(
                              str: "Total Power",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.textSecondary,
                            ),
                            sizedBoxH(6),
                            GlobalText(
                              str: "$totalPower kw",
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: ColorRes.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  sizedBoxH(24),

                  // Source/Load Toggle
                  Row(
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

                  sizedBoxH(20),

                  // Data View Card
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

                  // Data Type 2 Card
                  _buildDataCard(
                    icon: Images.solarIcon,
                    title: "Data Type 2",
                    badge: "Active",
                    badgeColor: ColorRes.green,
                    data: [
                      {"label": "Data 1", "value": "55505.63"},
                      {"label": "Data 2", "value": "58805.63"},
                    ],
                  ),

                  sizedBoxH(12),

                  // Data Type 3 Card
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

                  sizedBoxH(20),

                ],
              ),
            ),

            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quick Access Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.2,
                  children: [
                    _buildQuickAccessCard(
                      icon: Images.analysisIcon,
                      title: "Analysis Pro",
                      iconColor: ColorRes.purple,
                    ),
                    _buildQuickAccessCard(
                      icon: Images.generatorIcon,
                      title: "G. Generator",
                      iconColor: ColorRes.orange,
                    ),
                    _buildQuickAccessCard(
                      icon: Images.plantIcon,
                      title: "Plant Summary",
                      iconColor: ColorRes.orange,
                    ),
                    _buildQuickAccessCard(
                      icon: Images.gasIcon,
                      title: "Natural Gas",
                      iconColor: ColorRes.red,
                    ),
                    _buildQuickAccessCard(
                      icon: Images.dGeneratorIcon,
                      title: "D. Generator",
                      iconColor: ColorRes.gold,
                    ),
                    _buildQuickAccessCard(
                      icon: Images.waterProcessIcon,
                      title: "Water Process",
                      iconColor: ColorRes.cyan,
                    ),
                  ],
                ),
              ],
            ),
          ],
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
          color: isSelected ? ColorRes.appColor : ColorRes.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? ColorRes.appColor : ColorRes.grey.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Center(
          child: GlobalText(
            str: text,
            fontSize: 14,
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
      padding: const EdgeInsets.all(14),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: ColorRes.appColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: GlobalImageLoader(
                    imagePath: icon,
                    height: 20,
                    width: 20,
                    color: ColorRes.appColor,
                  ),
                ),
              ),
              sizedBoxW(10),
              Expanded(
                child: GlobalText(
                  str: title,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: GlobalText(
                  str: badge,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: badgeColor,
                ),
              ),
              sizedBoxW(8),
              Icon(
                Icons.chevron_right,
                color: ColorRes.textTertiary,
                size: 22,
              ),
            ],
          ),
          sizedBoxH(14),
          ...data.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalText(
                  str: item["label"]!,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorRes.textSecondary,
                ),
                GlobalText(
                  str: ": ${item["value"]!}",
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.black,
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard({
    required String icon,
    required String title,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorRes.grey.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: GlobalImageLoader(
                imagePath: icon,
                height: 20,
                width: 20,
                color: iconColor,
              ),
            ),
          ),
          sizedBoxW(10),
          Expanded(
            child: GlobalText(
              str: title,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: ColorRes.black,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}