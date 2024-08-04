// import 'package:flutter/material.dart';

// import '../../../../../core/helper/constants/my_colors.dart';
// import '../../../../../core/widgets/clander_picker_image.dart';
// import '../../../../../core/widgets/customListTile.dart';
// import '../../../../../core/widgets/custom_drop_down_with_date.dart';
// import '../../../../../core/widgets/custom_list_tile_with_drop.dart';
// import '../../../../../core/widgets/custom_list_tile_with_tet_feild.dart';

// class CommercialRecord extends StatefulWidget {
//   const CommercialRecord({super.key});

//   @override
//   State<CommercialRecord> createState() => _CommercialRecordState();
// }

// class _CommercialRecordState extends State<CommercialRecord> {
//   DateTime _commercialRegistrationDate = DateTime.now(); // Example initial date

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'السجل التجاري للمنشأة',
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Container(
//             color: Colors.white24.withOpacity(0.8),
//             child: Column(
//               children: [
//                 Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: MyColors.custom_blue,
//                     ),
//                     width: double.infinity,
//                     child: Text(
//                       'معلومات المنشأة',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     )),
//                 const CutomListTileWithTextFeild(
//                   numOfTxTf: 2,
//                   title: 'اسم المنشأة',
//                   enabled: false,
//                   hintLabel: ['26', 'شركة الفوسفات'],
//                 ),
//                 const CutomListTileWithTextFeild(
//                   title: ' العلامة التجارية',
//                   numOfTxTf: 1,
//                   enabled: false,
//                   hintLabel: ['شركة الفوسفات'],
//                 ),
//                 const CutomListTileWithTextFeild(
//                   title: '  صفة تسجيل المنشأة',
//                   numOfTxTf: 1,
//                   enabled: false,
//                   hintLabel: ['شركة  تضامنية'],
//                 ),
//                 const CutomListTileWithTextFeild(
//                   title: ' نوع المنشأة',
//                   numOfTxTf: 1,
//                   enabled: false,
//                   hintLabel: ['منشأة حكومية '],
//                 ),
//                 const CutomListTileWithTextFeild(
//                   title: 'جنسية المنشأة   ',
//                   numOfTxTf: 1,
//                   enabled: false,
//                   hintLabel: [' شركة اردنية '],
//                 ),
//                 const CutomListTileWithTextFeild(
//                   title: ' رقم السجل التجاري   ',
//                   numOfTxTf: 1,
//                   enabled: false,
//                   hintLabel: ['5289364  '],
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: MyColors.custom_blue,
//                     ),
//                     width: double.infinity,
//                     child: Text(
//                       'معلومات السجل التجاري',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     )),
//                 const CutomListTileWithTextFeild(
//                   title: 'التسلسل',
//                   numOfTxTf: 1,
//                   hintLabel: [' '],
//                 ),
//                 const CutomListTileWithTextFeild(
//                   title: 'تسلسل السجل التجاري',
//                   numOfTxTf: 1,
//                   hintLabel: [' '],
//                 ),
//                 const CutomListTileWithTextFeild(
//                   title: 'اصدار السجل التجاري',
//                   numOfTxTf: 1,
//                   hintLabel: [' '],
//                 ),
//                 CustomListTile(
//                   element: CalendarPickerWidget(
//                     initialDate: '2020-09-05', // Example initial date string
//                     onDateSelected: (selectedDate) {
//                       setState(() {
//                         _commercialRegistrationDate = selectedDate;
//                       });
//                     },
//                   ),
//                   title: 'تاريخ السجل التجاري',
//                 ),
//                 CutomListTileWithTextFeild(
//                   title: 'وقائع التفويض  ',
//                   numOfTxTf: 1,
//                   maxline: 7,
//                 ),
//                 CutomListTileWithTextFeild(
//                   title: 'ملاحظات   ',
//                   numOfTxTf: 1,
//                   maxline: 4,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: CustomListTileWithDate(
//                         forEdit: false,
//                         title: '  تاريخ السجل   ',
//                       ),
//                     ),
//                     Expanded(
//                       child: CustomListTileWithDate(
//                         forEdit: false,
//                         title: '  تاريخ التحديث   ',
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 )
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
