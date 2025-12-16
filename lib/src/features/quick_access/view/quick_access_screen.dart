
import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/widget/global_appbar.dart';
import 'package:scube_technologies_task/src/global/widget/global_sized_box.dart';
import 'package:scube_technologies_task/src/global/widget/global_text.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_image_loader.dart';

class QuickAccessScreen extends StatefulWidget {
  const QuickAccessScreen({super.key});

  @override
  State<QuickAccessScreen> createState() => _QuickAccessScreenState();
}

class _QuickAccessScreenState extends State<QuickAccessScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedTabIndex = 0;
  double totalPower = 5.53;
  String selectedSource = 'Source';

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
      body: Container(
        height: size(context).height,
        margin: EdgeInsets.all(20),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GlobalImageLoader(
                imagePath: Images.noDataFoundImg,
                height: 195,
                width: size(context).width,
              ),

              GlobalText(
                str: "No data is here\nplease wait",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}