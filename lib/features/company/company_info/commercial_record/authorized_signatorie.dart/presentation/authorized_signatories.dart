import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

import '../../../../../../core/widgets/clander_picker_image.dart';
import '../../../../../../core/widgets/customListTile.dart';
import '../../../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../../../core/widgets/image_picker_widget.dart';

class AuthorizedSignatories extends StatefulWidget {
  const AuthorizedSignatories({super.key});

  @override
  State<AuthorizedSignatories> createState() => _AuthorizedSignatoriesState();
}

// class _AuthorizedSignatoriesState extends State<AuthorizedSignatories> {
//   // Define TextEditingController objects for each text field
//   final TextEditingController _companyNameController1 = TextEditingController();
//   final TextEditingController _companyNameController2 = TextEditingController();
//   final TextEditingController _trademarkController = TextEditingController();
//   final TextEditingController _registrationTypeController =
//       TextEditingController();
//   final TextEditingController _entityTypeController = TextEditingController();
//   final TextEditingController _entityNationalityController =
//       TextEditingController();
//   final TextEditingController _commercialRegistrationNumberController =
//       TextEditingController();
//   final TextEditingController _commercialRegistrationController =
//       TextEditingController();
//   final TextEditingController _commercialRegistrationSequenceController =
//       TextEditingController();
//   final TextEditingController _commercialRegistrationDateController =
//       TextEditingController();
//   final TextEditingController _delegateSequenceController =
//       TextEditingController();
//   final TextEditingController _delegateNameController1 =
//       TextEditingController();
//   final TextEditingController _delegateNameController2 =
//       TextEditingController();
//   final TextEditingController _delegationTextController =
//       TextEditingController();
//   final TextEditingController _notesController = TextEditingController();

//   DateTime _commercialRegistrationDate = DateTime.now(); // Example initial date

//   @override
//   void dispose() {
//     // Dispose of the controllers when the widget is disposed
//     _companyNameController1.dispose();
//     _companyNameController2.dispose();
//     _trademarkController.dispose();
//     _registrationTypeController.dispose();
//     _entityTypeController.dispose();
//     _entityNationalityController.dispose();
//     _commercialRegistrationNumberController.dispose();
//     _commercialRegistrationController.dispose();
//     _commercialRegistrationSequenceController.dispose();
//     _commercialRegistrationDateController.dispose();
//     _delegateSequenceController.dispose();
//     _delegateNameController1.dispose();
//     _delegateNameController2.dispose();
//     _delegationTextController.dispose();
//     _notesController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('المفوضون بالتوقيع عن المنشأة'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(bottom: 20.0),
//           color: Colors.white24.withOpacity(0.8),
//           child: Center(
//             child: Column(children: [
//               Column(
//                 children: [
//                   Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: MyColors.custom_blue,
//                       ),
//                       width: double.infinity,
//                       child: Text(
//                         'معلومات المنشأة',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16),
//                       )),
//                   CutomListTileWithTextFeild(
//                     numOfTxTf: 2,
//                     title: 'اسم المنشأة',
//                     enabled: [false, false],
//                     hintLabel: ['26', 'شركة الفوسفات'],
//                     controllers: [
//                       _companyNameController1,
//                       _companyNameController2
//                     ],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: ' العلامة التجارية',
//                     numOfTxTf: 1,
//                     enabled: [false],
//                     hintLabel: ['شركة الفوسفات'],
//                     controllers: [_trademarkController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: '  صفة تسجيل المنشأة',
//                     numOfTxTf: 1,
//                     enabled: [false],
//                     hintLabel: ['شركة  تضامنية'],
//                     controllers: [_registrationTypeController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: ' نوع المنشأة',
//                     numOfTxTf: 1,
//                     enabled: [false],
//                     hintLabel: ['منشأة حكومية '],
//                     controllers: [_entityTypeController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: 'جنسية المنشأة   ',
//                     numOfTxTf: 1,
//                     enabled: [false],
//                     hintLabel: [' شركة اردنية '],
//                     controllers: [_entityNationalityController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: ' رقم السجل التجاري   ',
//                     numOfTxTf: 1,
//                     enabled: [false],
//                     hintLabel: ['5289364  '],
//                     controllers: [_commercialRegistrationNumberController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: ' السجل التجاري   ',
//                     numOfTxTf: 1,
//                     enabled: [false],
//                     hintLabel: ['38866  '],
//                     controllers: [_commercialRegistrationController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: ' تسلسل السجل التجاري ',
//                     numOfTxTf: 1,
//                     enabled: [false],
//                     hintLabel: ['38866  '],
//                     controllers: [_commercialRegistrationSequenceController],
//                   ),
//                   Center(
//                     child: CutomListTileWithTextFeild(
//                       title: ' تاريخ السجل التجاري ',
//                       numOfTxTf: 1,
//                       enabled: [false],
//                       hintLabel: ['5/9/2020  '],
//                       controllers: [_commercialRegistrationDateController],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: MyColors.custom_blue,
//                       ),
//                       width: double.infinity,
//                       child: Text(
//                         'معلومات المفوض',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16),
//                       )),
//                   CutomListTileWithTextFeild(
//                     title: 'التسلسل',
//                     numOfTxTf: 1,
//                     hintLabel: ['75'],
//                     controllers: [_delegateSequenceController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: 'اسم المفوض ',
//                     numOfTxTf: 2,
//                     hintLabel: ['71', 'اسماء سميرة تواف عبد القادر حمد '],
//                     controllers: [
//                       _delegateNameController1,
//                       _delegateNameController2
//                     ],
//                   ),
//                   CustomListTile(
//                     title: 'صورة للمفوض ',
//                     element: ImagePickerWidget(
//                       defaultIcon: Icons.person,
//                       onImagePicked: (value) {},
//                     ),
//                   ),
//                   CustomListTile(
//                     element: CalendarPickerWidget(
//                       initialDate: '2020-09-05', // Example initial date string
//                       onDateSelected: (selectedDate) {
//                         setState(() {
//                           _commercialRegistrationDate = selectedDate;
//                         });
//                       },
//                     ),
//                     title: 'تاريخ السجل التجاري',
//                   ),
//                   CustomListTile(
//                     element: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: MyColors.custom_yellow,
//                         contentPadding: const EdgeInsets.all(16),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         hintStyle: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       iconEnabledColor: Colors.white,
//                       iconSize: 30,
//                       dropdownColor: MyColors.custom_yellow,
//                       // value: _selectedItem,
//                       hint: const Text(
//                         'اختر',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                       items: ["تفويض قانوني"].map((String item) {
//                         return DropdownMenuItem<String>(
//                           value: item,
//                           child: Text(
//                             item,
//                             style: const TextStyle(
//                                 color: Colors.black, fontSize: 16),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {},
//                       borderRadius:
//                           BorderRadius.circular(10), // Rounded dropdown
//                     ),
//                     // CutomListTileWithdrop(
//                     //   withTxt: true,
//                     //   options: ['تفويض منفرد'],
//                     //   onChanged: (value) {},
//                     //   ListItem: [],
//                     // ),
//                     title: 'انواع التفويض',
//                   ),
//                   CustomListTile(
//                     element: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: MyColors.custom_yellow,
//                         contentPadding: const EdgeInsets.all(16),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         hintStyle: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       iconEnabledColor: Colors.white,
//                       iconSize: 30,
//                       dropdownColor: MyColors.custom_yellow,
//                       // value: _selectedItem,
//                       hint: const Text(
//                         'اختر',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                       items: ["تفويض منفرد"].map((String item) {
//                         return DropdownMenuItem<String>(
//                           value: item,
//                           child: Text(
//                             item,
//                             style: const TextStyle(
//                                 color: Colors.black, fontSize: 16),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {},
//                       borderRadius:
//                           BorderRadius.circular(10), // Rounded dropdown
//                     ),
//                     // CutomListTileWithdrop(
//                     //   withTxt: true,
//                     //   options: ['تفويض منفرد'],
//                     //   onChanged: (value) {},
//                     //   ListItem: [],
//                     // ),
//                     title: 'صفة التفويض',
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: ' نص التفويض  ',
//                     numOfTxTf: 1,
//                     maxline: 8,
//                     controllers: [_delegationTextController],
//                   ),
//                   CutomListTileWithTextFeild(
//                     title: 'ملاحظات   ',
//                     numOfTxTf: 1,
//                     maxline: 4,
//                     controllers: [_notesController],
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: CustomListTileWithDate(
//                           forEdit: false,
//                           title: '  تاريخ السجل   ',
//                         ),
//                       ),
//                       Expanded(
//                         child: CustomListTileWithDate(
//                           forEdit: false,
//                           title: '  تاريخ التحديث   ',
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   )
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
class _AuthorizedSignatoriesState extends State<AuthorizedSignatories> {
  // Define TextEditingController objects for each text field
  final TextEditingController _companyNameController1 = TextEditingController();
  final TextEditingController _companyNameController2 = TextEditingController();
  final TextEditingController _trademarkController = TextEditingController();
  final TextEditingController _registrationTypeController =
      TextEditingController();
  final TextEditingController _entityTypeController = TextEditingController();
  final TextEditingController _entityNationalityController =
      TextEditingController();
  final TextEditingController _commercialRegistrationNumberController =
      TextEditingController();
  final TextEditingController _commercialRegistrationController =
      TextEditingController();
  final TextEditingController _commercialRegistrationSequenceController =
      TextEditingController();
  final TextEditingController _commercialRegistrationDateController =
      TextEditingController();
  final TextEditingController _delegateSequenceController =
      TextEditingController();
  final TextEditingController _delegateNameController1 =
      TextEditingController();
  final TextEditingController _delegateNameController2 =
      TextEditingController();
  final TextEditingController _delegationTextController =
      TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  DateTime _commercialRegistrationDate = DateTime.now(); // Example initial date

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _companyNameController1.dispose();
    _companyNameController2.dispose();
    _trademarkController.dispose();
    _registrationTypeController.dispose();
    _entityTypeController.dispose();
    _entityNationalityController.dispose();
    _commercialRegistrationNumberController.dispose();
    _commercialRegistrationController.dispose();
    _commercialRegistrationSequenceController.dispose();
    _commercialRegistrationDateController.dispose();
    _delegateSequenceController.dispose();
    _delegateNameController1.dispose();
    _delegateNameController2.dispose();
    _delegationTextController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المفوضون بالتوقيع عن المنشأة'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyColors.custom_blue,
                ),
                width: double.infinity,
                child: Text(
                  'معلومات المنشأة',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              CutomListTileWithTextFeild(
                numOfTxTf: 2,
                title: 'اسم المنشأة',
                enabled: [false, false],
                hintLabel: ['26', 'شركة الفوسفات'],
                controllers: [_companyNameController1, _companyNameController2],
              ),
              CutomListTileWithTextFeild(
                title: ' العلامة التجارية',
                numOfTxTf: 1,
                enabled: [false],
                hintLabel: ['شركة الفوسفات'],
                controllers: [_trademarkController],
              ),
              CutomListTileWithTextFeild(
                title: '  صفة تسجيل المنشأة',
                numOfTxTf: 1,
                enabled: [false],
                hintLabel: ['شركة  تضامنية'],
                controllers: [_registrationTypeController],
              ),
              CutomListTileWithTextFeild(
                title: ' نوع المنشأة',
                numOfTxTf: 1,
                enabled: [false],
                hintLabel: ['منشأة حكومية '],
                controllers: [_entityTypeController],
              ),
              CutomListTileWithTextFeild(
                title: 'جنسية المنشأة   ',
                numOfTxTf: 1,
                enabled: [false],
                hintLabel: [' شركة اردنية '],
                controllers: [_entityNationalityController],
              ),
              CutomListTileWithTextFeild(
                title: ' رقم السجل التجاري   ',
                numOfTxTf: 1,
                enabled: [false],
                hintLabel: ['5289364  '],
                controllers: [_commercialRegistrationNumberController],
              ),
              CutomListTileWithTextFeild(
                title: ' السجل التجاري   ',
                numOfTxTf: 1,
                enabled: [false],
                hintLabel: ['38866  '],
                controllers: [_commercialRegistrationController],
              ),
              CutomListTileWithTextFeild(
                title: ' تسلسل السجل التجاري ',
                numOfTxTf: 1,
                enabled: [false],
                hintLabel: ['38866  '],
                controllers: [_commercialRegistrationSequenceController],
              ),
              Center(
                child: CutomListTileWithTextFeild(
                  title: ' تاريخ السجل التجاري ',
                  numOfTxTf: 1,
                  enabled: [false],
                  hintLabel: ['5/9/2020  '],
                  controllers: [_commercialRegistrationDateController],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ExpansionTile(
                tilePadding: EdgeInsets.all(0),
                title: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.custom_blue,
                    ),
                    child: Text(
                      'معلومات المفوض',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                children: [
                  CutomListTileWithTextFeild(
                    title: 'التسلسل',
                    numOfTxTf: 1,
                    hintLabel: ['75'],
                    controllers: [_delegateSequenceController],
                  ),
                  CutomListTileWithTextFeild(
                    title: 'اسم المفوض ',
                    numOfTxTf: 2,
                    hintLabel: ['71', 'اسماء سميرة تواف عبد القادر حمد '],
                    controllers: [
                      _delegateNameController1,
                      _delegateNameController2
                    ],
                  ),
                  CustomListTile(
                    title: 'صورة للمفوض ',
                    element: ImagePickerWidget(
                      defaultIcon: Icons.person,
                      onImagePicked: (value) {},
                    ),
                  ),
                  CustomListTile(
                    element: CalendarPickerWidget(
                      initialDate: '2020-09-05', // Example initial date string
                      onDateSelected: (selectedDate) {
                        setState(() {
                          _commercialRegistrationDate = selectedDate;
                        });
                      },
                    ),
                    title: 'تاريخ السجل التجاري',
                  ),
                  CustomListTile(
                    element: DropdownButtonFormField<String>(
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
                      hint: const Text(
                        'اختر',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      items: ["تفويض قانوني"].map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      borderRadius:
                          BorderRadius.circular(10), // Rounded dropdown
                    ),
                    title: 'انواع التفويض',
                  ),
                  CustomListTile(
                    element: DropdownButtonFormField<String>(
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
                      hint: const Text(
                        'اختر',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      items: ["تفويض منفرد"].map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      borderRadius:
                          BorderRadius.circular(10), // Rounded dropdown
                    ),
                    title: 'صفة التفويض',
                  ),
                  CutomListTileWithTextFeild(
                    title: ' نص التفويض  ',
                    numOfTxTf: 1,
                    maxline: 8,
                    controllers: [_delegationTextController],
                  ),
                ],
              ),
              CutomListTileWithTextFeild(
                title: 'ملاحظات   ',
                numOfTxTf: 1,
                maxline: 4,
                controllers: [_notesController],
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
