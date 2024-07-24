import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/widgets/custom_drop_down_widgett_.dart';

class CutomListTileWithdrop extends StatefulWidget {
  const CutomListTileWithdrop({
    Key? key,
    this.withTxt = true,
    required this.options,
  }) : super(key: key);
  final bool? withTxt;
  final List<String> options;
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
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: '',
                    ),
                  ),
                ),
                dropWithoutTxt(flex: 3, options: widget.options),
              ]
            : [dropWithoutTxt(options: widget.options)]);
  }

  Widget dropWithoutTxt({int flex = 1, required List<String> options}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomDropDownH(
          ListItem: options,
          hintText: 'اختر', //options[0]
          itemSelectedFunc: () {
            return '';
          },
        ),
      ),
    );
  }
}
