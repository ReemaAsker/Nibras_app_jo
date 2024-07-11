import 'package:flutter/material.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

class CalendarPickerWidget extends StatefulWidget {
  final String initialDate;
  final Function(DateTime) onDateSelected;

  const CalendarPickerWidget({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _CalendarPickerWidgetState createState() => _CalendarPickerWidgetState();
}

class _CalendarPickerWidgetState extends State<CalendarPickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    // Parse initial date string to DateTime
    _selectedDate = DateTime.parse(widget.initialDate);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.custom_yellow,
        ),
        child: ListTile(
          leading: Icon(
            Icons.calendar_month_rounded,
            color: MyColors.custom_blue,
          ),
          trailing: Text(
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: TextStyle(
                  color: MyColors.custom_blue, backgroundColor: Colors.white)),
          title: Text('اضغط لاختيار التاريخ'),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              setState(() {
                _selectedDate = pickedDate;
              });
              widget.onDateSelected(pickedDate);
            }
          },
        ),
      ),
    );
  }
}
