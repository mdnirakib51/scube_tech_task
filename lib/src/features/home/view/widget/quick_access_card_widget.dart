
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../../quick_access/view/quick_access_screen.dart';

class QuickAccessCardWidget extends StatelessWidget {
  final String icon;
  final String title;
  const QuickAccessCardWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> QuickAccessScreen());
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
