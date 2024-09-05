import 'package:flutter/material.dart';

import '../../../../core/helper/constants/my_colors.dart';
import 'company_shred_functionalities.dart';

class EditDeleteCompany extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function checkHasUpdates;
  final Function updateCreateCompany;
  final Function onUpdateCompany;
  final Function onDeleteCompany;
  final bool haveInternet;
  final dynamic selectedCompany;

  EditDeleteCompany({
    required this.formKey,
    required this.checkHasUpdates,
    required this.updateCreateCompany,
    required this.onUpdateCompany,
    required this.onDeleteCompany,
    required this.haveInternet,
    required this.selectedCompany,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              onPressed: () async {
                if (haveInternet) {
                  if (checkHasUpdates()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('تأكيد التعديل'),
                          content: Text(
                              'سيتم اجراء التعديلات بعد الضغط على زر تأكيد التعديل هل أنت متأكد من البيانات المعدلة؟'),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: MyColors.custom_blue,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('إلغاء'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  var company = await updateCreateCompany();
                                  onUpdateCompany(company);
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text('تأكيد التعديل'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showSnackbar(
                      context,
                      'لم تقم بأي تعديلات',
                      MyColors.custom_yellow,
                    );
                  }
                } else {
                  showSnackbar(
                    context,
                    'لا يوجد اتصال بالانترنت',
                    Colors.red,
                  );
                }
              },
              child: Text(
                "تعديل",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              onPressed: () {
                if (haveInternet) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('تأكيد الحذف'),
                          content:
                              Text('هل أنت متأكد أنك تريد حذف هذه الشركة؟'),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: MyColors.custom_blue,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('إلغاء'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                onDeleteCompany(selectedCompany.id!);
                                Navigator.of(context).pop();
                              },
                              child: Text('حذف'),
                            ),
                          ],
                        );
                      });
                } else {
                  showSnackbar(
                    context,
                    'لا يوجد اتصال بالانترنت',
                    Colors.red,
                  );
                }
              },
              child: Text(
                "حذف",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
