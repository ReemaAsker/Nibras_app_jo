import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

import '../../../../../../core/widgets/customListTile.dart';
import '../../../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../../../core/widgets/custom_list_tile_with_tet_feild.dart';

class PersonsDefination extends StatefulWidget {
  const PersonsDefination({super.key});

  @override
  State<PersonsDefination> createState() => _PersonDefinationState();
}

class _PersonDefinationState extends State<PersonsDefination> {
  // Define TextEditingControllers for all fields
  final TextEditingController _fullNameController1 = TextEditingController();
  final TextEditingController _fullNameController2 = TextEditingController();
  final TextEditingController _fullNameController3 = TextEditingController();
  final TextEditingController _fullNameController4 = TextEditingController();
  final TextEditingController _fullNameController5 = TextEditingController();
  final TextEditingController _delegateNameController1 =
      TextEditingController();
  final TextEditingController _delegateNameController2 =
      TextEditingController();
  final TextEditingController _delegateNameController3 =
      TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _nationalityController1 = TextEditingController();
  final TextEditingController _nationalityController2 = TextEditingController();
  final TextEditingController _documentNumberController =
      TextEditingController();
  final TextEditingController _documentTypeController1 =
      TextEditingController();
  final TextEditingController _documentTypeController2 =
      TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _faxNumberController1 = TextEditingController();
  final TextEditingController _faxNumberController2 = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String _selectedGender = '';

  @override
  void dispose() {
    // Dispose all controllers
    _fullNameController1.dispose();
    _fullNameController2.dispose();
    _fullNameController3.dispose();
    _fullNameController4.dispose();
    _fullNameController5.dispose();
    _delegateNameController1.dispose();
    _delegateNameController2.dispose();
    _delegateNameController3.dispose();
    _motherNameController.dispose();
    _nationalityController1.dispose();
    _nationalityController2.dispose();
    _documentNumberController.dispose();
    _documentTypeController1.dispose();
    _documentTypeController2.dispose();
    _nationalIdController.dispose();
    _mobileNumberController.dispose();
    _phoneNumberController.dispose();
    _faxNumberController1.dispose();
    _faxNumberController2.dispose();
    _emailController.dispose();
    _jobTitleController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controllers: [
                  _fullNameController1,
                  _fullNameController2,
                  _fullNameController3,
                  _fullNameController4,
                  _fullNameController5,
                ],
              ),
              CutomListTileWithTextFeild(
                title: 'اسم ووصف الموكل',
                numOfTxTf: 3,
                labelExpanded: [1, 4, 1],
                controllers: [
                  _delegateNameController1,
                  _delegateNameController2,
                  _delegateNameController3,
                ],
              ),
              // CustomListTile(
              //     element: CutomListTileWithdrop(
              //       options: ['عزباء/اعزب ', 'متزوج/ة', 'مطلق/مطلقة', 'ارمل/ة'],
              //       withTxt: false,
              //       onChanged: (value) {},
              //       ListItem: [],
              //     ),
              //     title: 'الحالة الاجتماعية '),
              CustomListTile(
                  element: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            MyColors.custom_yellow),
                      ),
                      onPressed: () {
                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return const Text(
                        //       'شاشةالبحث عن المسميات  ',
                        //     );
                        //   },
                        // );
                      },
                      child: Text('اضعط  لاختيار المسمى'),
                    ),
                  ),
                  title: ' وصف المسمى '),
              CustomListTileWithDate(
                forEdit: true,
                title: '  تاريخ الميلاد   ',
              ),
              CustomListTile(
                  element: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              fillColor: WidgetStatePropertyAll(
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
                        SizedBox(
                          width: 100,
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              fillColor: WidgetStatePropertyAll(
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
              CutomListTileWithTextFeild(
                title: 'اسم الام',
                numOfTxTf: 1,
                controllers: [
                  _motherNameController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: ' الجنسية ',
                numOfTxTf: 2,
                controllers: [
                  _nationalityController1,
                  _nationalityController2,
                ],
              ),
              CutomListTileWithTextFeild(
                title: ' رقم الوثيقة ',
                numOfTxTf: 1,
                controllers: [
                  _documentNumberController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: ' نوع الوثيقة ',
                numOfTxTf: 2,
                controllers: [
                  _documentTypeController1,
                  _documentTypeController2,
                ],
              ),
              CutomListTileWithTextFeild(
                title: '  الرقم الوطني ',
                numOfTxTf: 1,
                controllers: [
                  _nationalIdController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: '  رقم الموبايل ',
                numOfTxTf: 1,
                controllers: [
                  _mobileNumberController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: ' رقم  الهاتف ',
                numOfTxTf: 1,
                controllers: [
                  _phoneNumberController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: ' رقم  الفاكس ',
                numOfTxTf: 1,
                controllers: [
                  _faxNumberController1,
                ],
              ),
              CutomListTileWithTextFeild(
                title: ' رقم  الفاكس ',
                numOfTxTf: 1,
                controllers: [
                  _faxNumberController2,
                ],
              ),
              CutomListTileWithTextFeild(
                title: ' البريد الالكتروني   ',
                numOfTxTf: 1,
                controllers: [
                  _emailController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: '  مسمى الوظيفة   ',
                numOfTxTf: 1,
                controllers: [
                  _jobTitleController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: '   العنوان   ',
                numOfTxTf: 1,
                maxline: 5,
                controllers: [
                  _addressController,
                ],
              ),
              CutomListTileWithTextFeild(
                title: '  ملاحظات   ',
                numOfTxTf: 1,
                maxline: 5,
                controllers: [
                  _notesController,
                ],
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

            // String _selectedGender = '';

            // @override
            // Widget build(BuildContext context) {
            //   return Scaffold(
            //     // floatingActionButton: CustomFloatingActionButton(
            //     //   floatingActionButtonChoicesAppear: [true, true, true, true, true],
            //     // ),
            //     appBar: AppBar(
            //       title: Text('تعريف اسماء الافراد'),
            //     ),
            //     body: Container(
            //       padding: EdgeInsets.only(bottom: 20.0),
            //       color: Colors.white24.withOpacity(0.8),
            //       child: SingleChildScrollView(
            //         child: Column(
            //           children: [
            //             CutomListTileWithTextFeild(
            //               numOfTxTf: 5,
            //               title: 'الاسم الكامل',
            //               hintLabel: ['#', 'الاسم', ' الاب', ' الجد', ' العائلة'],
            //               labelExpanded: [1, 2, 2, 2, 2],
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: 'اسم ووصف الموكل',
            //               numOfTxTf: 3,
            //               labelExpanded: [1, 4, 1],
            //               controllers: [],
            //             ),
            //             CustomListTile(
            //                 element: Padding(
            //                   padding: const EdgeInsets.all(10.0),
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                     children: [
            //                       Row(
            //                         children: [
            //                           Radio<String>(
            //                             fillColor: MaterialStatePropertyAll(
            //                                 MyColors.custom_dark_grey),
            //                             value: 'انثى',
            //                             groupValue: _selectedGender,
            //                             onChanged: (value) {
            //                               setState(() {
            //                                 _selectedGender = value!;
            //                               });
            //                             },
            //                           ),
            //                           Container(
            //                               padding: EdgeInsets.all(10),
            //                               color: MyColors.custom_yellow,
            //                               child: Text(
            //                                 'انثى',
            //                                 style: TextStyle(fontWeight: FontWeight.bold),
            //                               )),
            //                         ],
            //                       ),
            //                       Row(
            //                         children: [
            //                           Radio<String>(
            //                             fillColor: MaterialStatePropertyAll(
            //                                 MyColors.custom_dark_grey),
            //                             activeColor: MyColors.custom_blue,
            //                             value: 'ذكر',
            //                             groupValue: _selectedGender,
            //                             onChanged: (value) {
            //                               setState(() {
            //                                 _selectedGender = value!;
            //                               });
            //                             },
            //                           ),
            //                           Container(
            //                               padding: EdgeInsets.all(10),
            //                               color: MyColors.custom_yellow,
            //                               child: Text('ذكر',
            //                                   style: TextStyle(
            //                                       fontWeight: FontWeight.bold))),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 title: 'الجنس '),
            //             CustomListTile(
            //                 element: CutomListTileWithdrop(
            //                   options: ['عزباء/اعزب ', 'متزوج/ة', 'مطلق/مطلقة', 'ارمل/ة'],
            //                   withTxt: false,
            //                   onChanged: (value) {},
            //                 ),
            //                 title: 'الحالة الاجتماعية '),
            //             CustomListTile(
            //                 element: Padding(
            //                   padding: const EdgeInsets.all(10.0),
            //                   child: ElevatedButton(
            //                     style: ButtonStyle(
            //                       padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
            //                       shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            //                         RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(8.0),
            //                         ),
            //                       ),
            //                       foregroundColor:
            //                           WidgetStateProperty.all<Color>(Colors.white),
            //                       backgroundColor: WidgetStateProperty.all<Color>(
            //                           MyColors.custom_yellow),
            //                     ),
            //                     //backgroundColor: MyColors.custom_yellow
            //                     onPressed: () {
            //                       showModalBottomSheet(
            //                         context: context,
            //                         builder: (BuildContext context) {
            //                           return const Text(
            //                             'شاشةالبحث عن المسميات  ',
            //                           );
            //                         },
            //                       );
            //                     },
            //                     child: Text('اضعط  لاختيار المسمى'),
            //                   ),
            //                 ),
            //                 title: ' وصف المسمى '),
            //             // CustomListTile(
            //             //     element: CutomListTileWithdrop(
            //             //       options: ['وصف المسمى'],
            //             //       withTxt: false,
            //             //     ),
            //             //     title: 'الحالة الاجتماعية '),
            //             CustomListTileWithDate(
            //               forEdit: true,
            //               title: '  تاريخ الميلاد   ',
            //             ),
            //             // CutomListTileWithTextFeild(
            //             //   title: 'الرقم الوطني للمنشأة ',
            //             //   numOfTxTf: 2,
            //             // ),
            //             CutomListTileWithTextFeild(
            //               title: 'اسم الام',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: ' الجنسية ',
            //               numOfTxTf: 2,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: ' رقم الوثيقة ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: ' نوع الوثيقة ',
            //               numOfTxTf: 2,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: '  الرقم الوطني ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: '  رقم الموبايل ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: ' رقم  الهاتف ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: ' رقم  الفاكس ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),

            //             CutomListTileWithTextFeild(
            //               title: ' رقم  الفاكس ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: ' البريد الالكتروني   ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: '  مسمى الوظيفة   ',
            //               numOfTxTf: 1,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: '   العنوان   ',
            //               numOfTxTf: 1,
            //               maxline: 5,
            //               controllers: [],
            //             ),
            //             CutomListTileWithTextFeild(
            //               title: '  ملاحظات   ',
            //               numOfTxTf: 1,
            //               maxline: 5,
            //               controllers: [],
            //             ),

            //             Row(
            //               children: [
            //                 Expanded(
            //                   child: CustomListTileWithDate(
            //                     forEdit: false,
            //                     title: '  تاريخ السجل   ',
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: CustomListTileWithDate(
            //                     forEdit: false,
            //                     title: '  تاريخ التحديث   ',
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
          ),
        ),
      ),
    );
  }
}
