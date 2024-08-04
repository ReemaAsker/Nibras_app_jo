// import 'package:flutter/material.dart';
// import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

// import '../../../../../../core/widgets/clander_picker_image.dart';
// import '../../../../../../core/widgets/customListTile.dart';
// import '../../../../../../core/widgets/custom_drop_down_with_date.dart';
// import '../../../../../../core/widgets/custom_list_tile_with_drop.dart';
// import '../../../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
// import '../../../../../../core/widgets/image_picker_widget.dart';

// class AuthorizedSignatories extends StatefulWidget {
//   const AuthorizedSignatories({super.key});

//   @override
//   State<AuthorizedSignatories> createState() => _AuthorizedSignatoriesState();
// }

// class _AuthorizedSignatoriesState extends State<AuthorizedSignatories> {
//   DateTime _commercialRegistrationDate = DateTime.now(); // Example initial date

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
//                   const CutomListTileWithTextFeild(
//                     numOfTxTf: 2,
//                     title: 'اسم المنشأة',
//                     enabled: false,
//                     hintLabel: ['26', 'شركة الفوسفات'],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: ' العلامة التجارية',
//                     numOfTxTf: 1,
//                     enabled: false,
//                     hintLabel: ['شركة الفوسفات'],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: '  صفة تسجيل المنشأة',
//                     numOfTxTf: 1,
//                     enabled: false,
//                     hintLabel: ['شركة  تضامنية'],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: ' نوع المنشأة',
//                     numOfTxTf: 1,
//                     enabled: false,
//                     hintLabel: ['منشأة حكومية '],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: 'جنسية المنشأة   ',
//                     numOfTxTf: 1,
//                     enabled: false,
//                     hintLabel: [' شركة اردنية '],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: ' رقم السجل التجاري   ',
//                     numOfTxTf: 1,
//                     enabled: false,
//                     hintLabel: ['5289364  '],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: ' السجل التجاري   ',
//                     numOfTxTf: 1,
//                     enabled: false,
//                     hintLabel: ['38866  '],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: ' تسلسل السجل التجاري ',
//                     numOfTxTf: 1,
//                     enabled: false,
//                     hintLabel: ['38866  '],
//                   ),
//                   const Center(
//                     child: CutomListTileWithTextFeild(
//                       title: ' تاريخ السجل التجاري ',
//                       numOfTxTf: 1,
//                       enabled: false,
//                       hintLabel: ['5/9/2020  '],
//                     ),
//                   ),
//                   const SizedBox(
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
//                   const CutomListTileWithTextFeild(
//                     title: 'التسلسل',
//                     numOfTxTf: 1,
//                     hintLabel: ['75'],
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: 'اسم المفوض ',
//                     numOfTxTf: 2,
//                     hintLabel: ['71', 'اسماء سميرة تواف عبد القادر حمد '],
//                   ),
//                   const CustomListTile(
//                     title: 'صورة للمفوض ',
//                     element: ImagePickerWidget(
//                       defult_icon: Icons.person,
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
//                   const CustomListTile(
//                     element: CutomListTileWithdrop(
//                       withTxt: true,
//                       options: ['تفويض قانوني'],
//                     ),
//                     title: ' انواع التفويض',
//                   ),
//                   const CustomListTile(
//                     element: CutomListTileWithdrop(
//                       withTxt: true,
//                       options: ['تفويض منفرد'],
//                     ),
//                     title: 'صفة التفويض',
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: ' نص التفويض  ',
//                     numOfTxTf: 1,
//                     maxline: 8,
//                   ),
//                   const CutomListTileWithTextFeild(
//                     title: 'ملاحظات   ',
//                     numOfTxTf: 1,
//                     maxline: 4,
//                   ),
//                   const Row(
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
