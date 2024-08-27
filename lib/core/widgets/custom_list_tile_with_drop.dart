import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import '../helper/constants/my_colors.dart';

class CustomListTileWithDrop<T> extends StatefulWidget {
  final bool? withTxt;
  final ValueChanged<dynamic> onChanged;
  final List<dynamic> items; // List of objects of the specified class
  final String Function(dynamic)
      itemFieldExtractor; // Extract the dropdown field
  String Function(dynamic)? itemFieldExtractorSuffix;
  final String Function(dynamic) idExtractor; // Extract the ID field
  String Function(dynamic)?
      descExtractor; // Extract the description field (e.g., compdesc)

  final bool homeDropDown;
  final String? Function(String?)? validator;
  final bool? enabled;

  CustomListTileWithDrop({
    Key? key,
    this.withTxt = true,
    required this.onChanged,
    required this.items,
    required this.itemFieldExtractor, // Extract the field for the dropdown
    required this.idExtractor, // Extract the ID field
    this.descExtractor, // Extract the description field
    this.homeDropDown = false,
    this.validator,
    this.enabled,
    this.itemFieldExtractorSuffix,
  }) : super(key: key);

  @override
  State<CustomListTileWithDrop> createState() => CustomListTileWithDropState();
}

class CustomListTileWithDropState<T> extends State<CustomListTileWithDrop<T>> {
  final TextEditingController _controller = TextEditingController();
  String? selectedDescription; // Add a field to store the description

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
                      controller: _controller,
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
                    items: widget.items,
                    onChanged: widget.onChanged,
                  ),
                ]
              : [
                  dropWithoutTxt(
                    items: widget.items,
                    onChanged: widget.onChanged,
                  ),
                ],
        ),
        if (selectedDescription != null && selectedDescription!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "الوصف : " + selectedDescription!,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
          ),
      ],
    );
  }

  Widget dropWithoutTxt({
    int flex = 1,
    required List<dynamic> items,
    required ValueChanged<dynamic> onChanged,
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
          items: items.map((item) {
            // Extract the primary text using itemFieldExtractor
            String displayText = widget.itemFieldExtractor(item);

            // Check if itemFieldExtractorSuffix is provided
            if (widget.itemFieldExtractorSuffix != null) {
              // Extract the suffix text using itemFieldExtractorSuffix
              String suffixText = widget.itemFieldExtractorSuffix!(item);

              // Combine displayText with suffixText, separated by a comma if suffixText is not empty
              displayText =
                  '$displayText${suffixText.isNotEmpty ? ", " : ""}$suffixText';
            }

            return displayText;
          }).toList(),
          onChanged: (dynamic value) {
            value = value.toString().contains(",")
                ? value.toString().split(",")[0]
                : value;
            final selectedItem = items
                .firstWhere((item) => widget.itemFieldExtractor(item) == value);
            final id = widget.idExtractor(selectedItem);
            final description = widget.descExtractor != null
                ? widget.descExtractor!(selectedItem)
                : null; // Get the description

            setState(() {
              _controller.text = id; // Update the TextFormField with the ID
              selectedDescription = description; // Update the description
            });

            widget
                .onChanged(selectedItem); // Pass the selected item to onChanged
          },
        ),
      ),
    );
  }
}
