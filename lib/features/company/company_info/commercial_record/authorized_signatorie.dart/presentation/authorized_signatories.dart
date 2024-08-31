import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import '../../../../../../core/widgets/clander_picker_image.dart';
import '../../../../../../core/widgets/customListTile.dart';
import '../../../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../../../core/widgets/image_picker_widget.dart';

class AuthorizedSignatories extends StatefulWidget {
  const AuthorizedSignatories({super.key});

  @override
  State<AuthorizedSignatories> createState() => _AuthorizedSignatoriesState();
}

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

  DateTime _commercialRegistrationDate = DateTime.now(); // Initial date

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    _disposeControllers();
    super.dispose();
  }

  // Dispose all TextEditingControllers
  void _disposeControllers() {
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
              _buildSectionTitle('معلومات المنشأة'),
              _buildCompanyInfoSection(),
              SizedBox(height: 12),
              _buildDelegateInfoSection(),
              _buildNotesSection(),
              _buildDateSection(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the section title widget
  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: MyColors.custom_blue),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  // Builds the company information section with various text fields
  Widget _buildCompanyInfoSection() {
    return Column(
      children: [
        CutomListTileWithTextFeild(
          numOfTxTf: 2,
          title: 'اسم المنشأة',
          enabled: [false, false],
          hintLabel: ['26', 'شركة الفوسفات'],
          controllers: [_companyNameController1, _companyNameController2],
        ),
        CutomListTileWithTextFeild(
          title: 'العلامة التجارية',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['شركة الفوسفات'],
          controllers: [_trademarkController],
        ),
        CutomListTileWithTextFeild(
          title: 'صفة تسجيل المنشأة',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['شركة تضامنية'],
          controllers: [_registrationTypeController],
        ),
        CutomListTileWithTextFeild(
          title: 'نوع المنشأة',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['منشأة حكومية'],
          controllers: [_entityTypeController],
        ),
        CutomListTileWithTextFeild(
          title: 'جنسية المنشأة',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['شركة اردنية'],
          controllers: [_entityNationalityController],
        ),
        CutomListTileWithTextFeild(
          title: 'رقم السجل التجاري',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['5289364'],
          controllers: [_commercialRegistrationNumberController],
        ),
        CutomListTileWithTextFeild(
          title: 'السجل التجاري',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['38866'],
          controllers: [_commercialRegistrationController],
        ),
        CutomListTileWithTextFeild(
          title: 'تسلسل السجل التجاري',
          numOfTxTf: 1,
          enabled: [false],
          hintLabel: ['38866'],
          controllers: [_commercialRegistrationSequenceController],
        ),
        Center(
          child: CutomListTileWithTextFeild(
            title: 'تاريخ السجل التجاري',
            numOfTxTf: 1,
            enabled: [false],
            hintLabel: ['5/9/2020'],
            controllers: [_commercialRegistrationDateController],
          ),
        ),
      ],
    );
  }

  // Builds the delegate information section with text fields and image picker
  Widget _buildDelegateInfoSection() {
    return ExpansionTile(
      tilePadding: EdgeInsets.all(0),
      title: _buildSectionTitle('معلومات المفوض'),
      children: [
        CutomListTileWithTextFeild(
          title: 'التسلسل',
          numOfTxTf: 1,
          hintLabel: ['75'],
          controllers: [_delegateSequenceController],
        ),
        CutomListTileWithTextFeild(
          title: 'اسم المفوض',
          numOfTxTf: 2,
          hintLabel: ['71', 'اسماء سميرة تواف عبد القادر حمد'],
          controllers: [_delegateNameController1, _delegateNameController2],
        ),
        CustomListTile(
          title: 'صورة للمفوض',
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
        _buildDropdown('انواع التفويض', ['تفويض قانوني']),
        _buildDropdown('صفة التفويض', ['تفويض منفرد']),
        CutomListTileWithTextFeild(
          title: 'نص التفويض',
          numOfTxTf: 1,
          maxline: 8,
          controllers: [_delegationTextController],
        ),
      ],
    );
  }

  // Builds the notes section with a text field
  Widget _buildNotesSection() {
    return CutomListTileWithTextFeild(
      title: 'ملاحظات',
      numOfTxTf: 1,
      maxline: 4,
      controllers: [_notesController],
    );
  }

  // Builds the date section with two date fields
  Widget _buildDateSection() {
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

  // Builds a dropdown with the given title and items
  Widget _buildDropdown(String title, List<String> items) {
    return CustomListTile(
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
          style: TextStyle(color: Colors.white),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
      title: title,
    );
  }
}
