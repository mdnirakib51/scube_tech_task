import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  // Sample data
  double totalPower = 5.53;
  String selectedSource = 'Source';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorRes.white150,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorRes.black),
          onPressed: () => Get.back(),
        ),
        title: GlobalText(
          str: "SCM",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ColorRes.black,
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: ColorRes.black),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: ColorRes.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: ColorRes.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: ColorRes.appColor,
              indicatorWeight: 3,
              labelColor: ColorRes.white,
              unselectedLabelColor: ColorRes.textSecondary,
              indicator: BoxDecoration(
                color: ColorRes.appColor,
                borderRadius: BorderRadius.circular(8),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(text: "Summary"),
                Tab(text: "SLD"),
                Tab(text: "Data"),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Electricity Section
                  GlobalText(
                    str: "Electricity",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.textSecondary,
                  ),

                  sizedBoxH(16),

                  // Power Circle
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 160,
                          child: CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 20,
                            backgroundColor: ColorRes.grey.withValues(alpha: 0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(ColorRes.appColor),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GlobalText(
                              str: "Total Power",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorRes.textSecondary,
                            ),
                            sizedBoxH(4),
                            GlobalText(
                              str: "$totalPower kw",
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: ColorRes.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  sizedBoxH(20),

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
                    icon: Images.electricityIcon, // Replace with your icon
                    title: "Data View",
                    badge: "ACTIVE",
                    badgeColor: ColorRes.green,
                    data: [
                      {"label": "Data 1", "value": "55505.63"},
                      {"label": "Data 2", "value": "58805.63"},
                    ],
                  ),

                  sizedBoxH(12),

                  // Data Type 2 Card
                  _buildDataCard(
                    icon: Images.solarIcon, // Replace with your icon
                    title: "Data Type 2",
                    badge: "Active",
                    badgeColor: ColorRes.greenAccent,
                    data: [
                      {"label": "Data 1", "value": "55505.63"},
                      {"label": "Data 2", "value": "58805.63"},
                    ],
                  ),

                  sizedBoxH(12),

                  // Data Type 3 Card
                  _buildDataCard(
                    icon: Images.waterIcon, // Replace with your icon
                    title: "Data Type 3",
                    badge: "Inactive",
                    badgeColor: ColorRes.red,
                    data: [
                      {"label": "Data 1", "value": "55505.63"},
                      {"label": "Data 2", "value": "58805.63"},
                    ],
                  ),

                  sizedBoxH(20),

                  // Quick Access Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
            ),
          ),
        ],
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
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? ColorRes.appColor : ColorRes.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? ColorRes.appColor : ColorRes.grey.withValues(alpha: 0.3),
            width: 1,
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
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorRes.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: ColorRes.appColor.withValues(alpha: 0.1),
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
              sizedBoxW(8),
              Expanded(
                child: GlobalText(
                  str: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.black,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GlobalText(
                  str: badge,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: badgeColor,
                ),
              ),
              sizedBoxW(8),
              Icon(
                Icons.chevron_right,
                color: ColorRes.textTertiary,
                size: 20,
              ),
            ],
          ),
          sizedBoxH(12),
          ...data.map((item) => Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalText(
                  str: item["label"]!,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorRes.textSecondary,
                ),
                GlobalText(
                  str: item["value"]!,
                  fontSize: 12,
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
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorRes.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
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
              fontSize: 12,
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