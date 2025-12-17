
import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/widget/global_appbar.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../../../global/widget/custom_interactive_scrollbar_widget.dart';
import 'widget/data_card_widget.dart';
import 'widget/quick_access_card_widget.dart';
import 'widget/toggle_button_widget.dart';
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

  final List<QuickAccessCardWidget> quickAccessList = [
    QuickAccessCardWidget(icon: Images.analysisIcon, title: "Analysis Pro"),
    QuickAccessCardWidget(icon: Images.generatorIcon, title: "G. Generator"),
    QuickAccessCardWidget(icon: Images.plantIcon, title: "Plant Summary"),
    QuickAccessCardWidget(icon: Images.gasIcon, title: "Natural Gas"),
    QuickAccessCardWidget(icon: Images.dGeneratorIcon, title: "D. Generator"),
    QuickAccessCardWidget(icon: Images.waterProcessIcon, title: "Water Process"),
  ];

  final List<DataCardWidget> dataCardList = [
    DataCardWidget(
      icon: Images.electricityIcon,
      title: "Data View",
      badge: "Active",
      badgeColor: ColorRes.appColor,
      data: [
        {"label": "Data 1", "value": "55505.63"},
        {"label": "Data 2", "value": "58805.63"},
      ],
    ),

    DataCardWidget(
      icon: Images.solarIcon,
      title: "Data Ismail",
      badge: "Active",
      badgeColor: ColorRes.appColor,
      data: [
        {"label": "Data 1", "value": "55505.63"},
        {"label": "Data 2", "value": "58805.63"},
      ],
    ),

    DataCardWidget(
      icon: Images.waterIcon,
      title: "Data Type 3",
      badge: "Inactive",
      badgeColor: ColorRes.red,
      data: [
        {"label": "Data 1", "value": "55505.63"},
        {"label": "Data 2", "value": "58805.63"},
      ],
    ),

    DataCardWidget(
      icon: Images.electricityIcon,
      title: "Data View",
      badge: "Active",
      badgeColor: ColorRes.appColor,
      data: [
        {"label": "Data 1", "value": "55505.63"},
        {"label": "Data 2", "value": "58805.63"},
      ],
    ),

    DataCardWidget(
      icon: Images.solarIcon,
      title: "Data Ismail",
      badge: "Active",
      badgeColor: ColorRes.appColor,
      data: [
        {"label": "Data 1", "value": "55505.63"},
        {"label": "Data 2", "value": "58805.63"},
      ],
    ),

    DataCardWidget(
      icon: Images.waterIcon,
      title: "Data Type 3",
      badge: "Inactive",
      badgeColor: ColorRes.red,
      data: [
        {"label": "Data 1", "value": "55505.63"},
        {"label": "Data 2", "value": "58805.63"},
      ],
    ),
  ];

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
                              child: ToggleButtonWidget(
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
                              child: ToggleButtonWidget(
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

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 300,
                          child: CustomScrollbarList(children: dataCardList),
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
                children: quickAccessList,
              ),
            ],
          ),
        ),
      ),
    );
  }

}