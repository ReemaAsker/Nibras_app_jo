import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nibras_group_jor/core/helper/constants/my_colors.dart';

class CustomListTileWithDate extends StatefulWidget {
  const CustomListTileWithDate({
    super.key,
    required this.title,
    this.forEdit = true,
  });
  final String title;
  final forEdit;
  @override
  State<CustomListTileWithDate> createState() => _CustomListTileWithDateState();
}

class _CustomListTileWithDateState extends State<CustomListTileWithDate> {
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = DateTime.now();
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
        DateFormat('d/M/yyyy hh:mma').format(selectedDateTime);
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    color: MyColors.custom_light_grey,
                    child: Text(
                      formattedDateTime,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  widget.forEdit
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.custom_yellow,
                            foregroundColor: Colors.black,
                            elevation: 3,
                          ),
                          onPressed: () => _selectDateTime(context),
                          child: Row(
                            children: [
                              Icon(Icons.date_range),
                              Text(
                                'اختر التاريخ والوقت',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ))
                      : Text('')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
