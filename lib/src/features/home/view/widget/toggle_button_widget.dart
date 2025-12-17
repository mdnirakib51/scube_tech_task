
import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_text.dart';

class ToggleButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const ToggleButtonWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
}
