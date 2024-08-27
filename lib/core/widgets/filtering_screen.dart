import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/company_cubit.dart';
import '../../features/company/company_info/data/models/companyInfoFromApi.dart';

class FilteringScreen extends StatefulWidget {
  final String title;
  // final Function(bool) onCompanySelected;
  final CompanyCubit showCompanyCubit;
  const FilteringScreen({
    super.key,
    required this.title,
    // required this.onCompanySelected,
    required this.showCompanyCubit,
  });

  @override
  _FilteringScreenState createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen> {
  final TextEditingController _searchController = TextEditingController();
  // CompanyCubit showCompanyCubit = GetIt.instance<CompanyCubit>();

  @override
  void initState() {
    super.initState();

    widget.showCompanyCubit.filterCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.showCompanyCubit,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'بحث :  ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: widget.showCompanyCubit
                        .filterData, // Trigger filtering on text change
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
            child: BlocBuilder<CompanyCubit, CompanyState>(
                builder: (context, state) {
              if (state is CompanyLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: MyColors.custom_yellow,
                ));
              } else if (state is CompanySuccess) {
                final List<CompanyInfoFromApi> companyList = state.company;
                return showCompanies(companyList);
              } else if (state is CompanyError) {
                return Center(
                    child: Text(
                  'مشكلة في تحميل البيانات (افحص الانترنت)',
                  style: TextStyle(color: MyColors.custom_blue),
                ));
              } else if (state is CompanySearch) {
                return showCompanies(state.data);
              } else if (state is! DisplyingDataSuccess &&
                      state is! CompanyDeletedSuccess &&
                      state is! CompanyUpdatedSuccess
                  // state is! CompanyNotFound
                  ) {
                // Future.microtask(() {
                //   Navigator.of(context)
                //       .pushReplacementNamed(firstCompanyInfo ,);
                // });
                return Center(child: Text("لا شركات"));
              }
              return Text("");
            }),
          ),
        ],
      ),
    );
  }

  Widget showCompanies(List<CompanyInfoFromApi> filteredData) {
    return filteredData.length < 1
        ? Center(
            child: Text(
            'لا يوجد شركات',
            style: TextStyle(color: MyColors.custom_blue),
          ))
        : ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              if (index >= filteredData.length) {
                print(
                    'Index out of range: $index, length: ${filteredData.length}');
                return SizedBox
                    .shrink(); // Return an empty widget if index is out of range
              }
              final data = filteredData[index];
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: MyColors.custom_light_grey,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                    onTap: () {
                      widget.showCompanyCubit.fetchCompanyDetails(data.id);
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
}
