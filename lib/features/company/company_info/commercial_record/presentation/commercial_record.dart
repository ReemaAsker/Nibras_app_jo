import 'package:flutter/material.dart';
import '../../../../../core/helper/constants/my_colors.dart';
import '../../../../../core/widgets/clander_picker_image.dart';
import '../../../../../core/widgets/customListTile.dart';
import '../../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../../core/widgets/custom_list_tile_with_tet_feild.dart';

class CommercialRecord extends StatefulWidget {
  const CommercialRecord({super.key});

  @override
  State<CommercialRecord> createState() => _CommercialRecordState();
}

class _CommercialRecordState extends State<CommercialRecord> {
  DateTime _commercialRegistrationDate = DateTime.now(); // Example initial date

  // Controllers for CutomListTileWithTextFeild widgets
  final TextEditingController establishmentNameController1 =
      TextEditingController();
  final TextEditingController establishmentNameController2 =
      TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController registrationStatusController =
      TextEditingController();
  final TextEditingController establishmentTypeController =
      TextEditingController();
  final TextEditingController establishmentNationalityController =
      TextEditingController();
  final TextEditingController commercialRecordNumberController =
      TextEditingController();
  final TextEditingController sequenceController = TextEditingController();
  final TextEditingController commercialRecordSequenceController =
      TextEditingController();
  final TextEditingController commercialRecordIssuanceController =
      TextEditingController();
  final TextEditingController authorizationDetailsController =
      TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    establishmentNameController1.dispose();
    establishmentNameController2.dispose();
    brandNameController.dispose();
    registrationStatusController.dispose();
    establishmentTypeController.dispose();
    establishmentNationalityController.dispose();
    commercialRecordNumberController.dispose();
    sequenceController.dispose();
    commercialRecordSequenceController.dispose();
    commercialRecordIssuanceController.dispose();
    authorizationDetailsController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('السجل التجاري للمنشأة'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white24.withOpacity(0.8),
              child: Column(
                children: [
                  _buildEstablishmentInfo(),
                  _buildCommercialRecordInfo(),
                  _buildAdditionalInfo(),
                  SizedBox(height: 30),
                  _buildDateRows(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEstablishmentInfo() {
    return Column(
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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        CutomListTileWithTextFeild(
          numOfTxTf: 2,
          title: 'اسم المنشأة',
          enabled: [false, false],
          hintLabel: ['26', 'شركة الفوسفات'],
          controllers: [
            establishmentNameController1,
            establishmentNameController2
          ],
        ),
        CutomListTileWithTextFeild(
          title: 'العلامة التجارية',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['شركة الفوسفات'],
          controllers: [brandNameController],
        ),
        CutomListTileWithTextFeild(
          title: 'صفة تسجيل المنشأة',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['شركة تضامنية'],
          controllers: [registrationStatusController],
        ),
        CutomListTileWithTextFeild(
          title: 'نوع المنشأة',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['منشأة حكومية'],
          controllers: [establishmentTypeController],
        ),
        CutomListTileWithTextFeild(
          title: 'جنسية المنشأة',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['شركة اردنية'],
          controllers: [establishmentNationalityController],
        ),
        CutomListTileWithTextFeild(
          title: 'رقم السجل التجاري',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['5289364'],
          controllers: [commercialRecordNumberController],
        ),
      ],
    );
  }

  Widget _buildCommercialRecordInfo() {
    return ExpansionTile(
      tilePadding: EdgeInsets.all(0),
      title: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MyColors.custom_blue,
        ),
        child: Text(
          'معلومات السجل التجاري',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      children: [
        CutomListTileWithTextFeild(
          title: 'التسلسل',
          numOfTxTf: 1,
          hintLabel: [''],
          controllers: [sequenceController],
        ),
        CutomListTileWithTextFeild(
          title: 'تسلسل السجل التجاري',
          numOfTxTf: 1,
          hintLabel: [''],
          controllers: [commercialRecordSequenceController],
        ),
        CutomListTileWithTextFeild(
          title: 'اصدار السجل التجاري',
          numOfTxTf: 1,
          hintLabel: [''],
          controllers: [commercialRecordIssuanceController],
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
        CutomListTileWithTextFeild(
          title: 'وقائع التفويض',
          numOfTxTf: 1,
          maxline: 7,
          controllers: [authorizationDetailsController],
        ),
      ],
    );
  }

  Widget _buildAdditionalInfo() {
    return CutomListTileWithTextFeild(
      title: 'ملاحظات',
      numOfTxTf: 1,
      maxline: 4,
      controllers: [notesController],
    );
  }

  Widget _buildDateRows() {
    return Row(
      children: [
        Expanded(
          child: CustomListTileWithDate(
            forEdit: false,
            title: 'تاريخ السجل',
          ),
        ),
        Expanded(
          child: CustomListTileWithDate(
            forEdit: false,
            title: 'تاريخ التحديث',
          ),
        ),
      ],
    );
  }
}
