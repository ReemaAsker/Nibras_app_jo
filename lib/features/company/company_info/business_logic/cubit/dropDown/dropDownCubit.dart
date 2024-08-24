import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownCubit extends Cubit<List<String>> {
  DropdownCubit() : super([]);

  String? selectedValue;

  // Method to fetch dropdown options from an API
  Future<void> fetchDropdownOptions() async {
    // Replace this with your API call
    List<String> fetchedOptions = await fetchOptionsFromApi();
    emit(fetchedOptions);
  }
// Future<List<CompanyType>> getCompanyTypes() async {
//     List<CompanyType> companies = await company_Repo.getCompanyTypes();

//     return companies;
//   }

  void selectValue(String value) {
    selectedValue = value;
    emit(state); // Emit the current state to force rebuild
  }

  Future<List<String>> fetchOptionsFromApi() async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    return ['Option 1', 'Option 2', 'Option 3'];
  }
}
