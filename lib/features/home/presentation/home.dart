import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';

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

  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 30.0), // Margin from screen edges
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors.custom_yellow,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  iconEnabledColor: Colors.white,
                  iconSize: 30,
                  dropdownColor: MyColors.custom_yellow,
                  value: _selectedItem,
                  hint: const Text(
                    'المنشآت',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  items: _list.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                    _handleSelection(value);
                  },
                  isExpanded:
                      false, // Ensure dropdown is not expanded full width
                  borderRadius: BorderRadius.circular(10), // Rounded dropdown
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, personsDefination);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: MyColors.custom_yellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'صفحة تعريف الافراد',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSelection(String? value) {
    if (value == _list[0]) {
      Navigator.pushNamed(context, firstCompanyInfo);
    } else if (value == _list[1]) {
      Navigator.pushNamed(context, commercialRecord);
    } else if (value == _list[2]) {
      Navigator.pushNamed(context, authorizedSignatories);
    }
  }
}
