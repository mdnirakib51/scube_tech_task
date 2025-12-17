import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/widget/global_sized_box.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/date_time_formatter.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/method/show_date_time_picker.dart';
import '../../../../global/widget/global_textform_field.dart';
import '../widget/scm_list_widget.dart';

class ScmCustomDateDataTab extends StatefulWidget {
  const ScmCustomDateDataTab({super.key});

  @override
  State<ScmCustomDateDataTab> createState() => _ScmCustomDateDataTabState();
}

class _ScmCustomDateDataTabState extends State<ScmCustomDateDataTab> {

  double totalPower = 5.53;
  final TextEditingController fromDateCon = TextEditingController();
  final TextEditingController toDateCon = TextEditingController();

  // Dummy list for energy data
  final List<Map<String, dynamic>> dummyList = [
    {
      'totalPower': 20.05,
      'energyData': [
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
      ],
    },
    {
      'totalPower': 5.53,
      'energyData': [
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
      ],
    },
    {
      'totalPower': 15.75,
      'energyData': [
        {
          'name': 'Data A',
          'color': Colors.blue,
          'data': '3500.00 (25.00%)',
          'cost': '45000 ৳',
        },
        {
          'name': 'Data B',
          'color': Colors.grey.shade700,
          'data': '80000.00 (40.00%)',
          'cost': '6000000 ৳',
        },
        {
          'name': 'Data C',
          'color': Colors.purple,
          'data': '7000.00 (80.00%)',
          'cost': '6000000 ৳',
        },
        {
          'name': 'Data D',
          'color': Colors.orange,
          'data': '7500.00 (38.00%)',
          'cost': '400000 ৳',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: GlobalTextFormField(
                  controller: fromDateCon,
                  hintText: "From Date",
                  decoration: dateDecoration,
                  isDense: true,
                  readOnly: true,
                  sufixIcon: GestureDetector(
                    onTap: () async {
                      var pickedDate = await showDateOnlyPicker(context);
                      setState(() {
                        String formatedDate = DateTimeFormatter.showDateOnlyYear.format(pickedDate);
                        fromDateCon.text = formatedDate;
                      });
                    },
                    child: const Icon(Icons.calendar_today_outlined, color: ColorRes.appFourTextColor, size: 18),
                  ),
                ),
              ),

              sizedBoxW(5),
              Expanded(
                child: GlobalTextFormField(
                  controller: toDateCon,
                  hintText: "To Date",
                  decoration: dateDecoration,
                  isDense: true,
                  readOnly: true,
                  sufixIcon: GestureDetector(
                    onTap: () async {
                      var pickedDate = await showDateOnlyPicker(context);
                      setState(() {
                        String formatedDate = DateTimeFormatter.showDateOnlyYear.format(pickedDate);
                        toDateCon.text = formatedDate;
                      });
                    },
                    child: const Icon(Icons.calendar_today_outlined, color: ColorRes.appFourTextColor, size: 18),
                  ),
                ),
              ),

              sizedBoxW(5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ColorRes.appShadowColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 1, color: ColorRes.appColor)
                ),
                child: Icon(Icons.search, color: ColorRes.appColor, size: 22),
              )
            ],
          ),
        ),
        ListView.builder(
          itemCount: dummyList.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 20),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index){
            return ScmListWidget(
              totalPower: dummyList[index]['totalPower'],
              energyData: dummyList[index]['energyData'],
            );
          },
        ),
      ],
    );
  }
}