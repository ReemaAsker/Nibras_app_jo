import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

// class CutomListTileWithTextFeild extends StatefulWidget {
//   final String title;
//   final int numOfTxTf;
//   final int? maxline;
//   final bool? withcolumn;
//   List<bool>? enabled = [];
//   final List<String>? hintLabel;
//   final List<int>? labelExpanded;
//   final List<TextEditingController>? controllers;
//   final String? Function(String?)? validator;

//   CutomListTileWithTextFeild({
//     Key? key,
//     required this.title,
//     required this.numOfTxTf,
//     this.maxline,
//     this.withcolumn,
//     this.enabled,
//     this.hintLabel,
//     this.labelExpanded,
//     this.controllers,
//     this.validator,
//   }) : super(key: key);
//   @override
//   State<CutomListTileWithTextFeild> createState() => _CutomListTileState();
// }

// class _CutomListTileState extends State<CutomListTileWithTextFeild> {
//   @override
//   void initState() {
// // Initialize enabled states with true if not provided
//     widget.enabled = widget.enabled ?? List.filled(widget.numOfTxTf, true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     widget.enabled = widget.enabled ?? List.filled(widget.numOfTxTf, true);

//     return ListTile(
//       title: Text(
//         widget.title,
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Row(
//         children: List.generate(widget.numOfTxTf, (index) {
//           return Expanded(
//             flex: widget.labelExpanded == null
//                 ? index + 1
//                 : widget.labelExpanded![index],
//             child: Padding(
//                 padding: (widget.maxline != null && index == 1)
//                     ? EdgeInsets.only(left: 20.0)
//                     : EdgeInsets.only(left: 8.0),
//                 child: TextFormField(
//                   validator: widget.validator,
//                   controller: widget.controllers![index],
//                   enabled: widget.enabled![index],
//                   maxLines: widget.maxline,
//                   decoration: InputDecoration(
//                     focusColor: MyColors.custom_yellow,
//                     contentPadding: EdgeInsets.all(8),
//                     hintStyle: TextStyle(
//                         color: widget.hintLabel == null
//                             ? Colors.black
//                             : Colors.blueGrey),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(8))),
//                     hintText: widget.hintLabel == null
//                         ? ''
//                         : widget.hintLabel![index],
//                   ),
//                   // hintStyle: TextStyle(fontWeight: FontWeight.bold)),
//                   style: TextStyle(height: 1),
//                 )),
//           );
//           const SizedBox(
//             height: 20,
//           );
//         }),
//       ),
//     );
//   }
// }
class CutomListTileWithTextFeild extends StatefulWidget {
  final String title;
  final int numOfTxTf;
  final int? maxline;
  final bool? withcolumn;
  List<bool>? enabled = [];
  final List<String>? hintLabel;
  final List<int>? labelExpanded;
  final List<TextEditingController>? controllers;
  final String? Function(String?)? validator;
  int? ignoreValidatorIndex;
  CutomListTileWithTextFeild({
    Key? key,
    required this.title,
    required this.numOfTxTf,
    this.maxline,
    this.withcolumn,
    this.enabled,
    this.hintLabel,
    this.labelExpanded,
    this.controllers,
    this.validator,
    this.ignoreValidatorIndex,
  }) : super(key: key);

  @override
  State<CutomListTileWithTextFeild> createState() => _CutomListTileState();
}

class _CutomListTileState extends State<CutomListTileWithTextFeild> {
  @override
  void initState() {
    // Initialize enabled states with true if not provided
    widget.enabled = widget.enabled ?? List.filled(widget.numOfTxTf, true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.enabled = widget.enabled ?? List.filled(widget.numOfTxTf, true);

    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: List.generate(widget.numOfTxTf, (index) {
          // Set hint text as the controller value if the field is disabled
          if (!widget.enabled![index] &&
              widget.controllers![index].text.isEmpty) {
            widget.controllers![index].text = widget.hintLabel?[index] ?? '';
          }

          return Expanded(
            flex: widget.labelExpanded == null
                ? index + 1
                : widget.labelExpanded![index],
            child: Padding(
              padding: (widget.maxline != null && index == 1)
                  ? EdgeInsets.only(left: 20.0)
                  : EdgeInsets.only(left: 8.0),
              child: TextFormField(
                validator: widget.ignoreValidatorIndex == index
                    ? null
                    : widget.validator,
                controller: widget.controllers![index],
                enabled: widget.enabled![index],
                maxLines: widget.maxline,
                decoration: InputDecoration(
                  focusColor: MyColors.custom_yellow,
                  contentPadding: EdgeInsets.all(8),
                  hintStyle: TextStyle(
                      color: widget.hintLabel == null
                          ? Colors.black
                          : Colors.blueGrey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText:
                      widget.hintLabel == null ? '' : widget.hintLabel![index],
                ),
                style: TextStyle(height: 1),
              ),
            ),
          );
        }),
      ),
    );
  }
}
