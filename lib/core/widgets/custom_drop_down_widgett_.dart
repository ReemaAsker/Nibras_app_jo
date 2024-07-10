import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';
import 'package:nibras_group_jor/core/helper/constants/strings.dart';

class CustomDropDownH extends StatefulWidget {
  final String hintText;
  final List<String> ListItem;
  final Function itemSelectedFunc;
  const CustomDropDownH({
    Key? key,
    required this.hintText,
    required this.ListItem,
    required this.itemSelectedFunc,
  }) : super(key: key);

  @override
  State<CustomDropDownH> createState() => _CustomDropDownHState();
}

class _CustomDropDownHState extends State<CustomDropDownH> {
  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
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
        onChanged: (value) {
          if (value == widget.ListItem[0]) {
            widget.itemSelectedFunc();
          }
        });
  }
}
