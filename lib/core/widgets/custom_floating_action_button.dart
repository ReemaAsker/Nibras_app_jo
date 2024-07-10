import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      switchLabelPosition: true,
      icon: Icons.more_vert,
      activeIcon: Icons.close,
      backgroundColor: Colors.amber[200],
      // foregroundColor: Colors.white,
      activeBackgroundColor: Colors.red,
      // activeForegroundColor: Colors.white,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      spaceBetweenChildren: 30,
      childrenButtonSize: Size(50, 50),
      children: [
        SpeedDialChild(
          elevation: 0,
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          label: 'سجل جديد',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w900, color: Colors.blue),
          onTap: () => showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              bool isConfirmed = false;
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text(
                      isConfirmed
                          ? 'تمت العملية بنجاح'
                          : 'هل انت متأكد من انشاء هذا السجل ؟',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    actions: <Widget>[
                      if (!isConfirmed)
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmed = true;
                            });
                          },
                          child: Text(
                            'موافق',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              isConfirmed ? Colors.blue : Colors.red,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          isConfirmed ? 'تم' : 'اغلاق',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SpeedDialChild(
          label: 'تعديل السجل',
          child: Icon(
            Icons.edit,
            color: Colors.orange,
          ),
          labelStyle:
              TextStyle(fontWeight: FontWeight.w900, color: Colors.orange),
          onTap: () => print(''),
        ),
        SpeedDialChild(
          label: 'حذف السجل',
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          labelStyle: TextStyle(fontWeight: FontWeight.w900, color: Colors.red),
          onTap: () => print(''),
        ),
        SpeedDialChild(
          label: 'حفظ السجل',
          // visible:,
          child: Icon(
            Icons.save,
            color: Colors.green,
          ),
          labelStyle:
              TextStyle(fontWeight: FontWeight.w900, color: Colors.green),
          onTap: () => print(''),
        ),
        SpeedDialChild(
          label: 'الغاء التعديل',
          // visible:,
          child: Icon(
            Icons.redo,
            color: Colors.purple,
          ),
          labelStyle:
              TextStyle(fontWeight: FontWeight.w900, color: Colors.purple),
          onTap: () => print(''),
        ),
        SpeedDialChild(
          label: 'طباعة التقرير',
          child: Icon(
            Icons.print,
          ),
          labelStyle: TextStyle(fontWeight: FontWeight.w900),
          onTap: () => print(''),
        ),
      ],
    );
  }
}
