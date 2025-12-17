import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/constants/images.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../widget/semi_circular_progress_painter_widget.dart';

class RevenueViewTab extends StatefulWidget {
  const RevenueViewTab({super.key});

  @override
  State<RevenueViewTab> createState() => _RevenueViewTabState();
}

class _RevenueViewTabState extends State<RevenueViewTab> {
  int selectedSubTabIndex = 0;
  bool isExpanded = false;

  final List<Map<String, dynamic>> energyData = [
    {
      'name': 'Data A',
      'color': Colors.blue,
      'data': '2798.50 (29.53%)',
      'cost': '35689 ৳',
    },
    {
      'name': 'Data B',
      'color': Colors.grey.shade700,
      'data': '72598.50 (35.39%)',
      'cost': '5256899 ৳',
    },
    {
      'name': 'Data C',
      'color': Colors.purple,
      'data': '6598.36 (83.90%)',
      'cost': '5698756 ৳',
    },
    {
      'name': 'Data D',
      'color': Colors.orange,
      'data': '6598.26 (36.59%)',
      'cost': '356987 ৳',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedBoxH(80),

          // Semi-circular progress indicator
          SemiCircularProgressPainterWidget(
            title: "8897455",
            subTitle: "tk",
            progress: 0.75,
          ),

          sizedBoxH(20),

          // Data & Cost Info Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: ColorRes.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorRes.appDataBorderColor,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorRes.grey.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header with expand/collapse button
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        GlobalImageLoader(
                          imagePath: Images.dataCostIc,
                          height: 15,
                          width: 15,
                          color: ColorRes.appFourTextColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GlobalText(
                            str: "Data & Cost Info",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.appThiTextColor,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isExpanded
                                ? Icons.keyboard_double_arrow_down
                                : Icons.keyboard_double_arrow_up,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Expandable content
                AnimatedCrossFade(
                  firstChild: Column(
                    children: [
                      Divider(
                        color: ColorRes.appDataBorderColor,
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Column(
                          children: [
                            sizedBoxH(15),
                            // Data Items
                            ...energyData.map((item) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 45,
                                          child: GlobalText(
                                            str: "Data",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: ColorRes.appFourTextColor,
                                          ),
                                        ),
                                        GlobalText(
                                          str: ": ",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorRes.appFourTextColor,
                                        ),
                                        Expanded(
                                          child: GlobalText(
                                            str: item['data'],
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: ColorRes.appThiTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 45,
                                          child: GlobalText(
                                            str: "Cost",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: ColorRes.appFourTextColor,
                                          ),
                                        ),
                                        GlobalText(
                                          str: ": ",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorRes.appFourTextColor,
                                        ),
                                        Expanded(
                                          child: GlobalText(
                                            str: item['cost'],
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: ColorRes.appThiTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // if (energyData.indexOf(item) !=
                                    //     energyData.length - 1)
                                    //   Padding(
                                    //     padding: const EdgeInsets.only(top: 12),
                                    //     child: Divider(
                                    //       color: ColorRes.grey.withValues(alpha: 0.2),
                                    //       height: 1,
                                    //     ),
                                    //   ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  secondChild: const SizedBox.shrink(),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
              ],
            ),
          ),

          sizedBoxH(20),
        ],
      ),
    );
  }
}