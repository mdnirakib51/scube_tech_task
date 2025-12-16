
import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';

class TripleTabContainer extends StatelessWidget {
  final int currentIndex;
  final String firstText;
  final String secondText;
  final String thirdText;
  final ValueChanged<int> onChange;

  const TripleTabContainer({
    super.key,
    required this.currentIndex,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size(context).width,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorRes.appBorderColor, width: 1),
          )
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => onChange(0),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? ColorRes.appColor : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: GlobalText(
                  str: firstText,
                  color: currentIndex == 0 ? ColorRes.white : ColorRes.textSecondary,
                  fontSize: 14,
                  fontWeight: currentIndex == 0 ? FontWeight.w700 : FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          sizedBoxW(4),
          Expanded(
            child: InkWell(
              onTap: () => onChange(1),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? ColorRes.appColor : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: GlobalText(
                  str: secondText,
                  color: currentIndex == 1 ? ColorRes.white : ColorRes.textSecondary,
                  fontSize: 14,
                  fontWeight: currentIndex == 1 ? FontWeight.w700 : FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          sizedBoxW(4),
          Expanded(
            child: InkWell(
              onTap: () => onChange(2),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? ColorRes.appColor : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: GlobalText(
                  str: thirdText,
                  color: currentIndex == 2 ? ColorRes.white : ColorRes.textSecondary,
                  fontSize: 14,
                  fontWeight: currentIndex == 2 ? FontWeight.w700 : FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
