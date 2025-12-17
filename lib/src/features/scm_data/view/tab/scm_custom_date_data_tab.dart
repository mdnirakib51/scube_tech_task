
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
  final TextEditingController dateCon = TextEditingController();
  // Sample data for the energy chart
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: GlobalTextFormField(
                  controller: dateCon,
                  hintText: "From Date",
                  decoration: borderDecoration.copyWith(
                    contentPadding: EdgeInsets.only(left: 5),
                  ),
                  isDense: true,
                  readOnly: true,
                  sufixIcon: GestureDetector(
                    onTap: () async {
                      var pickedDate = await showDateOnlyPicker(context);
                      setState(() {
                        String formatedDate = DateTimeFormatter.showDateOnlyYear.format(pickedDate);
                        dateCon.text = formatedDate;
                      });
                    },
                    child: const Icon(Icons.calendar_month, color: ColorRes.grey, size: 20),
                  ),
                ),
              ),

              sizedBoxW(5),
              Expanded(
                child: GlobalTextFormField(
                  controller: dateCon,
                  hintText: "To Date",
                  decoration: borderDecoration.copyWith(
                    contentPadding: EdgeInsets.only(left: 5),
                  ),
                  isDense: true,
                  readOnly: true,
                  sufixIcon: GestureDetector(
                    onTap: () async {
                      var pickedDate = await showDateOnlyPicker(context);
                      setState(() {
                        String formatedDate = DateTimeFormatter.showDateOnlyYear.format(pickedDate);
                        dateCon.text = formatedDate;
                      });
                    },
                    child: const Icon(Icons.calendar_month, color: ColorRes.grey, size: 20),
                  ),
                ),
              ),

              sizedBoxW(5),
              Container(
                height: 35, width: 35,
                decoration: BoxDecoration(
                  color: ColorRes.appShadowColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: ColorRes.appColor)
                ),
                child: Icon(Icons.search, color: ColorRes.appColor),
              )
            ],
          ),
        ),
        ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 20),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index){
            return ScmListWidget(
              totalPower: totalPower,
              energyData: energyData,
            );
          },
        ),
      ],
    );
  }
}
