// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nibras_group_jor/core/widgets/custom_drop_down_widgett_.dart';

class CutomListTileWithdrop<T> extends StatefulWidget {
  final bool? withTxt;
  final ValueChanged<T?> onChanged;
  final List<String> options;
  final bool homeDropDown;
  final String? Function(String?)? validator;

  const CutomListTileWithdrop({
    Key? key,
    this.withTxt = true,
    required this.onChanged,
    required this.options,
    this.homeDropDown = false,
    this.validator,
  }) : super(key: key);

  @override
  State<CutomListTileWithdrop> createState() => _CutomListTileState();
}

class _CutomListTileState extends State<CutomListTileWithdrop> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.withTxt ?? true
            ? [
                Expanded(
                  child: TextFormField(
                    validator: widget.validator,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: '',
                    ),
                  ),
                ),
                dropWithoutTxt(
                    flex: 3,
                    options: widget.options,
                    onChanged: widget.onChanged),
              ]
            : [
                dropWithoutTxt(
                    options: widget.options, onChanged: widget.onChanged)
              ]);
  }

  Widget dropWithoutTxt(
      {int flex = 1,
      required List<String> options,
      required ValueChanged onChanged}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomDropDownH(
          ListItem: options,
          onChanged: onChanged,
          hintText: 'اختر', //options[0]
          homeDropDown: widget.homeDropDown,
          // itemSelectedFunc: onChanged.
        ),
      ),
    );
  }
}
