
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../../scm_data/view/scm_data_screen.dart';

class DataCardWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String badge;
  final Color badgeColor;
  final List<Map<String, String>> data;
  const DataCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.badge,
    required this.badgeColor,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ScmDataScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
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
                              color: badgeColor,
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
      ),
    );
  }
}
