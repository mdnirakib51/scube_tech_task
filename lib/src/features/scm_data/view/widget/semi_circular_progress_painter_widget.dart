
import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_text.dart';
import '../../components/semi_circular_progress_painter.dart';

class SemiCircularProgressPainterWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final double? progress;
  const SemiCircularProgressPainterWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: CustomPaint(
            painter: SemiCircularProgressPainter(
              progress: progress ?? 0,
              backgroundColor: ColorRes.appCircleGreyColor,
              progressColor: ColorRes.appCircleColor,
              strokeWidth: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlobalText(
                str: title ?? "",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorRes.appThiTextColor,
              ),
              GlobalText(
                str: "",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorRes.appThiTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
