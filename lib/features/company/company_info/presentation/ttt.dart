import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/widgets/validations_rules.dart';
import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/company_cubit.dart';
import '../../../../core/widgets/customListTile.dart';
import '../../../../core/widgets/filtering_screen.dart';
import '../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../data/models/company.dart';
import 'package:cool_alert/cool_alert.dart';

import '../data/models/companyInfoFromApi.dart';

class tt extends StatefulWidget {
  const tt({super.key});

  @override
  State<tt> createState() => _FirstCompnayInfoState();
}

class _FirstCompnayInfoState extends State<tt> {
  CompanyCubit companyCubit = GetIt.instance<CompanyCubit>();
  GlobalKey<ImagePickerState> imagePickerKey = GlobalKey<ImagePickerState>();
  GlobalKey<CutomListTileState> dropDwonButtonTypeIdKey =
      GlobalKey<CutomListTileState>();
  GlobalKey<CutomListTileState> dropDwonButtonTypeCatId =
      GlobalKey<CutomListTileState>();
  GlobalKey<CutomListTileState> dropDwonButtonTypeCountryID =
      GlobalKey<CutomListTileState>();

  late Company companyDetail;
  final TextEditingController _textControllerForCompanyNameID =
      TextEditingController();
  final TextEditingController _textControllerForCompanyName =
      TextEditingController();

  final TextEditingController _textControllerForTradeMark =
      TextEditingController();
  final TextEditingController _textControllerForCompanyTitleId =
      TextEditingController();
  final TextEditingController _textControllerForCompanyDesc =
      TextEditingController();
  /////drop
  final TextEditingController _textControllerForCompanyNamePrefix =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNameSuffix =
      TextEditingController();
  ////
  final TextEditingController _textControllerForCompanyCountryID =
      TextEditingController(); //الجنسية

  final TextEditingController _textControllerForCompanyTypeId =
      TextEditingController(); //صغة التسجيل
  final TextEditingController _textControllerForCompanyCommercialNumber =
      TextEditingController();
  final TextEditingController _textControllerForCompanyRegisteration_Number =
      TextEditingController();
  final TextEditingController _textControllerForCompanyCatId =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNationalId =
      TextEditingController();
  final TextEditingController _textControllerForCompanyMobileNumber =
      TextEditingController();
  final TextEditingController _textControllerForCompanyTelephoneNumber =
      TextEditingController();
  final TextEditingController _textControllerForCompanyFaxNumber =
      TextEditingController();
  final TextEditingController _textControllerForCompanyEmail =
      TextEditingController();
  final TextEditingController _textControllerForCompanyAddressOne =
      TextEditingController();
  final TextEditingController _textControllerForCompanyAddressTwo =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNotes =
      TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey(); // Global key for the form
  late dynamic _selectedImage;
  late Company selectedCompany;
  bool _isSearch = false;
  bool _isDisplayAllCompanyData = false;
  int new_id = 0;

  @override
  void initState() {
    // companyCubit.company_Repo.getLatestId().then(
    //   (value) {
    //     new_id = value + 1;
    //     setState(() {});
    //   },
    // );
    super.initState();
  }

  @override
  void dispose() {
    _textControllerForCompanyNameID.dispose();
    _textControllerForCompanyName.dispose();
    _textControllerForTradeMark.dispose();
    _textControllerForCompanyTitleId.dispose();
    _textControllerForCompanyDesc.dispose();
    _textControllerForCompanyNamePrefix.dispose();
    _textControllerForCompanyNameSuffix.dispose();
    _textControllerForCompanyRegisteration_Number.dispose();
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
    _searchController.dispose();
    super.dispose();
  }

  void toggleSearch() {
    setState(() {
      _isSearch = !_isSearch;
      _isDisplayAllCompanyData = false;
    });
  }

  void _onImagePicked(dynamic image) {
    _selectedImage = image;
  }

  Widget searchTextFeild() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.search), // Search icon
        ),
      ),
    );
  }

  fillCompanyData(Company existingCompany) {
    //existingCompany
    // Set the text field controllers with the corresponding data
    try {
      _textControllerForCompanyNameID.text = existingCompany.id.toString();
      List<String> companyName = existingCompany.company_name!.split(" ");
      _textControllerForCompanyName.text = companyName[1];
      _textControllerForCompanyNamePrefix.text = companyName[0];
      _textControllerForCompanyNameSuffix.text = companyName[2];

      _textControllerForTradeMark.text =
          existingCompany.company_trademark ?? '';
      _textControllerForCompanyTitleId.text =
          existingCompany.company_title_id.toString();

      // _textControllerForCompanyNameDescriptionFeildTwo.text =
      //     existingCompany.companyNameDescription2 ?? '';

      // _textControllerForCompanyNationalID.text =
      //     existingCompany.national_id ?? '';
      _textControllerForCompanyRegisteration_Number.text =
          existingCompany.registration_number ?? '';
      // _textControllerForCompanyCommercialNumber.text =
      //     existingCompany. ?? '';
      _textControllerForCompanyTypeId.text =
          existingCompany.company_type_id.toString();
      _textControllerForCompanyCatId.text =
          existingCompany.company_cat_id.toString();
      _textControllerForCompanyCountryID.text =
          existingCompany.company_country_id.toString();
      _textControllerForCompanyMobileNumber.text = existingCompany.mobile ?? '';
      _textControllerForCompanyTelephoneNumber.text =
          existingCompany.phone ?? '';
      // _textControllerForCompanyFaxNumber.text = existingCompany.fax?? '';
      _textControllerForCompanyEmail.text = existingCompany.email ?? '';
      _textControllerForCompanyAddressOne.text =
          existingCompany.a_address.toString();
      _textControllerForCompanyAddressTwo.text =
          existingCompany.address_desc ?? '';
      _textControllerForCompanyNotes.text = existingCompany.notes ?? '';
    } catch (e) {}
    // Set the form to be non-editable initially
    setState(() {
      _isDisplayAllCompanyData = true;
    });
  }

  void clearAllFields() {
    _textControllerForCompanyNameID.clear();

    _textControllerForTradeMark.clear();
    _textControllerForCompanyTitleId.clear();
    _textControllerForCompanyNamePrefix.clear();
    _textControllerForCompanyNameSuffix.clear();
    _textControllerForCompanyName.clear();
    _textControllerForCompanyCountryID.clear();
    _textControllerForCompanyRegisteration_Number.clear();
    _textControllerForCompanyCommercialNumber.clear();
    _textControllerForCompanyTypeId.clear();
    _textControllerForCompanyCatId.clear();
    _textControllerForCompanyNationalId.clear();
    _textControllerForCompanyMobileNumber.clear();
    _textControllerForCompanyTelephoneNumber.clear();
    _textControllerForCompanyFaxNumber.clear();
    _textControllerForCompanyEmail.clear();
    _textControllerForCompanyAddressOne.clear();
    _textControllerForCompanyAddressTwo.clear();
    _textControllerForCompanyNotes.clear();
    imagePickerKey = GlobalKey<ImagePickerState>();
    dropDwonButtonTypeIdKey = GlobalKey<CutomListTileState>();
    dropDwonButtonTypeCatId = GlobalKey<CutomListTileState>();
    dropDwonButtonTypeCountryID = GlobalKey<CutomListTileState>();

    _textControllerForCompanyTypeId.clear();
    _searchController.clear();
    _textControllerForCompanyCatId.text = "";
    _textControllerForCompanyTypeId.text = "";
    _textControllerForCompanyCountryID.text = "";
    _selectedImage = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearch ? Text('الشركات') : Text('المعلومات الأولية للمنشأة'),
        centerTitle: _isSearch ? true : false,
        elevation: 0,
        backgroundColor: MyColors.custom_light_grey,
        automaticallyImplyLeading: _isSearch ? false : true,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () {
                  toggleSearch();
                },
                icon: Icon(
                  _isSearch ? Icons.close : Icons.search,
                  color: MyColors.custom_yellow,
                  size: 30.0,
                )),
          ),
          _isDisplayAllCompanyData
              ? Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                      onPressed: () {
                        _isDisplayAllCompanyData = false;

                        clearAllFields();
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_circle_rounded,
                        color: MyColors.custom_yellow,
                        size: 30.0,
                      )),
                )
              : Text("")
        ],
      ),
//       body: _isSearch
//           ? Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: SafeArea(
//                 child: FilteringScreen(
//                   title: 'الشركات',
//                   // onCompanySelected: (isSearch) {
//                   //   _isSearch = isSearch;
//                   //   // selectedCompany = Company;
//                   //   // toggleSearch();
//                   // },
//                   showCompanyCubit: companyCubit,
//                 ),
//               ),
//             )
//           : BlocListener<CompanyCubit, CompanyState>(
//               listener: (context, state) {
//                 if (state is CompanyLoading) {
//                   CoolAlert.show(
//                     context: context,
//                     type: CoolAlertType.loading,
//                     text: state.message,
//                   );
//                 } else if (state is CompanySuccess) {
//                   clearAllFields();

//                   CoolAlert.show(
//                     title: "تم الانشاء",
//                     context: context,
//                     type: CoolAlertType.success,
//                     text: state.message,
//                   );

// //
//                   // setState(() {});
//                 } else if (state is CompanyError) {
//                   // Show error message
//                   CoolAlert.show(
//                     context: context,
//                     type: CoolAlertType.error,
//                     text: 'خطأ',
//                   );
//                 } else if (state is CompanyDeletedSuccess) {
//                   CoolAlert.show(
//                     title: "تم الحذف",
//                     context: context,
//                     type: CoolAlertType.success,
//                     text: state.message,
//                   );
//                   _isDisplayAllCompanyData = false;
//                   clearAllFields();
//                 } else if (state is CompanyUpdatedSuccess) {
//                   CoolAlert.show(
//                     title: "تم التعديل",
//                     context: context,
//                     type: CoolAlertType.success,
//                     text: state.message,
//                   );
//                   _isDisplayAllCompanyData = false;
//                   clearAllFields();
//                   // _isShowing = !_isShowing;

//                   // toggleSearch();
//                 } else if (state is CompanyNotFound) {
//                   CoolAlert.show(
//                     context: context,
//                     type: CoolAlertType.error,
//                     text: state.message,
//                   );
//                   clearAllFields();
//                   toggleSearch();
//                   // setState(() {});
//                 } else if (state is DisplyingDataSuccess) {
//                   CoolAlert.show(
//                     context: context,
//                     type: CoolAlertType.success,
//                     text: state.message,
//                   );
//                   fillCompanyData(state.data);
//                   _isSearch = false;

//                   clearAllFields();
//                   // toggleSearch();
//                 } else {
//                   CoolAlert.show(
//                     context: context,
//                     type: CoolAlertType.error,
//                     title: "حدثت مشكلة",
//                     text: "!!!خطأ",
//                   );
//                 }
//               },
//               child: Container(
//                 padding: EdgeInsets.only(bottom: 8.0),
//                 color: Colors.white24.withOpacity(0.8),
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         FormCompany(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
      body: _isSearch
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'بحث :  ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: TextField(
                              controller: _searchController,
                              onChanged: companyCubit.filterData,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade200,
                                  focusColor: MyColors.custom_blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: BlocConsumer<CompanyCubit, CompanyState>(
                        builder: (context, state) {
                          if (state is CompanyLoading) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: MyColors.custom_yellow,
                            ));
                          } else if (state is CompanyFromAPISuccess) {
                            final List<CompanyInfoFromApi> companyList =
                                state.company;
                            return _buildCompanyList(companyList);
                          } else if (state is CompanyError) {
                            return Center(
                                child: Text(
                              'مشكلة في تحميل البيانات (افحص الانترنت)',
                              style: TextStyle(color: MyColors.custom_blue),
                            ));
                          } else if (state is CompanySearch) {
                            return _buildCompanyList(state.data);
                          }
                          return Center();
                        },
                        listener: (BuildContext context, CompanyState state) {
                          if (state is DisplayingDataSuccess) {
                            _isSearch = false;
                            _isDisplayAllCompanyData = true;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : BlocListener<CompanyCubit, CompanyState>(
              listener: (context, state) {
                if (state is CompanyLoading) {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.loading,
                    text: state.message,
                  );
                } else if (state is CompanySuccess) {
                  clearAllFields();

                  CoolAlert.show(
                    title: "تم الانشاء",
                    context: context,
                    type: CoolAlertType.success,
                    text: state.message,
                  );
                } else if (state is CompanyError) {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: 'خطأ',
                  );
                } else if (state is CompanyDeletedSuccess) {
                  CoolAlert.show(
                    title: "تم الحذف",
                    context: context,
                    type: CoolAlertType.success,
                    text: state.message,
                  );
                  _isDisplayAllCompanyData = false;
                  clearAllFields();
                } else if (state is CompanyUpdatedSuccess) {
                  CoolAlert.show(
                    title: "تم التعديل",
                    context: context,
                    type: CoolAlertType.success,
                    text: state.message,
                  );
                  _isDisplayAllCompanyData = false;
                  clearAllFields();
                } else if (state is CompanyNotFound) {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: state.message,
                  );
                  clearAllFields();
                  toggleSearch();
                } else if (state is DisplyingDataSuccess) {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: state.message,
                  );
                  fillCompanyData(state.data);
                  _isSearch = false;
                  clearAllFields();
                } else {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    title: "حدثت مشكلة",
                    text: "!!!خطأ",
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 8.0),
                color: Colors.white24.withOpacity(0.8),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormCompany(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildCompanyList(List<CompanyInfoFromApi> companyList) {
    return companyList.isEmpty
        ? Center(
            child: Text(
            'لا يوجد شركات',
            style: TextStyle(color: MyColors.custom_blue),
          ))
        : ListView.builder(
            itemCount: companyList.length,
            itemBuilder: (context, index) {
              final data = companyList[index];
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: MyColors.custom_light_grey,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                    onTap: () {
                      companyCubit.fetchCompanyDetails(data.id);
                    },
                    leading: Text(
                      data.id.toString(),
                      style: TextStyle(
                        color: MyColors.custom_blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      data.companyName,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.business_rounded,
                      color: MyColors.custom_yellow,
                    )),
              );
            },
          );
  }

  Widget FormCompany() {
    return Column(
      children: [
        CutomListTileWithTextFeild(
          // enabled: _isEditable,
          validator: (value) => IsTextEmpty(value),
          controllers: [
            _textControllerForCompanyNameID,
            _textControllerForCompanyNamePrefix,
            _textControllerForCompanyName,
            _textControllerForCompanyNameSuffix,
          ],
          numOfTxTf: 4,
          hintLabel: [new_id.toString(), "", "", ""],
          labelExpanded: [1, 2, 1, 1],
          title: 'اسم المنشأة',
        ),
        CutomListTileWithTextFeild(
            validator: (value) => IsTextEmpty(value),
            controllers: [
              _textControllerForTradeMark,
            ],
            title: ' العلامة التجارية',
            numOfTxTf: 1),
        CutomListTileWithTextFeild(
          validator: (value) => IsTextEmpty(value),
          controllers: [
            _textControllerForCompanyTitleId,
            _textControllerForCompanyDesc,
          ],
          title: 'وصف المسمى',
          numOfTxTf: 2,
        ),
        CutomListTileWithTextFeild(
          // validator: (value) =>
          //     numberGreaterThanFourValidation(value),
          controllers: [
            _textControllerForCompanyNationalId,
          ],
          title: 'الرقم الوطني للمنشأة ',
          numOfTxTf: 1,
        ),
        CutomListTileWithTextFeild(
          // validator: (value) =>
          //     numberGreaterThanFourValidation(value),
          controllers: [
            _textControllerForCompanyRegisteration_Number,
          ],
          title: 'رقم تسجيل المنشأة  ',
          numOfTxTf: 1,
        ),
        CutomListTileWithTextFeild(
          // validator: (value) =>
          //     numberGreaterThanFourValidation(value),
          controllers: [
            _textControllerForCompanyCommercialNumber,
          ],
          title: ' رقم السجل التجاري',
          numOfTxTf: 1,
        ),
        CustomListTile(
            element: CutomListTileWithdrop(
              key: dropDwonButtonTypeIdKey,
              validator: (value) => numberValidation(value),
              onChanged: (dynamic newValue) {
                _textControllerForCompanyTypeId.text = newValue;
              },
              withTxt: true,
              options: ['شركة تضامنية', 'شركة غير تضامنية'],
            ),
            title: 'صفة تسجيل المنشأة'),
        CustomListTile(
            element: CutomListTileWithdrop(
              key: dropDwonButtonTypeCatId,
              validator: (value) => numberValidation(value),
              onChanged: (dynamic newValue) {
                _textControllerForCompanyCatId.text = newValue;
              },
              withTxt: true,
              options: ['منشأة حكومية', 'منشأة خاصة'],
            ),
            title: 'نوع المنشأة'),
        CustomListTile(
            element: CutomListTileWithdrop(
              key: dropDwonButtonTypeCountryID,
              validator: (value) => numberValidation(value),
              onChanged: (dynamic newValue) {
                _textControllerForCompanyCountryID.text = newValue;
              },
              withTxt: true,
              options: ['اردنية', 'سعودية'],
            ),
            title: 'جنسية المنشأة'),
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
            key: imagePickerKey,
            defult_icon: Icons.home,
            onImagePicked: _onImagePicked,
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
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 3,
          color: MyColors.custom_dark_grey,
        ),
        _isDisplayAllCompanyData
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0), // Adjust padding
                        ),
                        onPressed: () {
                          companyCubit.UpdateCompany(
                              selectedCompany.id!,
                              _textControllerForCompanyNamePrefix.text +
                                  " " +
                                  _textControllerForCompanyName.text +
                                  " " +
                                  _textControllerForCompanyNameSuffix.text);
                        },
                        child: Text(
                          "تعديل",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0), // Adjust padding
                        ),
                        onPressed: () {
                          // Show confirmation dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: MyColors.custom_yellow,
                                title: Text('تأكيد الحذف'),
                                content: Text(
                                    'هل أنت متأكد أنك تريد حذف هذه الشركة؟'),
                                actions: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: MyColors
                                          .custom_blue, // Change this to your desired color
                                      foregroundColor: Colors
                                          .white, // This sets the text color
                                    ),
                                    onPressed: () {},
                                    child: Text('إلغاء'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors
                                          .red, // Change this to your desired color
                                      foregroundColor: Colors
                                          .white, // This sets the text color
                                    ),
                                    onPressed: () {
                                      // User confirmed the deletion
                                      companyCubit
                                          .deleteCompany(selectedCompany.id!);
                                      // Close the dialog and return to the previous screen
                                      Navigator.of(context).pop();
                                      print("حذف");
                                    },
                                    child: Text('حذف'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        // onPressed: () {
                        //   companyCubit.deleteCompany(selectedCompany.id!);

                        //   print("حذف");
                        // },
                        child: Text("حذف ",
                            style: TextStyle(color: Colors.white))),
                  ),
                ]),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: MyColors.custom_blue, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0), // Adjust padding
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (imagePickerKey.currentState?.picker != null) {
                              // print(companyCubit.createCompany(createCompany()));

                              // final companyService =
                              //     createCompanyWebService(createCompany());
                              companyCubit.createCompany(createCompany());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("حقل اختيار صورة مطلوب *"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            // context
                            //     .read<CompanyCubit>()
                            //     .createCompany(createCompany());
                          }
                        },
                        child: const Text('سجل جديد'),
                      ),
                    ),
                  ],
                ),
              )
      ],
    );
  }

  Company createCompany() {
    late Company newCompany;

    // uploadFile(_selectedImage);
    newCompany = Company(
      company_name:
          '${_textControllerForCompanyNamePrefix.text} ${_textControllerForCompanyName.text} ${_textControllerForCompanyNameSuffix.text}',
      company_trademark: _textControllerForTradeMark.text,
      company_title_id: int.parse(_textControllerForCompanyTitleId.text),
      company_country_id: int.tryParse(_textControllerForCompanyCountryID.text),
      company_type_id: int.tryParse(_textControllerForCompanyTypeId.text),
      company_cat_id: int.tryParse(_textControllerForCompanyCatId.text),
      national_id: _textControllerForCompanyNationalId.text,
      registration_number: _textControllerForCompanyRegisteration_Number.text,
      phone: _textControllerForCompanyTelephoneNumber.text,
      mobile: _textControllerForCompanyMobileNumber.text,
      email: _textControllerForCompanyEmail.text,
      notes: _textControllerForCompanyNotes.text,
      a_address: int.tryParse(_textControllerForCompanyAddressOne.text),
      address_desc: _textControllerForCompanyAddressTwo.text,
      picture: _selectedImage,
    );

    return newCompany;
  }

  Future<void> createCompanyWebService(Company company) async {
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://srv568036.hstgr.cloud/api/',
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    ));

    // Convert company data to a Map
    Map<String, dynamic> companyData = company.toJson();

    // Add image data to FormData
    MultipartFile? multipartFile;
    if (company.picture is Uint8List) {
      // Handle web image data
      multipartFile = MultipartFile.fromBytes(
        company.picture,
        filename: 'company_picture.png', // Adjust the filename as needed
      );
    } else if (company.picture is File) {
      // Handle mobile image data
      multipartFile = await MultipartFile.fromFile(
        company.picture.path,
        filename: _selectedImage!.path.split('/').last,
      );
    }

    // Add image data to companyData if needed
    companyData['picture'] = multipartFile;

    // Create FormData
    FormData formData = FormData.fromMap(companyData);

    final response = await dio.post(
      'company/create-company',
      data: formData,
    );
  }
}
