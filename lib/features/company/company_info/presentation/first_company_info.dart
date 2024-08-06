import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibras_group_jor/core/widgets/custom_floating_action_button.dart';
import 'package:nibras_group_jor/core/widgets/validations_rules.dart';
import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/company_cubit.dart';

import '../../../../core/widgets/customListTile.dart';
import '../../../../core/widgets/custom_botoom_sheet.dart';
import '../../../../core/widgets/custom_drop_down_with_date.dart';
import '../../../../core/widgets/custom_list_tile_with_drop.dart';
import '../../../../core/widgets/custom_list_tile_with_tet_feild.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../data/company.dart';

class FirstCompnayInfo extends StatefulWidget {
  const FirstCompnayInfo({super.key});

  @override
  State<FirstCompnayInfo> createState() => _FirstCompnayInfoState();
}

class _FirstCompnayInfoState extends State<FirstCompnayInfo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> allcompanies = [
    {"التسلسل": '1', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
    {"التسلسل": '1', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
    {"التسلسل": '1', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
    {"التسلسل": '1', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
    {
      "التسلسل": '2',
      "اسم المنشأة": ' شركة اوبتما لادارة الخدمات والنفقات الطبية التأمينية'
    },
    {"التسلسل": '3', "اسم المنشأة": ' الفوسفات الاردنية المحدودة'},
    {"التسلسل": '4', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
    {"التسلسل": '8', "اسم المنشأة": 'شركة الفوسقات الفلسطينية المحدودة'},
    {"التسلسل": '9', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
    {"التسلسل": '10', "اسم المنشأة": 'شركةالفوسفات  الاردنية المحدودة'},
    {"التسلسل": '88', "اسم المنشأة": 'شركةالفوسفات  الاردنية المحدودة'},
    {"التسلسل": '30', "اسم المنشأة": 'شركةالفوسفات  الاردنية المحدودة'},
    {"التسلسل": '5', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
    {"التسلسل": '6', "اسم المنشأة": 'شركة الفوسفات الاردنية المحدودة'},
  ];

  List<List<String>> allRecords = [
    ['33', '987', '5/9/2020'],
    ['35', '96523584', '30/4/2020'],
    ['36', "569625", "4/9/2020"],
    ['36', "569625", "4/9/2020"],
    ['36', "569625", "4/9/2020"],
    ['36', "569625", "4/9/2020"],
    ['36', "569625", "4/9/2020"],
    ['40', 'م ش /38868/49273/2', '29/4/2018'],
  ];

  List<List<String>> companyRecordPersons = [
    ['75', 'تفويض قانوني ', 'تفويض منفرد', '2/6/2020 '],
    ['76', 'تفويض قانوني ', 'تفويض منفرد', '2/6/2020 '],
    ['77', 'تفويض قانوني ', 'تفويض منفرد', '2/6/2020 '],
    ['78', 'تفويض قانوني ', 'تفويض منفرد', '2/6/2020 '],
    ['78', 'تفويض قانوني ', 'تفويض منفرد', '2/6/2020 '],
    ['78', 'تفويض قانوني ', 'تفويض منفرد', '2/6/2020 '],
    ['78', 'تفويض قانوني ', 'تفويض منفرد', '2/6/2020 '],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  //   print("*********************************************");
  //   BlocProvider.of<CompanyCubit>(context)
  //       .company_Repo
  //       .createNewCompany(Company(
  //         id: 300,
  //         company_name: 'Jawwal',
  //         company_trademark: 'jawwal each day',
  //         company_title_id: 1,
  //         company_country_id: 1,
  //         company_type_id: 2,
  //         company_cat_id: 3,
  //         national_id: 500,
  //         registration_number: '123',
  //         phone: '0599',
  //         mobile: '155',
  //         email: 'At@gmail.com',
  //         a_address: 1,
  //         address_desc: 'address des',
  //         notes: 'reema notes',
  //       ))
  //       .then((value) => value);
  //   print("*********************************************");

  late Company companyDetail;
  final TextEditingController _textControllerForCompanyNameFeildOne =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNameFeildTwo =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNameFeildThree =
      TextEditingController();
  final TextEditingController _textControllerForTradeMark =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNameDescriptionFeildOne =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNameDescriptionFeildTwo =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNationalID =
      TextEditingController();

  final TextEditingController _textControllerForCompanyRegisterationNumber =
      TextEditingController();
  final TextEditingController _textControllerForCompanyCommercialNumber =
      TextEditingController();
  final TextEditingController _textControllerForCompanyRegisterationCharacter =
      TextEditingController();
  final TextEditingController _textControllerForCompanyTypeNumber =
      TextEditingController();
  final TextEditingController _textControllerForCompanyNationalNumber =
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
  String _selectedRegistrationCharacter = '';
  String _selectedCompanyType = '';
  String _selectedCompanyNationality = '';
  final GlobalKey<FormState> _formKey = GlobalKey(); // Global key for the form

  @override
  void dispose() {
    _textControllerForCompanyNameFeildOne.dispose();
    _textControllerForCompanyNameFeildTwo.dispose();
    _textControllerForCompanyNameFeildThree.dispose();
    _textControllerForTradeMark.dispose();
    _textControllerForCompanyNameDescriptionFeildOne.dispose();
    _textControllerForCompanyNameDescriptionFeildTwo.dispose();

    _textControllerForCompanyNationalID.dispose();
    _textControllerForCompanyRegisterationNumber.dispose();
    _textControllerForCompanyCommercialNumber.dispose();
    _textControllerForCompanyRegisterationCharacter.dispose();
    _textControllerForCompanyTypeNumber.dispose();
    _textControllerForCompanyNationalNumber.dispose();
    _textControllerForCompanyMobileNumber.dispose();
    _textControllerForCompanyTelephoneNumber.dispose();
    _textControllerForCompanyFaxNumber.dispose();
    _textControllerForCompanyEmail.dispose();
    _textControllerForCompanyAddressOne.dispose();
    _textControllerForCompanyAddressTwo.dispose();
    _textControllerForCompanyNotes.dispose();
    _tabController.dispose();

    super.dispose();
  }

  // void printAll() {
  //   // print(_textControllerForCompanyNameFeildOne.text);
  //   // print(_textControllerForCompanyNameFeildTwo.text);
  //   // print(_textControllerForCompanyNameFeildThree.text);
  //   // print(_textControllerForTradeMark.text);
  //   // print(_textControllerForCompanyNameDescriptionFeildOne.text);
  //   // print(_textControllerForCompanyNameDescriptionFeildTwo.text);
  //   // print(_textControllerForCompanyNationalID.text);
  //   // print(_textControllerForCompanyRegisterationNumber.text);
  //   // print(_textControllerForCompanyCommercialNumber.text);
  //   // print(_textControllerForCompanyRegisterationCharacter.text);
  //   // print(_textControllerForCompanyTypeNumber.text);
  //   // print(_textControllerForCompanyNationalNumber.text);
  //   // print(_textControllerForCompanyMobileNumber.text);
  //   // print(_textControllerForCompanyTelephoneNumber.text);
  //   // print(_textControllerForCompanyFaxNumber.text);
  //   // print(_textControllerForCompanyEmail.text);
  //   // print(_textControllerForCompanyAddressOne.text);
  //   // print(_textControllerForCompanyAddressTwo.text);
  //   // print(_textControllerForCompanyNotes.text);
  //   // print(_selectedCompanyNationality);

  //   // print(_selectedCompanyType);
  //   // print(_selectedRegistrationCharacter);
  // }
  dynamic _selectedImage;

  void _onImagePicked(dynamic image) {
    setState(() {
      _selectedImage = image;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        floatingActionButtonChoicesAppear: const [
          true,
          true,
          true,
          true,
          true,
          true
        ],
      ),
      appBar: AppBar(
        title: Text('المعلومات الأولية للمنشأة'),
        elevation: 0,
        backgroundColor: Colors.white24.withOpacity(0.5),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: SafeArea(
                          child: CustomBottomSheet(
                            filterColumn: "اسم المنشأة",
                            data: allcompanies,
                            title: 'الشركات',
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: const Color(0xffffc200),
                  size: 30.0,
                )),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        color: Colors.white24.withOpacity(0.8),
        child:
            // BlocBuilder<CompanyCubit, CompanyState>(builder: (context, state) {
            // if (state is CreateCompany) {
            // companyDetail = state.companyDetail;
            // print('*******************');
            // print(companyDetail.company_name);
            // return
            SingleChildScrollView(
          child: BlocListener<CompanyCubit, CompanyState>(
            listener: (context, state) {
              if (state is CompanyLoading) {
                // Show loading indicator
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is CompanySuccess) {
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is CompanyError) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else {
                print("--------------------------------");
                print(state);
                print("-----------------------");
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => print("hello"), child: Text("hello")),
                  CutomListTileWithTextFeild(
                    validator: (value) => IsTextEmpty(value),
                    controllers: [
                      _textControllerForCompanyNameFeildOne,
                      _textControllerForCompanyNameFeildTwo,
                      _textControllerForCompanyNameFeildThree
                    ],
                    numOfTxTf: 3,
                    labelExpanded: [1, 2, 1],
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
                      _textControllerForCompanyNameDescriptionFeildOne,
                      _textControllerForCompanyNameDescriptionFeildTwo,
                    ],
                    title: 'وصف المسمى',
                    numOfTxTf: 2,
                  ),
                  CutomListTileWithTextFeild(
                    // validator: (value) =>
                    //     numberGreaterThanFourValidation(value),
                    controllers: [
                      _textControllerForCompanyNationalID,
                    ],
                    title: 'الرقم الوطني للمنشأة ',
                    numOfTxTf: 1,
                  ),
                  CutomListTileWithTextFeild(
                    // validator: (value) =>
                    //     numberGreaterThanFourValidation(value),
                    controllers: [
                      _textControllerForCompanyRegisterationNumber,
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
                        validator: (value) => numberValidation(value),
                        onChanged: (dynamic newValue) {
                          _textControllerForCompanyTypeNumber.text = newValue;
                          // print("**************************");
                          // print(newValue.runtimeType);
                          // print("**************************");

                          // _selectedRegistrationCharacter = newValue!;
                        },
                        withTxt: true,
                        options: ['شركة تضامنية', 'شركة غير تضامنية'],
                      ),
                      title: 'صفة تسجيل المنشأة'),
                  CustomListTile(
                      element: CutomListTileWithdrop(
                        validator: (value) => numberValidation(value),
                        onChanged: (dynamic newValue) {
                          // print("**********************");
                          // print(newValue.runtimeType);
                          // print("**********************");

                          // _selectedCompanyType = newValue!;
                          _textControllerForCompanyTypeNumber.text = newValue;
                        },
                        withTxt: true,
                        options: ['منشأة حكومية', 'منشأة خاصة'],
                      ),
                      title: 'نوع المنشأة'),
                  CustomListTile(
                      element: CutomListTileWithdrop(
                        validator: (value) => numberValidation(value),
                        onChanged: (dynamic newValue) {
                          _textControllerForCompanyNationalID.text = newValue;
                          // _selectedCompanyNationality = newValue!;
                        },
                        withTxt: true,
                        options: ['اردنية', 'سعودية'],
                      ),
                      title: 'جنسية المنشأة'),
                  CutomListTileWithTextFeild(
                    // validator: (value) => phonenumberValidation(value),
                    controllers: [
                      _textControllerForCompanyMobileNumber,
                    ],
                    title: ' رقم  الموبايل ',
                    numOfTxTf: 1,
                  ),
                  CutomListTileWithTextFeild(
                    // validator: (value) => telePhonenumberValidation(value),
                    controllers: [
                      _textControllerForCompanyTelephoneNumber,
                    ],
                    title: ' رقم  الهاتف ',
                    numOfTxTf: 1,
                  ),
                  CutomListTileWithTextFeild(
                    // validator: (value) =>
                    //     numberGreaterThanFourValidation(value),
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
                  TextButton(
                      onPressed: () => print("hello"), child: Text("hello"))
                  // ElevatedButton(
                  //   onPressed: () {
                  //     print("dsg");
                  //     // uploadFile(_selectedImage);
                  //     // if (_formKey.currentState!.validate()) {
                  //     //   // // printAll();
                  //     //   // print(
                  //     //   //     "100%"); // Navigate to home screen if the form is valid

                  //     //   // BlocProvider.of<CompanyCubit>(context)
                  //     //   //     .company_Repo
                  //     //   //     .createNewCompany(newCompany);

                  //     //   context
                  //     //       .read<CompanyCubit>()
                  //     //       .emitCreateCompany(createCompany());
                  //     // }
                  //   },
                  //   child: const Text('سجل جديد'),
                  // )
                ],
              ),
            ),
          ),
        ),
        // }
        //   return Center(
        //     child: SingleChildScrollView(),
        //   );
        // }),
      ),
    );
  }

  Company createCompany() {
    late Company newCompany;
    try {
      newCompany = Company(
          picture: _selectedImage,
          company_name: _textControllerForCompanyNameFeildTwo.text +
              ' ' +
              _textControllerForCompanyNameFeildThree.text,
          company_trademark: _textControllerForTradeMark.text,
          company_title_id:
              int.parse(_textControllerForCompanyNameDescriptionFeildOne.text),
          company_country_id:
              int.tryParse(_textControllerForCompanyNationalID.text),
          company_type_id:
              int.tryParse(_textControllerForCompanyTypeNumber.text),
          company_cat_id:
              int.tryParse(_textControllerForCompanyTypeNumber.text),
          national_id: int.tryParse(_textControllerForCompanyNationalID.text),
          registration_number:
              _textControllerForCompanyRegisterationNumber.text,
          phone: _textControllerForCompanyTelephoneNumber.text,
          mobile: _textControllerForCompanyMobileNumber.text,
          email: _textControllerForCompanyEmail.text,
          notes: _textControllerForCompanyNotes.text,
          a_address: int.tryParse(_textControllerForCompanyAddressOne.text),
          address_desc: _textControllerForCompanyAddressTwo.text);
    } catch (e) {
      print("#########################");
      print(e.toString());
    }
    return newCompany;
  }
}

Future<void> uploadFile(String filePath) async {
  final dio = Dio();
  final fileName = filePath;

  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(filePath, filename: fileName),
  });
  try {
    final response = await dio.post(
      'https://srv568036.hstgr.cloud/api/company/create-company/',
      data: formData,
    );
    print('File upload response: ${response.data}');
  } catch (e) {
    print('File upload error: $e');
  }
}
