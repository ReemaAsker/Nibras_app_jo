import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/company_cubit.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/CompanyRgistrationStatus.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_country_national.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/company_title.dart';
import 'package:nibras_group_jor/features/company/company_info/presentation/company_shred_functionalities.dart';
import 'package:nibras_group_jor/features/company/company_info/presentation/form_company.dart';
import '../../../../core/widgets/custom_list_tile_with_drop.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey(); // Global key for the form
  final TextEditingController _searchController = TextEditingController();

  String selectedCompanyTitleId = "";
  late Company companyDetail;
  Color? noActionColor;
  late dynamic _selectedImage = Icons.home;
  late int selectedId;
  bool _isSearch = false;
  bool _isDisplayAllCompanyData = false;
  int new_id = 0;
  List<CompanyRgistrationStatus> companyRgistrationStatus = [];
  List<CompanyCountryNational> companyNational = [];
  List<CompanyTitle> companyTitles = [];
  List<CompanyType> companyType = [
    CompanyType(id: 1, type: "منشأة خاصة"),
    CompanyType(id: 2, type: "منشأة حكومية")
  ];
  late Company savedCurrentDisplayingCompany;
  @override
  void initState() {
    companyCubit.noState().then((value) => new_id = value + 1);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget searchTextFeild() {
    return TextFormField(
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
    );
  }

  void _onImagePicked(dynamic image) {
    _selectedImage = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BlocBuilder<CompanyCubit, CompanyState>(
          builder: (context, state) {
            return AppBar(
              title: companyCubit.search
                  ? Text('الشركات')
                  : Text('المعلومات الأولية للمنشأة'),
              centerTitle: companyCubit.search,
              elevation: 0,
              backgroundColor: MyColors.custom_light_grey,
              automaticallyImplyLeading: !companyCubit.search,
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () {
                      companyCubit.toggleSearch();

                      if (!companyCubit.search) {
                        companyCubit.noState();
                      } else {
                        companyCubit.filterCompanies();
                      }
                    },
                    icon: Icon(
                      companyCubit.search ? Icons.close : Icons.search,
                      color: MyColors.custom_yellow,
                      size: 30.0,
                    ),
                  ),
                ),
                state is DisplayingDataSuccess && !companyCubit.search
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
                          ),
                        ),
                      )
                    : Text(""),
              ],
            );
          },
        ),
      ),
      body: mainWidget(),
    );
  }

  Widget _buildCompanyList(List<CompanyInfoFromApi>? companyList) {
    return RefreshIndicator(
      color: MyColors.custom_blue,
      backgroundColor: MyColors.custom_yellow,
      onRefresh: () async {
        await companyCubit.filterCompanies();
      },
      child: companyList == null
          ? _buildErrorState()
          : Column(
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
                                  savedCurrentDisplayingCompany = Company(
                                    id: data.id,
                                    company_name: data.companyName,
                                    company_trademark: '',
                                    company_title_id: 0,
                                    company_country_id: 0,
                                    company_type_id: 0,
                                    national_id: '',
                                    company_cat_id: 0,
                                    registration_number: '',
                                    phone: '',
                                    mobile: '',
                                    email: '',
                                    a_address: 20,
                                    address_desc: '',
                                    picture: null,
                                  );
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
                                  splitCompanyName(
                                      data.companyName)["ComName"]!,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                trailing: Icon(
                                  Icons.business_rounded,
                                  color: MyColors.custom_yellow,
                                )),
                          );
                        },
                      ),
              ],
            ),
    );
  }

  Widget mainWidget() {
    return RefreshIndicator(
      color: MyColors.custom_blue,
      backgroundColor: MyColors.custom_yellow,
      onRefresh: () async {
        if (companyCubit.appearCompanyData) {
          await companyCubit
              .fetchCompanyDetails(savedCurrentDisplayingCompany.id!);
        } else if (!companyCubit.search) {
          await companyCubit.noState();
        } else {
          await companyCubit.filterCompanies();
        }
      },
      child: BlocListener<CompanyCubit, CompanyState>(
        listener: (context, state) {
          handleStateChanges(context, state);
        },
        child: Center(
          child: SingleChildScrollView(
            child: BlocBuilder<CompanyCubit, CompanyState>(
              builder: (context, state) {
                if (state is CompanyLoading ||
                    state is CompanyFromAPILoading ||
                    state is CompanyFilteringLoading ||
                    state is NoStateLoading) {
                  return _buildLoadingIndicator();
                } else if (state is CompanyFromAPISuccess) {
                  return _buildCompanyList(state.company);
                } else if (state is CompanySearch) {
                  return _buildCompanyList(state.data);
                }
                //  else if (state is CompanyError && companyCubit.search) {
                //   return _buildCompanyList(null);
                // }
                else if (state is CompanyError) {
                  return _buildErrorState();
                } else if (state is DisplayingDataError) {
                  return _buildFormWithCompanyData(
                      savedCurrentDisplayingCompany);
                } else if (state is CompanyFromAPIError) {
                  return _buildCompanyList(null);
                } else if (state is DisplayingDataSuccess) {
                  // _isDisplayAllCompanyData = true;
                  // selectedId = state.data.id!;
                  // fillCompanyData(state.data);
                  // _showSuccessAlert(context, "تم تحميل بيانات الشركة",
                  // splitCompanyName(state.data.company_name!)["ComName"]!);
                  savedCurrentDisplayingCompany = state.data;
                  return _buildFormWithCompanyData(state.data);
                } else if (state is NoState) {
                  return _buildFormWithoutCompanyData(state.lastId + 1);
                }
                print("Sate is  >>>${state.runtimeType}");
                return _buildDefaultForm();
              },
            ),
          ),
        ),
      ),
    );
  }

  void handleStateChanges(BuildContext context, CompanyState state) {
    if (state is CompanyInternetError && companyCubit.search) {
      _buildCompanyList(null);
    } else if (state is CompanyInternetError) {
      _handleInternetError(context);
    } else if (state is NoState) {
      _handleNoState(state);
    } else if (state is CompanySuccess) {
      _showSuccessAlert(context, "تم الانشاء", state.message);
      companyCubit.noState();
    } else if (!_isSearch && state is CompanyError) {
      _showErrorAlert(context, "لا يوجد انترنت", state.message);
    } else if (state is CompanyDeletedSuccess) {
      _showSuccessAlert(context, "تم الحذف", state.message);
      _isDisplayAllCompanyData = false;
      companyCubit.noState();
    } else if (state is CompanyUpdatedSuccess) {
      _showSuccessAlert(context, "تم التعديل", state.message);
      _isDisplayAllCompanyData = false;
      // clearAllFields();
      companyCubit.noState();
    } else if (state is DisplayingDataSuccess) {
      _showSuccessAlert(context, "تم تحميل بيانات الشركة",
          splitCompanyName(state.data.company_name!)["ComName"]!);
    } else if (state is CompanyFromAPISuccess) {
      showSnackbar(context, 'تم تحميل البيانات', Colors.green);
    } else {}
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/loading.gif'),
          Text("جاري التحميل ..",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مشكلة في تحميل البيانات (افحص الانترنت)',
                  style: TextStyle(color: MyColors.custom_blue)),
              Text('حاول مرة اخرى وحدث الصفحة'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormWithCompanyData(Company selectedCompany) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormCompany(
            companyCubit: companyCubit,
            selectedCompany: selectedCompany,
            nId: selectedCompany.id!,
            companyNational: companyNational,
            companyRgistrationStatus: companyRgistrationStatus,
            companyTitles: companyTitles,
            companyType: companyType,
          ),
        ],
      ),
    );
  }

  Widget _buildFormWithoutCompanyData(int id) {
    return FormCompany(
      companyCubit: companyCubit,
      nId: id,
      companyNational: companyNational,
      companyRgistrationStatus: companyRgistrationStatus,
      companyTitles: companyTitles,
      companyType: companyType,
    );
  }

  Widget _buildDefaultForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormCompany(
            companyCubit: companyCubit,
            nId: new_id,
            companyNational: companyNational,
            companyRgistrationStatus: companyRgistrationStatus,
            companyTitles: companyTitles,
            companyType: companyType,
          ),
        ],
      ),
    );
  }

  void _handleInternetError(BuildContext context) {
    if (!_isDisplayAllCompanyData) {
      // clearAllFields();
    }
    CoolAlert.show(
      title: "خطأ",
      context: context,
      type: CoolAlertType.error,
      text: 'تعذر الاتصال بالإنترنت. يرجى التحقق من الاتصال الخاص بك',
    );
    noActionColor = Colors.black;
  }

  void _handleNoState(NoState state) {
    new_id = state.lastId + 1;
    companyRgistrationStatus = state.companyRgistrationStatus;
    companyNational = state.nationalites;
    companyTitles = state.CompanyTitles;
    noActionColor = MyColors.custom_blue;
    // clearAllFields();
  }

  void _showSuccessAlert(BuildContext context, String title, String message) {
    CoolAlert.show(
      title: title,
      context: context,
      type: CoolAlertType.success,
      text: message,
    );
  }

  void _showErrorAlert(BuildContext context, String title, String message) {
    CoolAlert.show(
      title: title,
      context: context,
      type: CoolAlertType.error,
      text: message,
    );
  }
}
