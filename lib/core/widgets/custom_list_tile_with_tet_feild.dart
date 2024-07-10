import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

class CutomListTileWithTextFeild extends StatefulWidget {
  final String title;
  final int numOfTxTf;
  final int? maxline;
  final bool? withcolumn;
  final bool? enabled;
  final List<String>? hintLabel;
  const CutomListTileWithTextFeild({
    Key? key,
    required this.title,
    required this.numOfTxTf,
    this.maxline,
    this.withcolumn,
    this.enabled = true,
    this.hintLabel,
  }) : super(key: key);
  @override
  State<CutomListTileWithTextFeild> createState() => _CutomListTileState();
}

class _CutomListTileState extends State<CutomListTileWithTextFeild> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: List.generate(widget.numOfTxTf, (index) {
          return Expanded(
            flex: index + 1,
            child: Padding(
                padding: (widget.maxline != null && index == 1)
                    ? EdgeInsets.only(left: 20.0)
                    : EdgeInsets.only(left: 8.0),
                child: TextFormField(
                  enabled: widget.enabled,
                  maxLines: widget.maxline,
                  decoration: InputDecoration(
                    focusColor: MyColors.custom_yellow,
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: widget.hintLabel == null
                        ? ''
                        : widget.hintLabel![index],
                  ),
                  // hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                  style: TextStyle(height: 1),
                )),
          );
          const SizedBox(
            height: 20,
          );
        }),
      ),
    );
  }
}
