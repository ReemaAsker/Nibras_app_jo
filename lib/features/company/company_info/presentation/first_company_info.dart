import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/widgets/custom_floating_action_button.dart';

import '../../../../core/widgets/customListTile.dart';
import '../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../core/widgets/image_picker_widget.dart';

class FirstCompnayInfo extends StatefulWidget {
  const FirstCompnayInfo({super.key});

  @override
  State<FirstCompnayInfo> createState() => _FirstCompnayInfoState();
}

class _FirstCompnayInfoState extends State<FirstCompnayInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      appBar: AppBar(
        title: Text('المعلومات الأولية للمنشأة'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        color: Colors.white24.withOpacity(0.8),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              CutomListTileWithTextFeild(
                numOfTxTf: 3,
                title: 'اسم المنشأة',
              ),
              CutomListTileWithTextFeild(
                  title: ' العلامة التجارية', numOfTxTf: 1),
              CutomListTileWithTextFeild(
                title: 'وصف المسمى',
                numOfTxTf: 2,
              ),
              CutomListTileWithTextFeild(
                title: 'الرقم الوطني للمنشأة ',
                numOfTxTf: 2,
              ),
              CutomListTileWithTextFeild(
                title: 'رقم تسجيل المنشأة  ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: ' رقم السجل التجاري',
                numOfTxTf: 1,
              ),
              CustomListTile(
                  element: CutomListTileWithdrop(
                    options: ['شركة تضامنية', 'شركة غير تضامنية'],
                  ),
                  title: 'صفة تسجيل المنشأة'),
              CustomListTile(
                  element: CutomListTileWithdrop(
                    options: ['منشأة حكومية', 'منشأة خاصة'],
                  ),
                  title: 'نوع المنشأة'),
              CustomListTile(
                  element: CutomListTileWithdrop(
                    options: ['اردنية', 'سعودية'],
                  ),
                  title: 'جنسية المنشأة'),
              CutomListTileWithTextFeild(
                title: ' رقم  الموبايل ',
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
                title: ' البريد الالكتروني   ',
                numOfTxTf: 1,
              ),
              CutomListTileWithTextFeild(
                title: '  العنوان   ',
                numOfTxTf: 2,
                maxline: 3,
              ),
              CutomListTileWithTextFeild(
                title: '  ملاحظات   ',
                numOfTxTf: 1,
                maxline: 5,
              ),
              CustomListTile(
                title: 'صورة لشعار المنشأة',
                element: ImagePickerWidget(
                  defult_icon: Icons.home,
                ),
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
