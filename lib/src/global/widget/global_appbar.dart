import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/src/global/constants/images.dart';
import '../constants/colors_resources.dart';
import 'global_image_loader.dart';
import 'global_sized_box.dart';
import 'global_text.dart';

class GlobalAppbarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? action;
  const GlobalAppbarWidget({
    super.key,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      color: ColorRes.black.withAlpha(50),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              color: Colors.transparent,
              height: 40,
              width: 30,
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: ColorRes.white,
                  size: 20,
                ),
              ),
            ),
          ),
          sizedBoxW(5),
          Expanded(
            child: GlobalText(
              str: title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          action?.isNotEmpty ?? false ? Row(
            children: action ?? [],
          ) : const SizedBox.shrink()
        ],
      ),
    );
  }
}


// class GlobalAppBar extends StatelessWidget {
//   const GlobalAppBar({
//     super.key,
//     this.titleText,
//     this.isBackIc = true,
//     this.centerTitle,
//     this.titleColor,
//     this.fontSize,
//     this.fontWeight,
//     this.backColor,
//     this.title,
//     this.leading,
//     this.actions
//   });
//   final String? titleText;
//   final Color? titleColor;
//   final double? fontSize;
//   final FontWeight? fontWeight;
//   final Color? backColor;
//   final bool? isBackIc;
//   final bool? centerTitle;
//   final Widget? title;
//   final Widget? leading;
//   final List<Widget>? actions;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: backColor ?? ColorRes.white,
//       automaticallyImplyLeading: false,
//       leadingWidth: isBackIc == true ? 56 : 0,
//       elevation: 1,
//       leading: leading ?? (isBackIc == true ? IconButton(
//         splashRadius: 0.1,
//         icon: const Icon(Icons.arrow_back, color: ColorRes.black, size: 22),
//         onPressed: (){
//           Get.back();
//         },
//       ) : const SizedBox.shrink()),
//       centerTitle: centerTitle ?? true,
//       title: title ?? GlobalText(
//         str: titleText ?? "",
//         color: titleColor ?? ColorRes.black,
//         fontSize: fontSize ?? 16,
//         fontWeight: fontWeight ?? FontWeight.w500,
//         textAlign: TextAlign.center,
//         height: 2.4,
//       ),
//       actions: actions,
//     );
//   }
// }

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
    this.titleText,
    this.isBackIc = true,
    this.centerTitle,
    this.titleColor,
    this.fontSize,
    this.fontWeight,
    this.backColor,
    this.title,
    this.leading,
    this.actions,
    this.hasNotification = true,
    this.notificationCount,
    this.onNotificationTap,
  });

  final String? titleText;
  final Color? titleColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backColor;
  final bool? isBackIc;
  final bool? centerTitle;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool hasNotification;
  final int? notificationCount;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backColor ?? Colors.white,
      automaticallyImplyLeading: false,
      leadingWidth: isBackIc == true ? 56 : 0,
      elevation: 1,
      leading: leading ??
          (isBackIc == true
              ? IconButton(
            splashRadius: 0.1,
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 22),
            onPressed: () {
              Navigator.pop(context);
            },
          )
              : const SizedBox.shrink()),
      centerTitle: centerTitle ?? true,
      title: title ??
          Text(
            titleText ?? "",
            style: TextStyle(
              color: titleColor ?? Colors.black,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w500,
              height: 2.4,
            ),
            textAlign: TextAlign.center,
          ),
      actions: [
        ...actions ?? [],
        NotificationIcon(
          onTap: onNotificationTap,
          hasNotification: hasNotification,
          notificationCount: notificationCount,
        ),
      ]
    );
  }
}


class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    this.onTap,
    this.hasNotification = false,
    this.notificationCount,
    this.iconColor,
    this.badgeColor,
    this.badgeTextColor,
  });

  final VoidCallback? onTap;
  final bool hasNotification;
  final int? notificationCount;
  final Color? iconColor;
  final Color? badgeColor;
  final Color? badgeTextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GlobalImageLoader(
              imagePath: Images.notificationIc,
              height: 20,
              width: 20,
            ),

            Positioned(
              right: 1, top: -2,
              child: Container(
                padding: notificationCount != null && notificationCount! > 0
                    ? const EdgeInsets.symmetric(horizontal: 5, vertical: 2)
                    : const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: badgeColor ?? Colors.red,
                  shape: notificationCount != null && notificationCount! > 0
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  borderRadius: notificationCount != null && notificationCount! > 0
                      ? BorderRadius.circular(10)
                      : null,
                ),
                constraints: const BoxConstraints(
                  minWidth: 8,
                  minHeight: 8,
                ),
                child: notificationCount != null && notificationCount! > 0
                    ? Text(
                  notificationCount! > 99 ? '99+' : '$notificationCount',
                  style: TextStyle(
                    color: badgeTextColor ?? Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}