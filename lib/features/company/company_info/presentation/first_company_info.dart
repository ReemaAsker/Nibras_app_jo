import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nibras_group_jor/core/extentiions/find_where_droppable.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/widgets/validations_rules.dart';
import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/company_cubit.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/CompanyRgistrationStatus.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_country_national.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_title.dart';
import '../../../../core/helper/connectivity_service.dart';
import '../../../../core/widgets/customListTile.dart';
import '../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../data/models/CompanyType.dart';
import '../data/models/company.dart';
import 'package:cool_alert/cool_alert.dart';

import '../data/models/companyInfoFromApi.dart';

class FirstCompnayInfo extends StatefulWidget {
  const FirstCompnayInfo({super.key});

  @override
  State<FirstCompnayInfo> createState() => _FirstCompnayInfoState();
}

class _FirstCompnayInfoState extends State<FirstCompnayInfo> {
  CompanyCubit companyCubit = GetIt.instance<CompanyCubit>();
  String selectedCompanyTitleId = "";
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

  final GlobalKey<CustomListTileWithDropState> customListTileWithDropKey =
      GlobalKey<CustomListTileWithDropState>();
  Color? noActionColor;
  late dynamic _selectedImage = Icons.home;
  late int selectedId;
  bool _isSearch = false;
  bool _isDisplayAllCompanyData = false;
  int new_id = 0;
  // late dynamic SelecImage = Icons.home;
  List<CompanyRgistrationStatus> companyRgistrationStatus = [];
  List<CompanyCountryNational> companyNational = [];
  List<CompanyTitle> companyTitles = [];
  List<CompanyType> companyType = [
    CompanyType(id: 1, type: "منشأة خاصة"),
    CompanyType(id: 2, type: "منشأة حكومية")
  ];
  late String created_at;
  late String updated_at;
  // final ConnectivityService connectivityService = ConnectivityService();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late Company currentCompany;
  @override
  void initState() {
    companyCubit.noState().then((value) => new_id = value + 1);

    // companyCubit.noState();
    // Listen to connectivity changes
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen((result) {
    //   // Print the result to debug and see the connectivity change
    //   print("Connectivity Result: $result");

    //   if (result != ConnectivityResult.none) {
    //     print("Connected to the internet");
    //     companyCubit.noState();
    //   } else {
    //     print("NOOOOOOOOOOOOOOOOOOO Internet");
    //     // Handle no internet connection scenario
    //   }
    // });
    // print(_connectivitySubscription);
    // _connectivitySubscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((List<ConnectivityResult> result) {
    //   print("**************");
    //   print(result);
    super.initState();
    // });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();

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
    try {
      setState(() {
        _isSearch = !_isSearch;
        _isDisplayAllCompanyData = false;
      });
    } catch (e, tt) {
      print("!!!!!!!!!!!!!!!!!");
      print(e);
      print(tt);
    }
  }

  void _onImagePicked(dynamic image) {
    _selectedImage = image;
  }

  Widget searchTextFeild() {
    return Container(
      child: TextFormField(
        onChanged: companyCubit.filterData,
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'بحث عن شركة..',
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
//  String input = "(Eng.)Ahmd Ali(okok)";
//
// }

  // Map<String, String> splitText(String input) {
  //   // Define the regular expressions to extract the required parts
  //   final RegExp prefixRegex = RegExp(r'\(([^)]+)\)');
  //   final RegExp suffixRegex = RegExp(r'\(([^)]+)\)$');

  //   // Extract the first part from parentheses
  //   String first = '';
  //   final firstMatch = prefixRegex.firstMatch(input);
  //   if (firstMatch != null) {
  //     first = firstMatch.group(1)!.trim();
  //   }

  //   // Extract the suffix part from parentheses at the end
  //   String suffix = '';
  //   final suffixMatch = suffixRegex.firstMatch(input);
  //   if (suffixMatch != null) {
  //     suffix = suffixMatch.group(1)!.trim();
  //   }

  //   // Extract the name part (the remaining text between the parentheses)
  //   String ComName =
  //       input.replaceAll(prefixRegex, '').replaceAll(suffixRegex, '').trim();

  //   return {
  //     'prefix': first,
  //     'ComName': ComName,
  //     'suffix': suffix,
  //   };
  // }
  Map<String, String> splitText(String input) {
    // Define the regular expressions to extract the required parts
    final RegExp prefixRegex = RegExp(r'\(([^)]+)\)');
    final RegExp suffixRegex = RegExp(r'\(([^)]+)\)$');

    // Extract the prefix part from parentheses at the beginning
    String prefix = '';
    final prefixMatch = prefixRegex.firstMatch(input);
    if (prefixMatch != null) {
      prefix = prefixMatch.group(1)!.trim();
    }

    // Extract the suffix part from parentheses at the end
    String suffix = '';
    final suffixMatch = suffixRegex.firstMatch(input);
    if (suffixMatch != null) {
      suffix = suffixMatch.group(1)!.trim();
    }

    // Extract the name part (the remaining text between the parentheses)
    String comName =
        input.replaceAll(prefixRegex, '').replaceAll(suffixRegex, '').trim();

    // Remove the extra spaces around parentheses if they are present
    if (prefix.isEmpty) {
      comName = comName.replaceAll(RegExp(r'\s*\(\s*\)'), '');
    }
    if (suffix.isEmpty) {
      comName = comName.replaceAll(RegExp(r'\s*\(\s*\)$'), '');
    }

    return {
      'prefix': prefix,
      'ComName': comName,
      'suffix': suffix,
    };
  }

  fillCompanyData(Company existingCompany) {
    currentCompany = existingCompany;
    // print("datee");
    // print(existingCompany.created_at.runtimeType);
    // print(existingCompany.updated_at.runtimeType);

    //existingCompany
    // Set the text field controllers with the corresponding data
    try {
      _textControllerForCompanyNameID.text =
          existingCompany.id.toString().isEmpty
              ? ""
              : existingCompany.id.toString();

      Map<String, String> splitting = splitText(existingCompany.company_name!);

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

      // _textControllerForCompanyNameDescriptionFeildTwo.text =
      //     existingCompany.companyNameDescription2 ?? '';

      _textControllerForCompanyNationalId.text =
          existingCompany.national_id ?? '';
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
      _selectedImage = existingCompany.picture ?? Icons.home;
      _textControllerForCompanyFaxNumber.text = existingCompany.fax.toString();
      _textControllerForCompanyCommercialNumber.text =
          existingCompany.reg_r.toString();
      created_at = existingCompany.created_at.toString();
      updated_at = existingCompany.created_at.toString();
      // If you are using a CustomListTileWithDrop for Company Title, you can pass the ID
      // setState(() {
      // });
    } catch (e, str) {
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
      print(e);
      print(str);
    }
    // Set the form to be non-editable initially
    setState(() {
      _isDisplayAllCompanyData = true;
    });
  }

  // void clearAllFields() {
  //   _textControllerForCompanyNameID.clear();
  //   _textControllerForCompanyDesc.clear();
  //   _textControllerForTradeMark.clear();
  //   _textControllerForCompanyTitleId.clear();
  //   _textControllerForCompanyNamePrefix.clear();
  //   _textControllerForCompanyNameSuffix.clear();
  //   _textControllerForCompanyName.clear();
  //   _textControllerForCompanyCountryID.clear();
  //   _textControllerForCompanyRegisteration_Number.clear();
  //   _textControllerForCompanyCommercialNumber.clear();
  //   _textControllerForCompanyTypeId.clear();
  //   _textControllerForCompanyCatId.clear();
  //   _textControllerForCompanyNationalId.clear();
  //   _textControllerForCompanyMobileNumber.clear();
  //   _textControllerForCompanyTelephoneNumber.clear();
  //   _textControllerForCompanyFaxNumber.clear();
  //   _textControllerForCompanyEmail.clear();
  //   _textControllerForCompanyAddressOne.clear();
  //   _textControllerForCompanyAddressTwo.clear();
  //   _textControllerForCompanyNotes.clear();
  //   imagePickerKey = GlobalKey<ImagePickerState>();
  //   companyTypeKey = GlobalKey<CustomListTileWithDropState<CompanyType>>();

  //   companyTitleKey = GlobalKey<CustomListTileWithDropState<CompanyTitle>>();
  //   companyRgistrationStatusKey =
  //       GlobalKey<CustomListTileWithDropState<CompanyRgistrationStatus>>();
  //   countryNationalKey =
  //       GlobalKey<CustomListTileWithDropState<CompanyCountryNational>>();
  //   // dropDwonButtonTypeIdKey = GlobalKey<CutomListTileState>();
  //   // dropDwonButtonTypeCatId = GlobalKey<CutomListTileState>();
  //   // dropDwonButtonTypeCountryID = GlobalKey<CutomListTileState>();

  //   _textControllerForCompanyTypeId.clear();
  //   _searchController.clear();
  //   _textControllerForCompanyCatId.text = "";
  //   _textControllerForCompanyTypeId.text = "";
  //   _textControllerForCompanyCountryID.text = "";
  //   _selectedImage = null;
  //   setState(() {});
  // }
  void clearAllFields() {
    // Clear all text controllers
    _textControllerForCompanyNameID.text = new_id.toString();
    _textControllerForCompanyDesc.clear();
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
    // _textControllerForCompanyAddressOne.clear();
    // _textControllerForCompanyAddressTwo.clear();
    _textControllerForCompanyNotes.clear();

    // Clear the search controller
    _searchController.clear();

    // Reset image and other fields
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
        automaticallyImplyLeading:
            _isSearch || _isDisplayAllCompanyData ? false : true,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () {
                  try {
                    toggleSearch();

                    if (!_isSearch) {
                      companyCubit.noState();
                    }
                  } catch (e, st) {
                    print("***********************");
                    print(e);
                    print(st);
                  }
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
                        companyCubit.noState();
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
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return BlocListener<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if (state is NoState) {
          print("ggggggggggggggggggggggggggg");
          new_id = state.lastId + 1;
          companyRgistrationStatus = state.companyRgistrationStatus;
          companyNational = state.nationalites;
          companyTitles = state.CompanyTitles;
          // companyTitles.forEach((title) {
          //   print("title ${title.toJson()}");
          // });
          clearAllFields();
        } else if (state is CompanyFromAPILoading) {
        } else if (state is CompanyFilteringLoading) {
        } else if (state is CompanySearch) {
        } else if (state is NoStateLoading) {
        } else if (state is CompanyLoading) {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.loading,
            text: state.message,
          );
        } else if (state is CompanySuccess) {
          CoolAlert.show(
            title: "تم الانشاء",
            context: context,
            type: CoolAlertType.success,
            text: state.message,
          );
          companyCubit.noState();
        } else if (state is CompanyError) {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: ' ( مشكلة في الانترنت)خطأ',
          );
          noActionColor = Colors.black;
          // companyCubit.noState();
        } else if (state is CompanyDeletedSuccess) {
          CoolAlert.show(
            title: "تم الحذف",
            context: context,
            type: CoolAlertType.success,
            text: state.message,
          );
          _isDisplayAllCompanyData = false;
          companyCubit.noState();
        } else if (state is CompanyUpdatedSuccess) {
          CoolAlert.show(
            title: "تم التعديل",
            context: context,
            type: CoolAlertType.success,
            text: state.message,
          );
          _isDisplayAllCompanyData = true;
          // clearAllFields();
          companyCubit.noState();
          // companyCubit.noState();
        }
        // else if (state is CompanyNotFound) {
        //   CoolAlert.show(
        //     context: context,
        //     type: CoolAlertType.error,
        //     text: state.message,
        //   );
        //   clearAllFields();
        //   toggleSearch();
        // }
        //else if (state is DisplyingDataSuccess) {
        //   CoolAlert.show(
        //     context: context,
        //     type: CoolAlertType.success,
        //     text: state.message,
        //   );
        //   fillCompanyData(state.data);
        //   // _isSearch = false;
        //   clearAllFields();
        else if (state is DisplayingDataSuccess) {
          _isSearch = false;
          _isDisplayAllCompanyData = true;
          selectedId = state.data.id!;

          fillCompanyData(state.data);
          CoolAlert.show(
            context: context,
            title:
                "تم تحميل بيانات الشركة ${splitText(state.data.company_name!)["ComName"]} بنجاح",
            type: CoolAlertType.success,
          );
        } else if (state is CompanyFromAPISuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('تم تحميل البيانات'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ));
        } else {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "حدثت مشكلة",
            text: "!!!خطأ",
          );
        }
      },
      child: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<CompanyCubit, CompanyState>(
            builder: (context, state) {
              if (state is DisplayingDataSuccess) {
                print("select state");
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormCompany(new_id, selectedCompany: state.data),
                    ],
                  ),
                );
              }
              if (state is CompanyFromAPILoading ||
                  state is CompanyFilteringLoading ||
                  state is NoStateLoading) {
                return Center(
                    child: Column(
                  children: [
                    // CircularProgressIndicator(
                    //   color: MyColors.custom_yellow,
                    // ),

                    Center(child: Image.asset('assets/loading.gif')),

                    Text(
                      "جاري التحميل ..",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ));
              } else if (state is CompanyFromAPISuccess) {
                final List<CompanyInfoFromApi> companyList = state.company;
                return _buildCompanyList(companyList);
              } else if (state is CompanyError && _isSearch) {
                return Center(
                    child: Text(
                  'مشكلة في تحميل البيانات (افحص الانترنت)',
                  style: TextStyle(color: MyColors.custom_blue),
                ));
              } else if (state is CompanySearch) {
                return _buildCompanyList(state.data);
              }
              if (_isSearch) {
                companyCubit.filterCompanies();
              } else if (state is NoState) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormCompany(state.lastId + 1),
                    ],
                  ),
                );
              }

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormCompany(new_id),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyList(List<CompanyInfoFromApi> companyList) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: searchTextFeild(),
        ),
        companyList.isEmpty
            ? Center(
                child: Text(
                'لا يوجد شركات',
                style: TextStyle(color: MyColors.custom_blue),
              ))
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: companyList.length,
                itemBuilder: (context, index) {
                  int itemCount = companyList.length;
                  int reversedIndex = itemCount - 1 - index;
                  final data = companyList[reversedIndex];
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
                          splitText(data.companyName)["ComName"]!,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        trailing: Icon(
                          Icons.business_rounded,
                          color: MyColors.custom_yellow,
                        )),
                  );
                },
              ),
      ],
    );
  }

  Widget FormCompany(int nId, {Company? selectedCompany}) {
    return Column(
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
          hintLabel: [new_id.toString(), "", "", ""],
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
            items: companyTitles,
            initialValue: companyTitles
                .findWhereCompanyTitle(selectedCompany?.company_title_id),
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
        // CustomListTile(
        //     element: CustomListTileWithDrop<CompanyTitle>(
        //       key: customListTileWithDropKey,
        //       items: companyTitles,
        //       itemFieldExtractor: (item) =>
        //           (item as CompanyTitle).titlePrefix ?? '',
        //       itemFieldExtractorSuffix: (item) =>
        //           (item as CompanyTitle).titleSuffix ?? '',
        //       idExtractor: (item) => (item as CompanyTitle).id.toString(),
        //       onChanged: (selectedItem) {
        //         _textControllerForCompanyTitleId.text =
        //             (selectedItem as CompanyTitle).id.toString();
        //         _textControllerForCompanyNamePrefix.text =
        //             (selectedItem as CompanyTitle).titlePrefix.toString();
        //         _textControllerForCompanyNameSuffix.text =
        //             (selectedItem as CompanyTitle).titleSuffix.toString();
        //       },
        //         initialId: selectedCompanyTitleId, // Pass the ID here

        //     ),
        //     title: 'وصف المسمى'),
        CustomListTile(
            element: CustomListTileWithDrop<CompanyRgistrationStatus>(
              validator: (selectedItem) => IsTextEmpty(selectedItem),
              items: companyRgistrationStatus, // List of CompanyType objects
              initialValue: companyRgistrationStatus
                  .findWhereCompanyType(selectedCompany?.company_type_id),
              onChanged: (selectedItem) {
                _textControllerForCompanyTypeId.text =
                    (selectedItem as CompanyRgistrationStatus).id.toString();

                // Handle the selected item
              },
            ),
            title: 'صفة تسجيل المنشأة'),
        CustomListTile(
            element: CustomListTileWithDrop<CompanyCountryNational>(
              validator: (selectedItem) => IsTextEmpty(selectedItem),
              items: companyNational,
              initialValue: companyNational
                  .findWhereCompanyCountry(selectedCompany?.company_country_id),
              onChanged: (selectedItem) {
                _textControllerForCompanyCountryID.text =
                    (selectedItem as CompanyCountryNational).id.toString();
              },
            ),
            title: 'جنسية المنشأة'),
        CustomListTile(
            element: CustomListTileWithDrop<CompanyType>(
              validator: (selectedItem) => IsTextEmpty(selectedItem),
              items: companyType,
              initialValue: companyType
                  .findWhereCompanyCategory(selectedCompany?.company_cat_id),
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
            _textControllerForCompanyRegisteration_Number,
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
        _isDisplayAllCompanyData
            ? Center(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomListTileWithDate(
                        forEdit: false,
                        title: '  تاريخ السجل   ',
                        initialDateTime: updated_at,
                      ),
                    ),
                    Expanded(
                      child: CustomListTileWithDate(
                        forEdit: false,
                        title: '  تاريخ التحديث   ',
                        initialDateTime: updated_at,
                      ),
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
                        onPressed: () async {
                          if (checkHasUpdates()) {
                            Company cc = await updateCreateCompany();
                            companyCubit.UpdateCompany(cc);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  backgroundColor: MyColors.custom_blue,
                                  content: Text('.. لم تقم بأي تعديلات')),
                            );
                          }
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
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
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
                                      print("!!!!!!!!!!!!!!!!!!!!!!!!!!");
                                      print(selectedId);
                                      companyCubit.deleteCompany(selectedId);

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
                          backgroundColor: noActionColor ??
                              MyColors.custom_blue, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0), // Adjust padding
                        ),
                        onPressed: () {
                          if (nId == 1) {
                            return;
                          } else if (_formKey.currentState!.validate()) {
                            if (_selectedImage != null) {
                              companyCubit.createCompany(createCompany());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('صورة المنشأة مطلوبة..')),
                              );
                            }
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
        registration_number: _textControllerForCompanyRegisteration_Number.text,
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
      print("here");
      print("okkkkk");
      print(e);

      print(st);
    }
    return newCompany;
  }

  bool checkHasUpdates() {
    return splitText(currentCompany.company_name!)["ComName"] !=
            _textControllerForCompanyName.text ||
        currentCompany.company_trademark != _textControllerForTradeMark.text ||
        currentCompany.company_title_id.toString() !=
            _textControllerForCompanyTitleId.text ||
        currentCompany.national_id !=
            _textControllerForCompanyNationalId.text ||
        currentCompany.registration_number !=
            _textControllerForCompanyRegisteration_Number.text ||
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

  Future<Company> updateCreateCompany() async {
    late Company newCompany;
    // Dio dio = Dio();
    // // Download the image data as bytes using Dio
    // final response = await dio.get<List<int>>(
    //   _selectedImage,
    //   options: Options(responseType: ResponseType.bytes),
    // );
    // Uint8List imageBytes;
    // if (response.statusCode == 200) {
    //   // Convert the downloaded image data to Uint8List
    //   imageBytes = Uint8List.fromList(response.data!);

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
        registration_number: _textControllerForCompanyRegisteration_Number.text,
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
      print("here");
      print("okkkkk");
      print(e);

      print(st);
    }
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

  Future<void> updateCompanyWebService(Company company) async {
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
      'company/update-company',
      data: formData,
    );
  }
}
// Future<Response<dynamic>> updateCompany({
//   required int id,
//   required String? companyName,
//   required String? companyTrademark,
//   required int? companyTitleId,
//   required int? companyCountryId,
//   required int? companyTypeId,
//   required int? companyCatId,
//   required String? nationalId,
//   required String? registrationNumber,
//   required String? phone,
//   required String? mobile,
//   required String? email,
//   String? notes,
//   required int? aAddress,
//   required String? addressDesc,
//   File? picture, // Use File type to represent the image
// }) async {
//   try {
//     // Create FormData
//     final formData = FormData.fromMap({
//       'id': id,
//       'company_name': companyName,
//       'company_trademark': companyTrademark,
//       'company_title_id': companyTitleId,
//       'company_country_id': companyCountryId,
//       'company_type_id': companyTypeId,
//       'company_cat_id': companyCatId,
//       'national_id': nationalId,
//       'registration_number': registrationNumber,
//       'phone': phone,
//       'mobile': mobile,
//       'email': email,
//       'notes': notes,
//       'a_address': aAddress,
//       'address_desc': addressDesc,
//       // Add picture if it's provided and handle it as MultipartFile
//       if (picture != null)
//         'picture':
//             await MultipartFile.fromFile(picture.path, filename: 'picture.jpg'),
//     });

//     // Send the POST request
//     final response = await _dio.post(
//       'company/update-company', // Adjust the endpoint if necessary
//       data: formData,
//     );

//     return response;
//   } catch (e) {
//     // Handle errors appropriately
//     throw Exception('Failed to update company: $e');
//   }
// }
