import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

import '../../../../../../core/widgets/customListTile.dart';
import '../../../../../../core/widgets/custom_botoom_sheet.dart';
import '../../../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../../../core/widgets/custom_floating_action_button.dart';
import '../../../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../../../core/widgets/image_picker_widget.dart';

class PersonsDefination extends StatefulWidget {
  const PersonsDefination({super.key});

  @override
  State<PersonsDefination> createState() => _PersonDefinationState();
}

class _PersonDefinationState extends State<PersonsDefination> {
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      appBar: AppBar(
        title: Text('تعريف اسماء الافراد'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        color: Colors.white24.withOpacity(0.8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CutomListTileWithTextFeild(
                numOfTxTf: 5,
                title: 'الاسم الكامل',
                hintLabel: ['#', 'الاسم', ' الاب', ' الجد', ' العائلة'],
                labelExpanded: [1, 2, 2, 2, 2],
              ),
              CutomListTileWithTextFeild(
                title: 'اسم ووصف الموكل',
                numOfTxTf: 3,
                labelExpanded: [1, 4, 1],
              ),
              CustomListTile(
                  element: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              fillColor: MaterialStatePropertyAll(
                                  MyColors.custom_dark_grey),
                              value: 'انثى',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                color: MyColors.custom_yellow,
                                child: Text(
                                  'انثى',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              fillColor: MaterialStatePropertyAll(
                                  MyColors.custom_dark_grey),
                              activeColor: MyColors.custom_blue,
                              value: 'ذكر',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                color: MyColors.custom_yellow,
                                child: Text('ذكر',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  title: 'الجنس '),
              CustomListTile(
                  element: CutomListTileWithdrop(
                    options: ['عزباء/اعزب ', 'متزوج/ة', 'مطلق/مطلقة', 'ارمل/ة'],
                    withTxt: false,
                  ),
                  title: 'الحالة الاجتماعية '),
              CustomListTile(
                  element: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyColors.custom_yellow),
                      ),
                      //backgroundColor: MyColors.custom_yellow
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomBottomSheet(
                              title: 'شاشةالبحث عن المسميات  ',
                            );
                          },
                        );
                      },
                      child: Text('اضعط  لاختيار المسمى'),
                    ),
                  ),
                  title: ' وصف المسمى '),
              // CustomListTile(
              //     element: CutomListTileWithdrop(
              //       options: ['وصف المسمى'],
              //       withTxt: false,
              //     ),
              //     title: 'الحالة الاجتماعية '),
              CustomListTileWithDate(
                forEdit: true,
                title: '  تاريخ الميلاد   ',
              ),
              // CutomListTileWithTextFeild(
              //   title: 'الرقم الوطني للمنشأة ',
              //   numOfTxTf: 2,
              // ),
              CutomListTileWithTextFeild(
                title: 'اسم الام',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: ' الجنسية ',
                numOfTxTf: 2,
              ),
              CutomListTileWithTextFeild(
                title: ' رقم الوثيقة ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: ' نوع الوثيقة ',
                numOfTxTf: 2,
              ),
              CutomListTileWithTextFeild(
                title: '  الرقم الوطني ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: '  رقم الموبايل ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: ' رقم  الهاتف ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: ' رقم  الفاكس ',
                numOfTxTf: 1,
              ),

              CutomListTileWithTextFeild(
                title: ' رقم  الفاكس ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: ' البريد الالكتروني   ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: '  مسمى الوظيفة   ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: '   العنوان   ',
                numOfTxTf: 1,
                maxline: 5,
              ),
              CutomListTileWithTextFeild(
                title: '  ملاحظات   ',
                numOfTxTf: 1,
                maxline: 5,
              ),

              Row(
                children: [
                  Expanded(
                    child: CustomListTileWithDate(
                      forEdit: false,
                      title: '  تاريخ السجل   ',
                    ),
                  ),
                  Expanded(
                    child: CustomListTileWithDate(
                      forEdit: false,
                      title: '  تاريخ التحديث   ',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
