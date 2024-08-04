import 'package:flutter/material.dart';

import '../helper/constants/my_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon = const Text(''),
    Key? key,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          // style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: 8),
        TextFormField(
          validator: widget.validator,
          // (value) {
          //   if (value == null || value!.isEmpty) {
          //     return "* مطلوب";
          //   } else if (value.length < 6) {
          //     return "كلمة المرور خاطئة";
          //   }
          // },
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: MyColors.custom_dark_grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            // labelText: widget.label,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: MyColors.custom_yellow, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.custom_red,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.black),
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
