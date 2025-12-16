import 'package:flutter/material.dart';

import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';

class ScmListWidget extends StatelessWidget {
  final double totalPower;
  final List<Map<String, dynamic>> energyData;
  const ScmListWidget({
    super.key,
    required this.totalPower,
    required this.energyData
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 18),
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
          // Energy Chart Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GlobalText(
                str: "Energy Chart",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorRes.appThiTextColor,
              ),
              Row(
                children: [
                  GlobalText(
                    str: "$totalPower",
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.appThiTextColor,
                  ),
                  const SizedBox(width: 4),
                  GlobalText(
                    str: "kw",
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.appThiTextColor,
                  ),
                ],
              ),
            ],
          ),

          sizedBoxH(16),

          // Data Items
          ...energyData.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: ColorRes.appDataBorderColor,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: item['color'],
                            shape: BoxShape.circle,
                          ),
                        ),
                        GlobalText(
                          str: item['name'],
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.appThiTextColor,
                        ),
                      ],
                    ),
                  ),

                  sizedBoxW(5),

                  Container(
                    width: 1,
                    height: 30,
                    color: ColorRes.appBorderColor,
                  ),

                  sizedBoxW(5),
                  // Data and Cost column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
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
                              width: 40,
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
