
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/extentiions/find_where_droppable.dart';
import 'package:nibras_group_jor/core/interfaces/droppable.dart';
import '../helper/constants/my_colors.dart';

class CustomListTileWithDrop<T extends Droppable> extends StatefulWidget {
  final bool? withTxt;
  final T? initialValue;
  final ValueChanged<T> onChanged;
  final List<T> items; // List of objects of the specified class
  final bool homeDropDown;
  final String? Function(String?)? validator;
  final bool? enabled;

  const CustomListTileWithDrop({
    super.key,
    this.withTxt = true,
    required this.onChanged,
    required this.items,
    this.homeDropDown = false,
    this.validator,
    this.enabled,
    this.initialValue,
  });

  @override
  State<CustomListTileWithDrop<T>> createState() =>
      CustomListTileWithDropState<T>();
}

class CustomListTileWithDropState<T extends Droppable>
    extends State<CustomListTileWithDrop<T>> {
  final TextEditingController _controller = TextEditingController();
  String? selectedDescription; // Add a field to store the description
  T? selected;
  @override
  void initState() {
    selected = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: widget.withTxt ?? true
              ? [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      style: const TextStyle(color: Colors.blueGrey),
                      controller:
                          TextEditingController(text: selected?.getId()),
                      validator: widget.validator,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        hintText: '',
                      ),
                    ),
                  ),
                  dropWithoutTxt(
                    flex: 3,
                    droppableList: widget.items,
                  ),
                ]
              : [
                  dropWithoutTxt(
                    droppableList: widget.items,
                  ),
                ],
        ),
        if (selected?.getDescription()?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "الوصف : " + selected!.getDescription()!,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
          ),
      ],
    );
  }

  Widget dropWithoutTxt({
    int flex = 1,
    required List<T> droppableList,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomDropdown(
          itemsListPadding: const EdgeInsets.all(20),
          decoration: CustomDropdownDecoration(
            expandedSuffixIcon: const Icon(
              Icons.arrow_drop_up_outlined,
              color: Colors.white,
            ),
            closedFillColor: MyColors.custom_yellow,
            closedBorderRadius: BorderRadius.circular(10),
            expandedFillColor: MyColors.custom_yellow,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            closedSuffixIcon: const Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.white,
            ),
          ),
          hintText: "اختر",
          // items: items.map((item) => widget.itemFieldExtractor(item)).toList(),
          // items: items.map((item) {
          //   String displayText = widget.itemFieldExtractor(item);
          //   if (widget.itemFieldExtractorSuffix != null) {
          //     String suffixText = widget.itemFieldExtractorSuffix!(item);
          //     displayText =
          //         '$displayText ${suffixText.isEmpty ? " " : ","} $suffixText ';
          //   }
          //   return displayText;
          // }).toList(),
          initialItem: widget.initialValue?.getDropValue(),
          items: droppableList
              .map((droppable) => droppable.getDropValue())
              .toList(),
          onChanged: (value) {
            setState(() {
              selected = droppableList.findWhereDroppableValue(value) as T;
            });
            if (selected != null) {
              widget.onChanged(selected!);
            }
          },
        ),
      ),
    );
  }
}
