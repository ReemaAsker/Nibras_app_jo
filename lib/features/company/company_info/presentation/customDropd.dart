// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:nibras_group_jor/core/widgets/custom_drop_down_widgett_.dart';
import 'package:nibras_group_jor/features/company/company_info/business_logic/cubit/dropDown/dropDownCubit.dart';

import '../business_logic/cubit/company_cubit.dart';

// class Cutomdrop extends StatefulWidget {
//   List<String> genderItems;
//   bool withTxt;
//   bool? enabled;
//   var validator;

//   Cutomdrop({
//     Key? key,
//     required this.genderItems,
//     required this.withTxt,
//     this.enabled,
//     required this.validator,
//   }) : super(key: key);

//   @override
//   State<Cutomdrop> createState() => CutomdropState();
// }

// class CutomdropState extends State<Cutomdrop> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         children: widget.withTxt ?? true
//             ? [
//                 Expanded(
//                   child: TextFormField(
//                     validator: widget.validator,
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.all(10),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(8))),
//                       hintText: '',
//                     ),
//                   ),
//                 ),
//                 dropWithoutTxt(
//                   flex: 3,
//                   // options: widget.options,
//                   // onChanged: widget.onChanged
//                 ),
//               ]
//             : []);
//   }

//   Widget dropWithoutTxt({
//     int flex = 1,
//     // required List<String> options,
//     // required ValueChanged onChanged
//   }) {
//     return Expanded(
//       flex: flex,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: DropdownButtonFormField2<String>(
//           isExpanded: true,
//           decoration: InputDecoration(
//             // Add Horizontal padding using menuItemStyleData.padding so it matches
//             // the menu padding when button's width is not specified.
//             contentPadding: const EdgeInsets.symmetric(vertical: 16),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             // Add more decoration..
//           ),
//           hint: const Text(
//             'Select Your Gender',
//             style: TextStyle(fontSize: 14),
//           ),
//           items: widget.genderItems
//               .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(
//                       item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//               .toList(),
//           validator: (value) {
//             if (value == null) {
//               return 'Please select gender.';
//             }
//             return null;
//           },
//           onChanged: (value) {
//             //Do something when selected item is changed.
//           },
//           onSaved: (value) {
//             print(value);
//             // selectedValue = value.toString();
//           },
//           buttonStyleData: const ButtonStyleData(
//             padding: EdgeInsets.only(right: 8),
//           ),
//           iconStyleData: const IconStyleData(
//             icon: Icon(
//               Icons.arrow_drop_down,
//               color: Colors.black45,
//             ),
//             iconSize: 24,
//           ),
//           dropdownStyleData: DropdownStyleData(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ),
//           menuItemStyleData: const MenuItemStyleData(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//           ),
//         ),
//       ),
//     );
//   }
// }
class Cutomdrop extends StatefulWidget {
  final bool withTxt;
  final bool? enabled;
  final String? Function(String?)? validator;
  const Cutomdrop({
    Key? key,
    required this.withTxt,
    this.enabled,
    required this.validator,
  }) : super(key: key);

  @override
  State<Cutomdrop> createState() => CutomdropState();
}

class CutomdropState extends State<Cutomdrop> {
  DropdownCubit companyCubit = GetIt.instance<DropdownCubit>();

  @override
  void initState() {
    super.initState();
    // Fetch options when the widget is initialized
    companyCubit.fetchDropdownOptions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, List<String>>(
      builder: (context, genderItems) {
        return Row(
          children: widget.withTxt
              ? [
                  Expanded(
                    child: TextFormField(
                      validator: widget.validator,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        hintText: '',
                      ),
                      controller: TextEditingController(
                        text: context.read<DropdownCubit>().selectedValue,
                      ),
                    ),
                  ),
                  dropWithoutTxt(
                    genderItems: genderItems,
                    flex: 3,
                  ),
                ]
              : [],
        );
      },
    );
  }

  Widget dropWithoutTxt({
    required List<String> genderItems,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: const Text(
            'Select Your Gender',
            style: TextStyle(fontSize: 14),
          ),
          items: genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: (value) {
            if (value != null) {
              // Update the selected value in the cubit
              context.read<DropdownCubit>().selectValue(value);
            }
          },
          value: context.read<DropdownCubit>().selectedValue,
          onSaved: (value) {
            // Handle the saved value
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }
}
