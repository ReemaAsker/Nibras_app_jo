import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

class CustomBottomSheet extends StatefulWidget {
  final String title;

  const CustomBottomSheet({super.key, required this.title});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _data = [
    {"التسلسل": 1, "الاسم": "محمود محمد جسام جسام امين", "العمر": 30},
    {"التسلسل": 2, "الاسم": "محمود محمد  امين", "العمر": 20},
    {"التسلسل": 3, "الاسم": "محمود محمد  امين", "العمر": 23},
    {"التسلسل": 4, "الاسم": "محمود محمد  امين", "العمر": 24},
    {"التسلسل": 5, "الاسم": "محمود محمد  امين", "العمر": 25},
    {"التسلسل": 2, "الاسم": "محمود محمد  امين", "العمر": 20},
    {"التسلسل": 3, "الاسم": "محمود محمد  امين", "العمر": 23},
    {"التسلسل": 4, "الاسم": "محمود محمد  امين", "العمر": 24},
    {"التسلسل": 5, "الاسم": "محمود محمد  امين", "العمر": 25},
    {"التسلسل": 2, "الاسم": "محمود محمد  امين", "العمر": 20},
    {"التسلسل": 3, "الاسم": "محمود محمد  امين", "العمر": 23},
    {"التسلسل": 4, "الاسم": "محمود محمد  امين", "العمر": 24},
    {"التسلسل": 5, "الاسم": "محمود محمد  امين", "العمر": 25},
  ];

  List<Map<String, dynamic>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(_data);
  }

  void _filterData(String query) {
    _filteredData.clear();
    if (query.isEmpty) {
      _filteredData.addAll(_data);
    } else {
      _data.forEach((item) {
        if (item["الاسم"].toLowerCase().contains(query.toLowerCase())) {
          _filteredData.add(item);
        }
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                child: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            Divider(
              thickness: 8,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'بحث :  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterData,
                    decoration: InputDecoration(
                      fillColor: MyColors.custom_dark_grey,
                      // labelText: 'بحث',
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                )
              ],
            ),

            // Text('بحث'),
            // TextField(
            //   controller: _searchController,
            //   onChanged: _filterData,
            //   decoration: InputDecoration(
            //     // labelText: 'بحث',
            //     border:
            //         OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            //     prefixIcon: Icon(Icons.search),
            //   ),
            // ),
            SizedBox(height: 16.0),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('التسلسل')),
                    DataColumn(label: Text('الاسم')),
                    DataColumn(label: Text('العمر')),
                  ],
                  rows: _filteredData.map((data) {
                    return DataRow(cells: [
                      DataCell(Text(data['التسلسل'].toString())),
                      DataCell(Text(data['الاسم'])),
                      DataCell(Text(data['العمر'].toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
