// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';
import 'package:nibras_group_jor/core/widgets/validations_rules.dart';

class CustomDropDownH<T> extends StatefulWidget {
  final String hintText;
  final ValueChanged<T?> onChanged;
  final List<String> ListItem;
  final bool homeDropDown;
  const CustomDropDownH({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.ListItem,
    required this.homeDropDown,
  }) : super(key: key);

  @override
  State<CustomDropDownH> createState() => _CustomDropDownHState();
}

class _CustomDropDownHState extends State<CustomDropDownH> {
  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      validator: validateDropdown,
      itemsListPadding: EdgeInsets.all(20),
      decoration: CustomDropdownDecoration(
        expandedSuffixIcon: Icon(
          Icons.arrow_drop_up_outlined,
          color: Colors.white,
        ),
        closedFillColor: MyColors.custom_yellow,
        closedBorderRadius: BorderRadius.circular(10),
        expandedFillColor:
            MyColors.custom_yellow, //const Color.fromARGB(255, 231, 196, 78),
        hintStyle: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        closedSuffixIcon: Icon(
          Icons.arrow_drop_down_outlined,
          color: Colors.white,
        ),
      ),
      hintText: widget.hintText,
      items: widget.ListItem,
      onChanged: (dynamic value) {
        if (widget.homeDropDown) {
          homeDropDownChoices(value);
        } else {
          int index = widget.ListItem.indexOf(value!);
          widget.onChanged(index.toString());
        }
      },
    );
    // widget.homeDropDown ? homeDropDownChoices : widget.onChanged);
  }

  void homeDropDownChoices(value) {
    if (widget.homeDropDown) {
      if (value == widget.ListItem[0]) {
        Navigator.pushNamed(context, firstCompanyInfo);
      } else if (value == widget.ListItem[1]) {
        Navigator.pushNamed(context, commercialRecord);
      } else if (value == widget.ListItem[2]) {
        Navigator.pushNamed(context, authorizedSignatories);
      }
    }
  }
}
