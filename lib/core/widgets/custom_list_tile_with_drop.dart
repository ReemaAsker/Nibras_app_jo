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
  // final DropController dropController = Get.put(DropController());

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
    String clickword = options[0];
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomDropDownH(
          ListItem: options,
          hintText: options[0],
          
          itemSelectedFunc: () {},
        ),
      ),
    );
  }
}
//   Widget dropWithoutTxt({int flex = 1,required List<String> options}) {
//     return Expanded(
//       flex: flex,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black,
//             ),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButton(
//             padding:
//                 EdgeInsets.symmetric(horizontal: 8), // Adjust padding as needed
//             isExpanded: true,
//             value: "القاهرة",
//             items: [
//               DropdownMenuItem(child: Text("القاهرة"), value: "القاهرة"),
//               DropdownMenuItem(
//                 child: Text("القدس"),
//                 value: "القدس",
//               ),
//             ],
//             onChanged: (value) {},
//             icon: Padding(
//               padding: EdgeInsets.only(right: 8), // Adjust padding as needed
//               child: Icon(Icons.arrow_circle_down_sharp),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
