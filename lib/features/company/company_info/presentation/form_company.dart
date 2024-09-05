import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/extentiions/find_where_droppable.dart';
import 'package:nibras_group_jor/features/company/company_info/presentation/company_shred_functionalities.dart';
import '../../../../core/helper/constants/my_colors.dart';
import '../../../../core/widgets/customListTile.dart';
import '../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../../core/widgets/validations_rules.dart';
import '../business_logic/cubit/company_cubit.dart';
import '../data/models/CompanyRgistrationStatus.dart';
import '../data/models/CompanyType.dart';
import '../data/models/company.dart';
import '../data/models/company_country_national.dart';
import '../data/models/company_title.dart';
import 'edit_delete_company.dart';

class FormCompany extends StatefulWidget {
  final int nId;
  final Company? selectedCompany;
  final List<CompanyTitle> companyTitles;
  final List<CompanyRgistrationStatus> companyRgistrationStatus;
  final List<CompanyCountryNational> companyNational;
  final List<CompanyType> companyType;
  late Company currentCompany;
  final CompanyCubit companyCubit;

  FormCompany(
      {Key? key,
      required this.nId,
      this.selectedCompany,
      required this.companyTitles,
      required this.companyRgistrationStatus,
      required this.companyNational,
      required this.companyType,
      required this.companyCubit})
      : super(key: key);

  @override
  _FormCompanyState createState() => _FormCompanyState();
}

class _FormCompanyState extends State<FormCompany> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _textControllerForCompanyNameID;
  late TextEditingController _textControllerForCompanyNamePrefix;
  late TextEditingController _textControllerForCompanyName;
  late TextEditingController _textControllerForCompanyNameSuffix;
  late TextEditingController _textControllerForTradeMark;
  late TextEditingController _textControllerForCompanyTitleId;
  late TextEditingController _textControllerForCompanyTypeId;
  late TextEditingController _textControllerForCompanyCountryID;
  late TextEditingController _textControllerForCompanyCatId;
  late TextEditingController _textControllerForCompanyNationalId;
  late TextEditingController _textControllerForCompanyRegisterationNumber;
  late TextEditingController _textControllerForCompanyCommercialNumber;
  late TextEditingController _textControllerForCompanyMobileNumber;
  late TextEditingController _textControllerForCompanyTelephoneNumber;
  late TextEditingController _textControllerForCompanyFaxNumber;
  late TextEditingController _textControllerForCompanyEmail;
  late TextEditingController _textControllerForCompanyAddressOne;
  late TextEditingController _textControllerForCompanyAddressTwo;
  late TextEditingController _textControllerForCompanyNotes;
  dynamic _selectedImage; // Set the default icon for image picker

  @override
  void dispose() {
    _textControllerForCompanyNameID.dispose();
    _textControllerForCompanyName.dispose();
    _textControllerForTradeMark.dispose();
    _textControllerForCompanyTitleId.dispose();
    _textControllerForCompanyNamePrefix.dispose();
    _textControllerForCompanyNameSuffix.dispose();
    _textControllerForCompanyRegisterationNumber.dispose();
    _textControllerForCompanyCountryID.dispose();
    _textControllerForCompanyTypeId.dispose();
    _textControllerForCompanyCommercialNumber.dispose();
    _textControllerForCompanyCatId.dispose();
    _textControllerForCompanyNationalId.dispose();
    _textControllerForCompanyMobileNumber.dispose();
    _textControllerForCompanyTelephoneNumber.dispose();
    _textControllerForCompanyFaxNumber.dispose();
    _textControllerForCompanyEmail.dispose();
    _textControllerForCompanyAddressOne.dispose();
    _textControllerForCompanyAddressTwo.dispose();
    _textControllerForCompanyNotes.dispose();
    super.dispose();
  }

  fillCompanyData() {
    Company existingCompany = widget.selectedCompany!;

    try {
      _textControllerForCompanyNameID.text =
          existingCompany.id.toString().isEmpty
              ? ""
              : existingCompany.id.toString();

      Map<String, String> splitting =
          splitCompanyName(existingCompany.company_name!);

      if (splitting.length == 3) {
        _textControllerForCompanyName.text =
            splitting["ComName"]!.isEmpty ? "" : splitting["ComName"]!;
        _textControllerForCompanyNamePrefix.text =
            splitting["prefix"]!.isEmpty ? "" : splitting["prefix"]!;
        _textControllerForCompanyNameSuffix.text =
            splitting["suffix"]!.isEmpty ? "" : splitting["suffix"]!;
      } else {
        _textControllerForCompanyName.text = "";
        _textControllerForCompanyNamePrefix.text = "";
        _textControllerForCompanyNameSuffix.text = "";
      }
      _textControllerForTradeMark.text =
          existingCompany.company_trademark ?? '';
      _textControllerForCompanyTitleId.text =
          existingCompany.company_title_id.toString();

      _textControllerForCompanyNationalId.text =
          existingCompany.national_id ?? '';
      _textControllerForCompanyRegisterationNumber.text =
          existingCompany.registration_number ?? '';

      _textControllerForCompanyTypeId.text =
          existingCompany.company_type_id.toString();
      _textControllerForCompanyCatId.text =
          existingCompany.company_cat_id.toString();
      _textControllerForCompanyCountryID.text =
          existingCompany.company_country_id.toString();
      _textControllerForCompanyMobileNumber.text = existingCompany.mobile ?? '';
      _textControllerForCompanyTelephoneNumber.text =
          existingCompany.phone ?? '';
      _textControllerForCompanyFaxNumber.text = existingCompany.fax ?? '';
      _textControllerForCompanyEmail.text = existingCompany.email ?? '';
      _textControllerForCompanyAddressOne.text =
          existingCompany.a_address.toString();
      _textControllerForCompanyAddressTwo.text =
          existingCompany.address_desc ?? '';
      _textControllerForCompanyNotes.text = existingCompany.notes ?? '';
      _selectedImage = existingCompany.picture ?? Icons.home;
      _textControllerForCompanyFaxNumber.text = existingCompany.fax.toString();
      _textControllerForCompanyCommercialNumber.text =
          existingCompany.reg_r.toString();
    } catch (e, str) {}
  }

  @override
  void initState() {
    super.initState();
    _textControllerForCompanyNameID = TextEditingController();
    _textControllerForCompanyNamePrefix = TextEditingController();
    _textControllerForCompanyName = TextEditingController();
    _textControllerForCompanyNameSuffix = TextEditingController();
    _textControllerForTradeMark = TextEditingController();
    _textControllerForCompanyTitleId = TextEditingController();
    _textControllerForCompanyTypeId = TextEditingController();
    _textControllerForCompanyCountryID = TextEditingController();
    _textControllerForCompanyCatId = TextEditingController();
    _textControllerForCompanyNationalId = TextEditingController();
    _textControllerForCompanyRegisterationNumber = TextEditingController();
    _textControllerForCompanyCommercialNumber = TextEditingController();
    _textControllerForCompanyMobileNumber = TextEditingController();
    _textControllerForCompanyTelephoneNumber = TextEditingController();
    _textControllerForCompanyFaxNumber = TextEditingController();
    _textControllerForCompanyEmail = TextEditingController();
    _textControllerForCompanyAddressOne = TextEditingController();
    _textControllerForCompanyAddressTwo = TextEditingController();
    _textControllerForCompanyNotes = TextEditingController();
    if (widget.selectedCompany != null) {
      fillCompanyData();
    }
  }

  void _onImagePicked(dynamic image) {
    _selectedImage = image;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CutomListTileWithTextFeild(
            ignoreValidatorIndex: 3,
            // enabled: _isEditable,
            validator: (value) => IsTextEmpty(value),

            controllers: [
              _textControllerForCompanyNameID,
              _textControllerForCompanyNamePrefix,
              _textControllerForCompanyName,
              _textControllerForCompanyNameSuffix,
            ],
            numOfTxTf: 4,
            hintLabel: [
              widget.selectedCompany == null
                  ? widget.nId.toString()
                  : widget.selectedCompany!.id.toString(),
              "",
              "",
              ""
            ],
            labelExpanded: [1, 1, 2, 1],
            enabled: [false, false, true, false],
            title: 'اسم المنشأة',
          ),
          CutomListTileWithTextFeild(
              validator: (value) => IsTextEmpty(value),
              controllers: [
                _textControllerForTradeMark,
              ],
              title: ' العلامة التجارية',
              numOfTxTf: 1),
          CustomListTile(
            element: CustomListTileWithDrop<CompanyTitle>(
              items: widget.companyTitles,
              initialValue: widget.companyTitles.findWhereCompanyTitle(
                  widget.selectedCompany?.company_title_id),
              validator: (selectedItem) => IsTextEmpty(selectedItem),
              // key: customListTileWithDropKey,
              onChanged: (selectedItem) {
                _textControllerForCompanyTitleId.text =
                    (selectedItem as CompanyTitle).id.toString();
                _textControllerForCompanyNamePrefix.text =
                    selectedItem.titlePrefix.toString();
                _textControllerForCompanyNameSuffix.text =
                    selectedItem.titleSuffix.toString();
              },
            ),
            title: 'وصف المسمى',
          ),
          CustomListTile(
              element: CustomListTileWithDrop<CompanyRgistrationStatus>(
                validator: (selectedItem) => IsTextEmpty(selectedItem),
                items: widget
                    .companyRgistrationStatus, // List of CompanyType objects
                initialValue: widget.companyRgistrationStatus
                    .findWhereCompanyType(
                        widget.selectedCompany?.company_type_id),
                onChanged: (selectedItem) {
                  _textControllerForCompanyTypeId.text =
                      (selectedItem as CompanyRgistrationStatus).id.toString();
                },
              ),
              title: 'صفة تسجيل المنشأة'),
          CustomListTile(
              element: CustomListTileWithDrop<CompanyCountryNational>(
                validator: (selectedItem) => IsTextEmpty(selectedItem),
                items: widget.companyNational,
                initialValue: widget.companyNational.findWhereCompanyCountry(
                    widget.selectedCompany?.company_country_id),
                onChanged: (selectedItem) {
                  _textControllerForCompanyCountryID.text =
                      (selectedItem as CompanyCountryNational).id.toString();
                },
              ),
              title: 'جنسية المنشأة'),
          CustomListTile(
              element: CustomListTileWithDrop<CompanyType>(
                validator: (selectedItem) => IsTextEmpty(selectedItem),
                items: widget.companyType,
                initialValue: widget.companyType.findWhereCompanyCategory(
                    widget.selectedCompany?.company_cat_id),
                onChanged: (selectedItem) {
                  _textControllerForCompanyCatId.text =
                      (selectedItem as CompanyType).id.toString();
                },
              ),
              title: 'نوع المنشأة'),
          CutomListTileWithTextFeild(
            validator: (value) => numberGreaterThanFourValidation(value),
            controllers: [
              _textControllerForCompanyNationalId,
            ],
            title: 'الرقم الوطني للمنشأة ',
            numOfTxTf: 1,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => numberGreaterThanFourValidation(value),
            controllers: [
              _textControllerForCompanyRegisterationNumber,
            ],
            title: 'رقم تسجيل المنشأة  ',
            numOfTxTf: 1,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => numberGreaterThanFourValidation(value),
            controllers: [
              _textControllerForCompanyCommercialNumber,
            ],
            title: ' رقم السجل التجاري',
            numOfTxTf: 1,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => phonenumberValidation(value),
            controllers: [
              _textControllerForCompanyMobileNumber,
            ],
            title: ' رقم  الموبايل ',
            numOfTxTf: 1,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => telePhonenumberValidation(value),
            controllers: [
              _textControllerForCompanyTelephoneNumber,
            ],
            title: ' رقم  الهاتف ',
            numOfTxTf: 1,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => numberGreaterThanFourValidation(value),
            controllers: [
              _textControllerForCompanyFaxNumber,
            ],
            title: ' رقم  الفاكس ',
            numOfTxTf: 1,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => emailValidation(value),
            controllers: [
              _textControllerForCompanyEmail,
            ],
            title: ' البريد الالكتروني   ',
            numOfTxTf: 1,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => IsTextEmpty(value),
            enabled: [false, false],
            hintLabel: [
              "20",
              "جبل النزهة/بسمان/محافظة العاصمة/المملكة الاردنية الهاشمية"
            ],
            controllers: [
              _textControllerForCompanyAddressOne,
              _textControllerForCompanyAddressTwo,
            ],
            title: '  العنوان   ',
            numOfTxTf: 2,
            maxline: 3,
          ),
          CutomListTileWithTextFeild(
            validator: (value) => IsTextEmpty(value),
            controllers: [_textControllerForCompanyNotes],
            title: '  ملاحظات   ',
            numOfTxTf: 1,
            maxline: 5,
          ),
          CustomListTile(
            title: 'صورة لشعار المنشأة',
            element: ImagePickerWidget(
              defaultIcon: _selectedImage ?? Icons.home,
              onImagePicked: _onImagePicked,
            ),
          ),
          widget.selectedCompany != null
              ? Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomListTileWithDate(
                            forEdit: false,
                            title: '  تاريخ السجل   ',
                            initialDateTime:
                                widget.selectedCompany?.created_at),
                      ),
                      Expanded(
                        child: CustomListTileWithDate(
                            forEdit: false,
                            title: '  تاريخ التحديث   ',
                            initialDateTime:
                                widget.selectedCompany?.updated_at),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              : Text(''),
          Divider(
            thickness: 3,
            color: MyColors.custom_dark_grey,
          ),
          widget.selectedCompany != null
              ? EditDeleteCompany(
                  formKey: _formKey,
                  checkHasUpdates: checkHasUpdates,
                  updateCreateCompany: createUpdateCompany,
                  onUpdateCompany: (company) =>
                      widget.companyCubit.updateCompany(company),
                  onDeleteCompany: (id) =>
                      widget.companyCubit.deleteCompany(id),
                  haveInternet: widget.companyCubit.haveInternet,
                  selectedCompany: widget.selectedCompany,
                )
              : NewCompany()
        ],
      ),
    );
  }

  Widget NewCompany() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: widget.companyCubit.haveInternet
                    ? MyColors.custom_blue
                    : Colors.black,
                //  noActionColor ??
                //     MyColors.custom_blue, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0), // Adjust padding
              ),
              onPressed: () async {
                if (!widget.companyCubit.haveInternet) {
                  showSnackbar(
                    context,
                    'لا يوجد اتصال بالانترنت',
                    Colors.red,
                  );

                  return;
                } else if (_formKey.currentState!.validate()) {
                  if (_selectedImage != null) {
                    widget.companyCubit
                        .createCompany(await createUpdateCompany());
                  } else {
                    showSnackbar(
                      context,
                      'صورة المنشأة مطلوبة..',
                      Colors.red,
                    );
                  }
                }
              },
              child: const Text('سجل جديد'),
            ),
          ),
        ],
      ),
    );
  }

  Future<Company> createUpdateCompany() async {
    late Company newCompany;

    try {
      newCompany = Company(
        id: int.parse(_textControllerForCompanyNameID.text),
        company_name:
            '(${_textControllerForCompanyNamePrefix.text.isEmpty ? "" : _textControllerForCompanyNamePrefix.text}) ${_textControllerForCompanyName.text.isEmpty ? "" : _textControllerForCompanyName.text} (${_textControllerForCompanyNameSuffix.text.isEmpty ? "" : _textControllerForCompanyNameSuffix.text})',
        company_trademark: _textControllerForTradeMark.text,
        company_title_id: int.parse(_textControllerForCompanyTitleId.text),
        company_country_id:
            int.tryParse(_textControllerForCompanyCountryID.text),
        company_type_id: int.tryParse(_textControllerForCompanyTypeId.text),
        company_cat_id: int.tryParse(_textControllerForCompanyCatId.text),
        national_id: _textControllerForCompanyNationalId.text,
        registration_number: _textControllerForCompanyRegisterationNumber.text,
        phone: _textControllerForCompanyTelephoneNumber.text,
        mobile: _textControllerForCompanyMobileNumber.text,
        email: _textControllerForCompanyEmail.text,
        notes: _textControllerForCompanyNotes.text,
        address_desc: _textControllerForCompanyAddressTwo.text,
        a_address: int.tryParse(_textControllerForCompanyAddressOne.text),
        picture: _selectedImage,
        fax: _textControllerForCompanyFaxNumber.text,
        reg_r: _textControllerForCompanyCommercialNumber.text,
      );
    } catch (e, st) {
      // print("here");
      // print("okkkkk");
      // print(e);

      // print(st);
    }
    return newCompany;
  }

  bool checkHasUpdates() {
    Company currentCompany = widget.selectedCompany!;
    return splitCompanyName(currentCompany.company_name!)["ComName"] !=
            _textControllerForCompanyName.text ||
        currentCompany.company_trademark != _textControllerForTradeMark.text ||
        currentCompany.company_title_id.toString() !=
            _textControllerForCompanyTitleId.text ||
        currentCompany.national_id !=
            _textControllerForCompanyNationalId.text ||
        currentCompany.registration_number !=
            _textControllerForCompanyRegisterationNumber.text ||
        currentCompany.company_type_id.toString() !=
            _textControllerForCompanyTypeId.text ||
        currentCompany.company_cat_id.toString() !=
            _textControllerForCompanyCatId.text ||
        currentCompany.company_country_id.toString() !=
            _textControllerForCompanyCountryID.text ||
        currentCompany.mobile != _textControllerForCompanyMobileNumber.text ||
        currentCompany.phone != _textControllerForCompanyTelephoneNumber.text ||
        currentCompany.email != _textControllerForCompanyEmail.text ||
        currentCompany.a_address.toString() !=
            _textControllerForCompanyAddressOne.text ||
        currentCompany.address_desc !=
            _textControllerForCompanyAddressTwo.text ||
        currentCompany.notes != _textControllerForCompanyNotes.text ||
        currentCompany.fax != _textControllerForCompanyFaxNumber.text ||
        currentCompany.reg_r !=
            _textControllerForCompanyCommercialNumber.text ||
        currentCompany.picture != _selectedImage;
  }
}
