import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';

import '../../../core/widgets/custom_drop_down_widgett_.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _list = [
    'المعلومات الأولية للمنشأة',
    'السجل التجاري للمنشأة',
    'المفوضون بالتوقيع عن المنشأة',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تعريف معلومات المنشآت',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDropDownH(
                homeDropDown: true,
                ListItem: _list,
                hintText: 'المنشآت',
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, personsDefination);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: MyColors.custom_yellow,
                  ),
                  child: Text(
                    'صفحة تعريف الافراد',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
