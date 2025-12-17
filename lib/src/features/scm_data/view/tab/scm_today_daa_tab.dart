
import 'package:flutter/material.dart';
import 'package:scube_technologies_task/src/global/constants/colors_resources.dart';
import '../widget/scm_list_widget.dart';

class ScmTodayDaaTab extends StatefulWidget {
  const ScmTodayDaaTab({super.key});

  @override
  State<ScmTodayDaaTab> createState() => _ScmTodayDaaTabState();
}

class _ScmTodayDaaTabState extends State<ScmTodayDaaTab> {

  double totalPower = 5.53;
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
      'color': ColorRes.appColor,
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
    return ScmListWidget(
      totalPower: totalPower,
      energyData: energyData,
    );
  }
}
